/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

import java.util.Date;

/**
 * Clase que representa un contrato con sus atributos y métodos de acceso. Un
 * contrato vincula un usuario, un pago y un servicio con fechas de creación,
 * inicio y finalización, además de mantener su estado actual.
 *
 * Atributos: - `idContrato`: Identificador único del contrato. - `fecCreacion`:
 * Fecha de creación del contrato. - `estado`: Estado actual del contrato (por
 * ejemplo, activo, inactivo). - `fecInicio`: Fecha de inicio del contrato. -
 * `fecFinalizacion`: Fecha de finalización del contrato. - `idPago`:
 * Identificador del pago asociado al contrato. - `idUsuario`: Identificador del
 * usuario asociado al contrato. - `idServicio`: Identificador del servicio
 * asociado al contrato.
 *
 * @author Acer
 */
public class Contrato {

    // Atributos privados de la clase
    private int idContrato;          // ID del contrato
    private Date fecCreacion;        // Fecha de creación del contrato
    private String estado;           // Estado actual del contrato
    private Date fecInicio;          // Fecha de inicio del contrato
    private Date fecFinalizacion;    // Fecha de finalización del contrato
    private int idPago;              // ID del pago asociado al contrato
    private int idUsuario;           // ID del usuario asociado al contrato
    private int idServicio;          // ID del servicio asociado al contrato

    /**
     * Constructor vacío. Permite crear un objeto Contrato sin inicializar sus
     * atributos.
     */
    public Contrato() {
    }

    /**
     * Constructor parametrizado. Permite crear un objeto Contrato inicializando
     * todos sus atributos.
     *
     * @param idContrato Identificador único del contrato
     * @param fecCreacion Fecha de creación del contrato
     * @param estado Estado del contrato
     * @param fecInicio Fecha de inicio del contrato
     * @param fecFinalizacion Fecha de finalización del contrato
     * @param idPago Identificador del pago asociado
     * @param idUsuario Identificador del usuario asociado
     * @param idServicio Identificador del servicio asociado
     */
    public Contrato(int idContrato, Date fecCreacion, String estado, Date fecInicio, Date fecFinalizacion,
            int idPago, int idUsuario, int idServicio) {
        this.idContrato = idContrato;
        this.fecCreacion = fecCreacion;
        this.estado = estado;
        this.fecInicio = fecInicio;
        this.fecFinalizacion = fecFinalizacion;
        this.idPago = idPago;
        this.idUsuario = idUsuario;
        this.idServicio = idServicio;
    }

    /**
     * Obtiene el ID del contrato.
     *
     * @return ID del contrato
     */
    public int getIdContrato() {
        return idContrato;
    }

    /**
     * Establece el ID del contrato.
     *
     * @param idContrato ID del contrato
     */
    public void setIdContrato(int idContrato) {
        this.idContrato = idContrato;
    }

    /**
     * Obtiene la fecha de creación del contrato.
     *
     * @return Fecha de creación del contrato
     */
    public Date getFecCreacion() {
        return fecCreacion;
    }

    /**
     * Establece la fecha de creación del contrato.
     *
     * @param fecCreacion Fecha de creación del contrato
     */
    public void setFecCreacion(Date fecCreacion) {
        this.fecCreacion = fecCreacion;
    }

    /**
     * Obtiene el estado del contrato.
     *
     * @return Estado del contrato
     */
    public String getEstado() {
        return estado;
    }

    /**
     * Establece el estado del contrato.
     *
     * @param estado Estado del contrato
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * Obtiene la fecha de inicio del contrato.
     *
     * @return Fecha de inicio del contrato
     */
    public Date getFecInicio() {
        return fecInicio;
    }

    /**
     * Establece la fecha de inicio del contrato.
     *
     * @param fecInicio Fecha de inicio del contrato
     */
    public void setFecInicio(Date fecInicio) {
        this.fecInicio = fecInicio;
    }

    /**
     * Obtiene la fecha de finalización del contrato.
     *
     * @return Fecha de finalización del contrato
     */
    public Date getFecFinalizacion() {
        return fecFinalizacion;
    }

    /**
     * Establece la fecha de finalización del contrato.
     *
     * @param fecFinalizacion Fecha de finalización del contrato
     */
    public void setFecFinalizacion(Date fecFinalizacion) {
        this.fecFinalizacion = fecFinalizacion;
    }

    /**
     * Obtiene el ID del pago asociado al contrato.
     *
     * @return ID del pago asociado
     */
    public int getIdPago() {
        return idPago;
    }

    /**
     * Establece el ID del pago asociado al contrato.
     *
     * @param idPago ID del pago asociado
     */
    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    /**
     * Obtiene el ID del usuario asociado al contrato.
     *
     * @return ID del usuario asociado
     */
    public int getIdUsuario() {
        return idUsuario;
    }

    /**
     * Establece el ID del usuario asociado al contrato.
     *
     * @param idUsuario ID del usuario asociado
     */
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * Obtiene el ID del servicio asociado al contrato.
     *
     * @return ID del servicio asociado
     */
    public int getIdServicio() {
        return idServicio;
    }

    /**
     * Establece el ID del servicio asociado al contrato.
     *
     * @param idServicio ID del servicio asociado
     */
    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }
}
