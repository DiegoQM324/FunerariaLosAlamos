/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 *
 * @author Acer
 */
public class Detallepago {
    
    private int idDetallesPago;
    private int idPago;
    private int idCliente;
    private int idDifunto;
    private int idServicio;
    private int idEmpleado;

    public Detallepago() {
    }

    public Detallepago(int idDetallesPago, int idPago, int idCliente, int idDifunto, int idServicio, int idEmpleado) {
        this.idDetallesPago = idDetallesPago;
        this.idPago = idPago;
        this.idCliente = idCliente;
        this.idDifunto = idDifunto;
        this.idServicio = idServicio;
        this.idEmpleado = idEmpleado;
    }

    public int getIdDetallesPago() {
        return idDetallesPago;
    }

    public void setIdDetallesPago(int idDetallesPago) {
        this.idDetallesPago = idDetallesPago;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdDifunto() {
        return idDifunto;
    }

    public void setIdDifunto(int idDifunto) {
        this.idDifunto = idDifunto;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }
    
    
    
}
