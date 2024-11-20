import controlador.ControladorPrincipal;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.lang.reflect.Method;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import modelo.dao.UsuarioDAO;
import modelo.dto.Usuario;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

class ControladorPrincipalTest {

    @InjectMocks
    private ControladorPrincipal controlador;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private HttpSession session;

    @Mock
    private UsuarioDAO usuarioDAO;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    /**
     * Invoca un método privado usando Reflection.
     */
    private void invocarMetodoPrivado(String nombreMetodo, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Method metodo = ControladorPrincipal.class.getDeclaredMethod(nombreMetodo, HttpServletRequest.class, HttpServletResponse.class);
        metodo.setAccessible(true);  // Habilitar acceso a métodos privados
        metodo.invoke(controlador, request, response);
    }

    @Test
    void testIniciarSesionExitoso() throws Exception {
        when(request.getParameter("dni")).thenReturn("12345678");
        when(request.getParameter("contrasena")).thenReturn("password");
        Usuario usuario = new Usuario("Juan", "Perez", 987654321, "juan@example.com", 12345678, "password", "usuario");
        when(usuarioDAO.iniciarSesion("12345678", "password")).thenReturn(usuario);
        when(request.getSession()).thenReturn(session);

        invocarMetodoPrivado("iniciarSesion", request, response);

        verify(session).setAttribute("usuarioAutenticado", usuario);
        verify(response).sendRedirect(request.getContextPath() + "/index.jsp");
    }

    @Test
    void testIniciarSesionFallido() throws Exception {
        when(request.getParameter("dni")).thenReturn("12345678");
        when(request.getParameter("contrasena")).thenReturn("wrongpassword");
        when(usuarioDAO.iniciarSesion("12345678", "wrongpassword")).thenReturn(null);

        invocarMetodoPrivado("iniciarSesion", request, response);

        verify(response).sendRedirect(request.getContextPath() + "/errorInicioSesion.jsp");
    }

    @Test
    void testRegistrarUsuarioExitoso() throws Exception {
        when(request.getParameter("nombre")).thenReturn("Juan");
        when(request.getParameter("apellido")).thenReturn("Perez");
        when(request.getParameter("celular")).thenReturn("987654321");
        when(request.getParameter("correo")).thenReturn("juan@example.com");
        when(request.getParameter("dni")).thenReturn("12345678");
        when(request.getParameter("contrasena")).thenReturn("password");
        when(usuarioDAO.registrarUsuario(any(Usuario.class))).thenReturn(true);

        invocarMetodoPrivado("registrarUsuario", request, response);

        verify(response).sendRedirect(request.getContextPath() + "/vista/Iniciarsesion.jsp");
    }

    @Test
    void testRegistrarUsuarioFallido() throws Exception {
        when(request.getParameter("nombre")).thenReturn("Juan");
        when(usuarioDAO.registrarUsuario(any(Usuario.class))).thenReturn(false);

        invocarMetodoPrivado("registrarUsuario", request, response);

        verify(response).sendRedirect(request.getContextPath() + "/errorRegistro.jsp");
    }

    @Test
    void testCerrarSesion() throws Exception {
        when(request.getSession()).thenReturn(session);

        invocarMetodoPrivado("cerrarSesion", request, response);

        verify(session).invalidate();
        verify(response).sendRedirect(request.getContextPath() + "/index.jsp");
    }
}

