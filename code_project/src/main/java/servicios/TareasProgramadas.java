/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servicios;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author HP
 */
public class TareasProgramadas {

    public static void main(String[] args) {
        // Programar el respaldo para que se ejecute cada 24 horas
        Executors.newSingleThreadScheduledExecutor().scheduleAtFixedRate(() -> {
            realizarRespaldo();
        }, 0, 24, TimeUnit.HOURS);
    }

    ;
        
        

    private static void realizarRespaldo() {
        String usuario = "root";
        String contrasena = "root";
        String nombreBaseDeDatos = "losalamos";
        String rutaRespaldo = "C:\\Program Files\\MySQL\\WW.sql"; // Ruta donde deseas guardar el archivo de respaldo

        // Comando para hacer el respaldo
        String mysqldumpPath = "\"C:\\Program Files\\MySQL\\MySQL Server 9.1\\bin\\mysqldump\"";
        String comando = mysqldumpPath + " -u " + usuario + " --password=" + contrasena + " " + nombreBaseDeDatos + " > \"" + rutaRespaldo + "\"";

        try {
            // Ejecutar el proceso
            Process proceso = Runtime.getRuntime().exec(comando);

            // Leer la salida estándar y la salida de error
            BufferedReader reader = new BufferedReader(new InputStreamReader(proceso.getInputStream()));
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println("Salida: " + linea);  // Imprimir salida estándar
            }

            // Esperar que el proceso termine
            int procesoExit = proceso.waitFor();
            if (procesoExit == 0) {
                System.out.println("Respaldo realizado correctamente.");
            } else {
                System.out.println("Respaldo realizado correctamente.");
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

}
