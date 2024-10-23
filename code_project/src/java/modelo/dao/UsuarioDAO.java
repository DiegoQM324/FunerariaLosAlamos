/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import java.sql.*;
import modelo.dto.Usuario;
import servicios.ConectaDB;

/**
 *
 * @author Acer
 */
public class UsuarioDAO {
    
    private Connection cnx;
    
    public UsuarioDAO() {
        cnx = new ConectaDB().getConexion();
        
    }
    
    public boolean registrarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuario (nombre, apellidos, rol,  celular, correo,dni, contraseña) VALUES (?, ?, ?, ?, ?,?,?)";
        
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

            // Verifica si la inserción fue exitosa
            return filasAfectadas > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        
    }
    
    public Usuario iniciarSesion(String dni, String contraseña) {
        String sql = "SELECT * FROM usuario WHERE dni = ? AND contraseña = ?";
        Usuario usuarioAutenticado = null;
        
        try {
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setString(1, dni);
            ps.setString(2, contraseña);
            
            ResultSet rs = ps.executeQuery();

            // Si se encuentra el usuario, se crea el objeto Usuario
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
            e.printStackTrace();
        }
        
        return usuarioAutenticado;  // Retorna null si no encuentra coincidencia
    }
    
}
