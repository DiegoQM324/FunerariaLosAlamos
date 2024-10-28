package modelo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.Difunto;
import servicios.ConectaDB;

public class DifuntoDAO {

    private Connection cnx;

    public DifuntoDAO() {
        cnx = new ConectaDB().getConexion();
    }

    public boolean registrarDifunto(Difunto difunto) {
        String sql = "INSERT INTO difunto (nombredif, apellidosdif, fec_nacimiento,  fec_fallecimiento, lugar_fallecimiento) VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setString(1, difunto.getNombreDif());
            ps.setString(2, difunto.getApellidosDif());

            // Convertir java.util.Date a java.sql.Date antes de pasarlo al PreparedStatement
            Date sqlFechaNacimiento = difunto.getFecNacimiento() != null ? new Date(difunto.getFecNacimiento().getTime()) : null;
            Date sqlFechaFallecimiento = difunto.getFecFallecimiento() != null ? new Date(difunto.getFecFallecimiento().getTime()) : null;

            ps.setDate(3, sqlFechaNacimiento);
            ps.setDate(4, sqlFechaFallecimiento);
            ps.setString(5, difunto.getLugarFallecimiento());

            int filasAfectadas = ps.executeUpdate();

            // Verifica si la inserción fue exitosa
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Difunto> obtenerTodosLosDifuntos() {
        List<Difunto> difuntos = new ArrayList<>();

        String sql = "SELECT * FROM difunto";

        try (
                // Obtener conexión y preparar la consulta SQL
                Connection conn = new ConectaDB().getConexion(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            // Iterar sobre los resultados de la consulta
            while (rs.next()) {
                // Crear un objeto Asesor por cada fila obtenida
                Difunto difunto = new Difunto(
                        rs.getInt("id_difunto"),
                        rs.getString("nombredif"),
                        rs.getString("apellidosdif"),
                        rs.getDate("fec_nacimiento"),
                        rs.getDate("fec_fallecimiento"),
                        rs.getString("lugar_fallecimiento")
                );
                difuntos.add(difunto); // Agregar el asesor a la lista
            }

        } catch (SQLException e) {
            // Manejo básico de excepciones SQL
            e.printStackTrace();
        }

        return difuntos;

    }

}
