/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.Asesor;
import servicios.ConectaDB;

/**
 * La clase AsesorDAO se encarga de gestionar las operaciones relacionadas con
 * los asesores en la base de datos, como obtener todos los registros de
 * asesores. Utiliza la conexión proporcionada por la clase {@link ConectaDB}.
 *
 * @author Acer
 */
public class AsesorDAO {

    /**
     * Conexión a la base de datos.
     */
    private Connection cnx;

    /**
     * Constructor de la clase AsesorDAO. Inicializa la conexión a la base de
     * datos.
     */
    public AsesorDAO() {
        cnx = new ConectaDB().getConexion();
    }

    /**
     * Obtiene la lista completa de todos los asesores registrados en la base de
     * datos.
     *
     * @return Una lista de objetos {@link Asesor}, cada uno representando un
     * asesor.
     */
    public List<Asesor> obtenerTodosLosAsesores() {
        List<Asesor> asesores = new ArrayList<>();
        String sql = "SELECT * FROM asesor";

        try (
                // Obtener conexión y preparar la consulta SQL
                Connection conn = new ConectaDB().getConexion(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            // Iterar sobre los resultados de la consulta
            while (rs.next()) {
                // Crear un objeto Asesor por cada fila obtenida
                Asesor asesor = new Asesor(
                        rs.getInt("id_asesor"),
                        rs.getString("nombrease"),
                        rs.getString("apellidosase"),
                        rs.getDouble("costo")
                );
                asesores.add(asesor); // Agregar el asesor a la lista
            }

        } catch (SQLException e) {
            // Manejo básico de excepciones SQL
            e.printStackTrace();
        }

        return asesores;
    }

    public boolean actualizarAsesor(Asesor asesor) {
        String sql = "UPDATE asesor SET nombrease = ?, apellidosase = ?, costo = ? WHERE id_asesor = ?";

        try (Connection conn = new ConectaDB().getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, asesor.getNombreAse());
            ps.setString(2, asesor.getApellidosAse());
            ps.setDouble(3, asesor.getCosto());
            ps.setInt(4, asesor.getIdAsesor());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Devuelve true si se actualizó al menos una fila

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Elimina un asesor de la base de datos según su ID.
     *
     * @param id El ID del asesor a eliminar.
     * @return true si la eliminación fue exitosa, false en caso contrario.
     */
    public boolean eliminarAsesor(int id) {
        String sql = "DELETE FROM asesor WHERE id_asesor = ?";

        try (Connection conn = new ConectaDB().getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0; // Devuelve true si se eliminó al menos una fila

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
