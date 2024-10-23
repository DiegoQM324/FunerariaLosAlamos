/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 *
 * @author Acer
 */
public class Servicio {

    private int idServicio;
    private String nombreSer;
    private String descripcion;
    private int idPlan;
    private int idAsesor;

    public Servicio() {
    }

    public Servicio(int idServicio, String nombreSer, String descripcion, int idPlan, int idAsesor) {
        this.idServicio = idServicio;
        this.nombreSer = nombreSer;
        this.descripcion = descripcion;
        this.idPlan = idPlan;
        this.idAsesor = idAsesor;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public String getNombreSer() {
        return nombreSer;
    }

    public void setNombreSer(String nombreSer) {
        this.nombreSer = nombreSer;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    public int getIdAsesor() {
        return idAsesor;
    }

    public void setIdAsesor(int idAsesor) {
        this.idAsesor = idAsesor;
    }
    
    

}
