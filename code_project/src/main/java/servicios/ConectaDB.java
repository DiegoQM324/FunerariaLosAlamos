/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servicios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Acer
 */
public class ConectaDB {

    public Connection getConexion() {
        Connection cnx = null;

        // URL de conexión con configuración adecuada para UTF-8
        String url = "jdbc:mysql://localhost:3306/losalamos?useUnicode=true&characterEncoding=utf8&useTimeZone=true&serverTimezone=UTC&autoReconnect=true";
        String user = "root";
        String clave = "root324";
        String Driver = "com.mysql.cj.jdbc.Driver";

        try {
            Class.forName(Driver); 
            cnx = DriverManager.getConnection(url, user, clave); // Establecer la conexión

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConectaDB.class.getName()).log(Level.SEVERE, "Error cargando el driver JDBC", ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDB.class.getName()).log(Level.SEVERE, "Error al conectar con la base de datos", ex);
        }
        return cnx; 
    }

    public static void main(String[] args) throws SQLException {
        Connection cnx = new ConectaDB().getConexion();
        System.out.println("" + cnx.getCatalog());

    }

}
