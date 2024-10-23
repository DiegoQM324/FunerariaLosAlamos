/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

import java.util.Date;

/**
 *
 * @author Acer
 */
public class Difunto {
    
    private int idDifunto;
    private String nombreDif;
    private String apellidosDif;
    private Date fecNacimiento;
    private Date fecFallecimiento;
    private String lugarFallecimiento;

    public Difunto() {
    }

    public Difunto(int idDifunto, String nombreDif, String apellidosDif, Date fecNacimiento, Date fecFallecimiento, String lugarFallecimiento) {
        this.idDifunto = idDifunto;
        this.nombreDif = nombreDif;
        this.apellidosDif = apellidosDif;
        this.fecNacimiento = fecNacimiento;
        this.fecFallecimiento = fecFallecimiento;
        this.lugarFallecimiento = lugarFallecimiento;
    }

    public int getIdDifunto() {
        return idDifunto;
    }

    public void setIdDifunto(int idDifunto) {
        this.idDifunto = idDifunto;
    }

    public String getNombreDif() {
        return nombreDif;
    }

    public void setNombreDif(String nombreDif) {
        this.nombreDif = nombreDif;
    }

    public String getApellidosDif() {
        return apellidosDif;
    }

    public void setApellidosDif(String apellidosDif) {
        this.apellidosDif = apellidosDif;
    }

    public Date getFecNacimiento() {
        return fecNacimiento;
    }

    public void setFecNacimiento(Date fecNacimiento) {
        this.fecNacimiento = fecNacimiento;
    }

    public Date getFecFallecimiento() {
        return fecFallecimiento;
    }

    public void setFecFallecimiento(Date fecFallecimiento) {
        this.fecFallecimiento = fecFallecimiento;
    }

    public String getLugarFallecimiento() {
        return lugarFallecimiento;
    }

    public void setLugarFallecimiento(String lugarFallecimiento) {
        this.lugarFallecimiento = lugarFallecimiento;
    }
    
    
    
}
