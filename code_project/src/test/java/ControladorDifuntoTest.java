import controlador.ControladorDifunto;
import modelo.dao.DifuntoDAO;
import modelo.dto.Difunto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class ControladorDifuntoTest {

    @InjectMocks
    private ControladorDifunto controlador;

    @Mock
    private DifuntoDAO difuntoDAO;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    private SimpleDateFormat dateFormat;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    }

    @Test
    void testRegistrarDifunto_RegistroExitoso() throws Exception {
        // Datos simulados del formulario
        when(request.getParameter("accion")).thenReturn("Registrar");
        when(request.getParameter("nombre")).thenReturn("Juan");
        when(request.getParameter("apellido")).thenReturn("Pérez");
        when(request.getParameter("fechaNacimiento")).thenReturn("1990-01-01");
        when(request.getParameter("fechaFallecimiento")).thenReturn("2024-10-28");
        when(request.getParameter("lugar")).thenReturn("Ciudad");

        // Simular que el registro es exitoso
        when(difuntoDAO.registrarDifunto(any(Difunto.class))).thenReturn(true);

        // Ejecutar el método
        controlador.service(request, response);

        // Verificar que se hizo una redirección correcta
        verify(response).sendRedirect(anyString());
    }

    @Test
    void testRegistrarDifunto_RegistroFallido() throws Exception {
        // Datos simulados del formulario
        when(request.getParameter("accion")).thenReturn("Registrar");
        when(request.getParameter("nombre")).thenReturn("Juan");
        when(request.getParameter("apellido")).thenReturn("Pérez");
        when(request.getParameter("fechaNacimiento")).thenReturn("1990-01-01");
        when(request.getParameter("fechaFallecimiento")).thenReturn("2024-10-28");
        when(request.getParameter("lugar")).thenReturn("Ciudad");

        // Simular que el registro falla
        when(difuntoDAO.registrarDifunto(any(Difunto.class))).thenReturn(false);

        // Ejecutar el método
        controlador.service(request, response);

        // Verificar que se redirige a la página de error
        verify(response).sendRedirect(contains("errorRegistro.jsp"));
    }

    
}
