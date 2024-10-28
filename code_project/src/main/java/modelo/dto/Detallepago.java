/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 * Clase que representa el detalle de un pago en el sistema. Esta clase contiene
 * los identificadores necesarios para vincular un pago con los elementos
 * relevantes, como el cliente, difunto, servicio y empleado.
 *
 * Atributos: - `idDetallesPago`: Identificador único del detalle de pago. -
 * `idPago`: Identificador del pago al que pertenece este detalle. -
 * `idCliente`: Identificador del cliente asociado al pago. - `idDifunto`:
 * Identificador del difunto relacionado con el pago. - `idServicio`:
 * Identificador del servicio asociado al pago. - `idEmpleado`: Identificador
 * del empleado responsable del servicio.
 *
 * @author Acer
 */
public class Detallepago {

    // Atributos privados de la clase
    private int idDetallesPago; // ID del detalle de pago
    private int idPago;         // ID del pago asociado
    private int idCliente;      // ID del cliente asociado al pago
    private int idDifunto;      // ID del difunto relacionado con el pago
    private int idServicio;     // ID del servicio prestado
    private int idEmpleado;     // ID del empleado encargado

    /**
     * Constructor vacío. Permite crear un objeto Detallepago sin inicializar
     * sus atributos.
     */
    public Detallepago() {
    }

    /**
     * Constructor parametrizado. Inicializa todos los atributos de la clase.
     *
     * @param idDetallesPago Identificador único del detalle de pago.
     * @param idPago Identificador del pago asociado.
     * @param idCliente Identificador del cliente asociado al pago.
     * @param idDifunto Identificador del difunto relacionado.
     * @param idServicio Identificador del servicio prestado.
     * @param idEmpleado Identificador del empleado responsable.
     */
    public Detallepago(int idDetallesPago, int idPago, int idCliente, int idDifunto, int idServicio, int idEmpleado) {
        this.idDetallesPago = idDetallesPago;
        this.idPago = idPago;
        this.idCliente = idCliente;
        this.idDifunto = idDifunto;
        this.idServicio = idServicio;
        this.idEmpleado = idEmpleado;
    }

    /**
     * Obtiene el ID del detalle de pago.
     *
     * @return ID del detalle de pago.
     */
    public int getIdDetallesPago() {
        return idDetallesPago;
    }

    /**
     * Establece el ID del detalle de pago.
     *
     * @param idDetallesPago ID del detalle de pago.
     */
    public void setIdDetallesPago(int idDetallesPago) {
        this.idDetallesPago = idDetallesPago;
    }

    /**
     * Obtiene el ID del pago asociado.
     *
     * @return ID del pago.
     */
    public int getIdPago() {
        return idPago;
    }

    /**
     * Establece el ID del pago asociado.
     *
     * @param idPago ID del pago.
     */
    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    /**
     * Obtiene el ID del cliente asociado.
     *
     * @return ID del cliente.
     */
    public int getIdCliente() {
        return idCliente;
    }

    /**
     * Establece el ID del cliente asociado.
     *
     * @param idCliente ID del cliente.
     */
    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    /**
     * Obtiene el ID del difunto relacionado.
     *
     * @return ID del difunto.
     */
    public int getIdDifunto() {
        return idDifunto;
    }

    /**
     * Establece el ID del difunto relacionado.
     *
     * @param idDifunto ID del difunto.
     */
    public void setIdDifunto(int idDifunto) {
        this.idDifunto = idDifunto;
    }

    /**
     * Obtiene el ID del servicio prestado.
     *
     * @return ID del servicio.
     */
    public int getIdServicio() {
        return idServicio;
    }

    /**
     * Establece el ID del servicio prestado.
     *
     * @param idServicio ID del servicio.
     */
    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    /**
     * Obtiene el ID del empleado encargado del servicio.
     *
     * @return ID del empleado.
     */
    public int getIdEmpleado() {
        return idEmpleado;
    }

    /**
     * Establece el ID del empleado encargado del servicio.
     *
     * @param idEmpleado ID del empleado.
     */
    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }
}
