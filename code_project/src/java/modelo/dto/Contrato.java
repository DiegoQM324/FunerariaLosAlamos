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
public class Contrato {

    private int idContrato;
    private Date fecCreacion;
    private String estado;
    private Date fecInicio;
    private Date fecFinalizacion;
    private int idPago;
    private int idUsuario;
    private int idServicio;

    public Contrato() {
    }

    public Contrato(int idContrato, Date fecCreacion, String estado, Date fecInicio, Date fecFinalizacion, int idPago, int idUsuario, int idServicio) {
        this.idContrato = idContrato;
        this.fecCreacion = fecCreacion;
        this.estado = estado;
        this.fecInicio = fecInicio;
        this.fecFinalizacion = fecFinalizacion;
        this.idPago = idPago;
        this.idUsuario = idUsuario;
        this.idServicio = idServicio;
    }

    public int getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(int idContrato) {
        this.idContrato = idContrato;
    }

    public Date getFecCreacion() {
        return fecCreacion;
    }

    public void setFecCreacion(Date fecCreacion) {
        this.fecCreacion = fecCreacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFecInicio() {
        return fecInicio;
    }

    public void setFecInicio(Date fecInicio) {
        this.fecInicio = fecInicio;
    }

    public Date getFecFinalizacion() {
        return fecFinalizacion;
    }

    public void setFecFinalizacion(Date fecFinalizacion) {
        this.fecFinalizacion = fecFinalizacion;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }
    
    

}
