import controlador.ControladorUsuarios;
import modelo.dao.UsuarioDAO;
import modelo.dto.Usuario;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class ControladorUsuariosTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private UsuarioDAO usuarioDAO;

    @InjectMocks
    private ControladorUsuarios controladorUsuarios;

    private StringWriter responseWriter;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        responseWriter = new StringWriter();
        when(response.getWriter()).thenReturn(new PrintWriter(responseWriter));
    }

    @Test
    void testEditarUsuario_Exitoso() throws Exception {
        when(request.getParameter("accion")).thenReturn("Editar");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("nombre")).thenReturn("John");
        when(request.getParameter("apellido")).thenReturn("Doe");
        when(request.getParameter("celular")).thenReturn("123456789");
        when(request.getParameter("correo")).thenReturn("john@example.com");
        when(request.getParameter("dni")).thenReturn("12345678");
        when(request.getParameter("contrasena")).thenReturn("password");
        when(request.getParameter("rol")).thenReturn("admin");

        Usuario usuario = new Usuario(1, "John", "Doe", 123456789, "john@example.com", 12345678, "password", "admin");
        when(usuarioDAO.actualizarUsuario(any(Usuario.class))).thenReturn(true);

        controladorUsuarios.service(request, response);

        verify(response).sendRedirect(anyString());
    }

    @Test
    void testEliminarUsuario_Exitoso() throws Exception {
        when(request.getParameter("accion")).thenReturn("Eliminar");
        when(request.getParameter("id")).thenReturn("1");

        when(usuarioDAO.eliminarUsuario(1)).thenReturn(true);

        controladorUsuarios.service(request, response);

        verify(response).sendRedirect(anyString());
    }

    @Test
    void testEliminarUsuario_Fallido() throws Exception {
        when(request.getParameter("accion")).thenReturn("Eliminar");
        when(request.getParameter("id")).thenReturn("1");

        when(usuarioDAO.eliminarUsuario(1)).thenReturn(false);

        controladorUsuarios.service(request, response);

        assertEquals("Error al eliminar usuario.\n", responseWriter.toString());
    }

    @Test
    void testExportarUsuarios() throws Exception {
        when(request.getParameter("accion")).thenReturn("exportarExcel");

        List<Usuario> usuarios = new ArrayList<>();
        usuarios.add(new Usuario(1, "John", "Doe", 123456789, "john@example.com", 12345678, "password", "admin"));
        when(usuarioDAO.obtenerUsuarios()).thenReturn(usuarios);

        controladorUsuarios.service(request, response);

        verify(response).setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        verify(response).setHeader(eq("Content-Disposition"), contains("usuarios.xlsx"));
    }
}