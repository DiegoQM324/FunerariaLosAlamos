/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 *
 * @author Acer
 */
public class Asesor {
     private int idAsesor;
    private String nombreAse;
    private String apellidosAse;
    private double costo;

    public Asesor() {
    }

    public Asesor(int idAsesor, String nombreAse, String apellidosAse, double costo) {
        this.idAsesor = idAsesor;
        this.nombreAse = nombreAse;
        this.apellidosAse = apellidosAse;
        this.costo = costo;
    }

    public int getIdAsesor() {
        return idAsesor;
    }

    public void setIdAsesor(int idAsesor) {
        this.idAsesor = idAsesor;
    }

    public String getNombreAse() {
        return nombreAse;
    }

    public void setNombreAse(String nombreAse) {
        this.nombreAse = nombreAse;
    }

    public String getApellidosAse() {
        return apellidosAse;
    }

    public void setApellidosAse(String apellidosAse) {
        this.apellidosAse = apellidosAse;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    
    
}
