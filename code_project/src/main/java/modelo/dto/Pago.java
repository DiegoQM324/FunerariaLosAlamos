/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

import java.util.Date;

/**
 * Clase que representa un pago en el sistema. Contiene información relevante
 * sobre los pagos realizados, como el monto, fecha de pago, método de pago y
 * comprobante.
 *
 * Atributos: - `idPago`: Identificador único del pago. - `monto`: Monto pagado.
 * - `fecha`: Fecha en la que se realizó el pago. - `metodoPago`: Método
 * utilizado para realizar el pago (efectivo, tarjeta, etc.). -
 * `comprobantePago`: Información o código del comprobante del pago.
 *
 * Esta clase permite gestionar la información de los pagos en el sistema.
 *
 * @author Acer
 */
public class Pago {

    // Atributos privados de la clase
    private int idPago;                    // ID único del pago
    private double monto;                  // Monto del pago
    private Date fecha;                    // Fecha del pago
    private String metodoPago;             // Método utilizado para el pago
    private String comprobantePago;        // Comprobante del pago

    /**
     * Constructor vacío. Permite crear un objeto `Pago` sin inicializar sus
     * atributos.
     */
    public Pago() {
    }

    /**
     * Constructor parametrizado. Inicializa todos los atributos del pago.
     *
     * @param idPago Identificador único del pago.
     * @param monto Monto pagado.
     * @param fecha Fecha del pago.
     * @param metodoPago Método utilizado para realizar el pago.
     * @param comprobantePago Comprobante del pago.
     */
    public Pago(int idPago, double monto, Date fecha, String metodoPago, String comprobantePago) {
        this.idPago = idPago;
        this.monto = monto;
        this.fecha = fecha;
        this.metodoPago = metodoPago;
        this.comprobantePago = comprobantePago;
    }

    /**
     * Obtiene el ID del pago.
     *
     * @return ID del pago.
     */
    public int getIdPago() {
        return idPago;
    }

    /**
     * Establece el ID del pago.
     *
     * @param idPago ID del pago.
     */
    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    /**
     * Obtiene el monto pagado.
     *
     * @return Monto pagado.
     */
    public double getMonto() {
        return monto;
    }

    /**
     * Establece el monto del pago.
     *
     * @param monto Monto del pago.
     */
    public void setMonto(double monto) {
        this.monto = monto;
    }

    /**
     * Obtiene la fecha del pago.
     *
     * @return Fecha del pago.
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * Establece la fecha del pago.
     *
     * @param fecha Fecha del pago.
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    /**
     * Obtiene el método utilizado para realizar el pago.
     *
     * @return Método de pago.
     */
    public String getMetodoPago() {
        return metodoPago;
    }

    /**
     * Establece el método utilizado para realizar el pago.
     *
     * @param metodoPago Método de pago.
     */
    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    /**
     * Obtiene el comprobante del pago.
     *
     * @return Comprobante del pago.
     */
    public String getComprobantePago() {
        return comprobantePago;
    }

    /**
     * Establece el comprobante del pago.
     *
     * @param comprobantePago Comprobante del pago.
     */
    public void setComprobantePago(String comprobantePago) {
        this.comprobantePago = comprobantePago;
    }
}
