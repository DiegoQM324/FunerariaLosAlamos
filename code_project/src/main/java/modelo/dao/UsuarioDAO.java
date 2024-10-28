/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.Usuario;
import servicios.ConectaDB;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Clase DAO para realizar operaciones CRUD (Create, Read, Update, Delete) sobre
 * la entidad Usuario. Contiene métodos para registrar, obtener, actualizar y
 * eliminar usuarios, así como iniciar sesión.
 */
public class UsuarioDAO {

    private Connection cnx; // Conexión a la base de datos
    private static final Logger logger = LoggerFactory.getLogger(UsuarioDAO.class); // Logger para registrar eventos

    /**
     * Constructor que inicializa la conexión a la base de datos utilizando la
     * clase ConectaDB.
     */
    public UsuarioDAO() {
        cnx = new ConectaDB().getConexion();
    }

    /**
     * Obtiene la lista de todos los usuarios con rol "usuario" desde la base de
     * datos.
     *
     * @return Lista de objetos Usuario
     */
    public List<Usuario> obtenerUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario WHERE rol = 'usuario'";

        try (Connection conn = new ConectaDB().getConexion(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            // Itera sobre los resultados y construye objetos Usuario.
            while (rs.next()) {
                Usuario usuario = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("nombre"),
                        rs.getString("apellidos"),
                        rs.getInt("celular"),
                        rs.getString("correo"),
                        rs.getInt("dni"),
                        rs.getString("contraseña"),
                        rs.getString("rol")
                );
                usuarios.add(usuario); // Agrega cada usuario a la lista
                System.out.println("Usuario agregado: " + usuario.getNombre() + " " + usuario.getApellidos());
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo básico de excepciones
        }

        System.out.println("Total de usuarios obtenidos: " + usuarios.size());
        return usuarios;
    }

    /**
     * Registra un nuevo usuario en la base de datos.
     *
     * @param usuario Objeto Usuario que se va a registrar
     * @return true si el registro fue exitoso, false en caso contrario
     */
    public boolean registrarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuario (nombre, apellidos, rol, celular, correo, dni, contraseña) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellidos());
            ps.setString(3, usuario.getRol());
            ps.setInt(4, usuario.getCelular());
            ps.setString(5, usuario.getCorreo());
            ps.setInt(6, usuario.getDni());
            ps.setString(7, usuario.getContrasena());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0; // Retorna true si se insertó con éxito

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Inicia sesión verificando las credenciales proporcionadas.
     *
     * @param dni DNI del usuario
     * @param contraseña Contraseña del usuario
     * @return Objeto Usuario si las credenciales son válidas, null en caso
     * contrario
     */
    public Usuario iniciarSesion(String dni, String contraseña) {
        String sql = "SELECT * FROM usuario WHERE dni = ? AND contraseña = ?";
        Usuario usuarioAutenticado = null;

        try {
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setString(1, dni);
            ps.setString(2, contraseña);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuarioAutenticado = new Usuario();
                usuarioAutenticado.setId_usuario(rs.getInt("id_usuario"));
                usuarioAutenticado.setNombre(rs.getString("nombre"));
                usuarioAutenticado.setApellidos(rs.getString("apellidos"));
                usuarioAutenticado.setDni(rs.getInt("dni"));
                usuarioAutenticado.setRol(rs.getString("rol"));
                usuarioAutenticado.setCorreo(rs.getString("correo"));
                usuarioAutenticado.setCelular(rs.getInt("celular"));
            } else {
                System.out.println("Credenciales incorrectas: no se encontró el usuario.");
            }
        } catch (SQLException e) {
            logger.error("Error al iniciar sesión para el DNI: {}", dni, e); // Uso de Logback para registrar errores
        }

        return usuarioAutenticado;
    }

    /**
     * Actualiza los datos de un usuario existente en la base de datos.
     *
     * @param usuario Objeto Usuario con los datos actualizados
     * @return true si la actualización fue exitosa, false en caso contrario
     */
    public boolean actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nombre = ?, apellidos = ?, celular = ?, correo = ?, dni = ? WHERE id_usuario = ?";

        try (Connection conn = new ConectaDB().getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellidos());
            ps.setInt(3, usuario.getCelular());
            ps.setString(4, usuario.getCorreo());
            ps.setInt(5, usuario.getDni());
            ps.setInt(6, usuario.getId_usuario());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Elimina un usuario de la base de datos utilizando su ID.
     *
     * @param idUsuario ID del usuario a eliminar
     * @return true si la eliminación fue exitosa, false en caso contrario
     */
    public boolean eliminarUsuario(int idUsuario) {
        String sql = "DELETE FROM usuario WHERE id_usuario = ?";

        try (Connection conn = new ConectaDB().getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
