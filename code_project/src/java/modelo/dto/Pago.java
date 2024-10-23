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
public class Pago {
    
     private int idPago;
    private double monto;
    private Date fecha;
    private String metodoPago;
    private String comprobantePago;

    public Pago() {
    }

    public Pago(int idPago, double monto, Date fecha, String metodoPago, String comprobantePago) {
        this.idPago = idPago;
        this.monto = monto;
        this.fecha = fecha;
        this.metodoPago = metodoPago;
        this.comprobantePago = comprobantePago;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getComprobantePago() {
        return comprobantePago;
    }

    public void setComprobantePago(String comprobantePago) {
        this.comprobantePago = comprobantePago;
    }
    
    
    
}
