/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

import java.util.Date;

/**
 * Clase que representa a un difunto en el sistema. Esta clase contiene
 * información relevante sobre una persona fallecida, incluyendo su nombre,
 * apellidos, fechas de nacimiento y fallecimiento, así como el lugar donde
 * ocurrió el fallecimiento.
 *
 * Atributos: - `idDifunto`: Identificador único del difunto. - `nombreDif`:
 * Nombre del difunto. - `apellidosDif`: Apellidos del difunto. -
 * `fecNacimiento`: Fecha de nacimiento del difunto. - `fecFallecimiento`: Fecha
 * de fallecimiento del difunto. - `lugarFallecimiento`: Lugar donde ocurrió el
 * fallecimiento.
 *
 * @author Acer
 */
public class Difunto {

    // Atributos privados de la clase
    private int idDifunto;                  // ID único del difunto
    private String nombreDif;               // Nombre del difunto
    private String apellidosDif;            // Apellidos del difunto
    private Date fecNacimiento;             // Fecha de nacimiento
    private Date fecFallecimiento;          // Fecha de fallecimiento
    private String lugarFallecimiento;      // Lugar del fallecimiento

    /**
     * Constructor vacío. Permite crear un objeto `Difunto` sin inicializar sus
     * atributos.
     */
    public Difunto() {
    }

    /**
     * Constructor parametrizado. Inicializa todos los atributos del difunto.
     *
     * @param idDifunto Identificador único del difunto.
     * @param nombreDif Nombre del difunto.
     * @param apellidosDif Apellidos del difunto.
     * @param fecNacimiento Fecha de nacimiento.
     * @param fecFallecimiento Fecha de fallecimiento.
     * @param lugarFallecimiento Lugar donde ocurrió el fallecimiento.
     */
    public Difunto(int idDifunto, String nombreDif, String apellidosDif, Date fecNacimiento, Date fecFallecimiento, String lugarFallecimiento) {
        this.idDifunto = idDifunto;
        this.nombreDif = nombreDif;
        this.apellidosDif = apellidosDif;
        this.fecNacimiento = fecNacimiento;
        this.fecFallecimiento = fecFallecimiento;
        this.lugarFallecimiento = lugarFallecimiento;
    }

    /**
     * Constructor alternativo sin ID. Se utiliza cuando el ID es generado
     * automáticamente por la base de datos.
     *
     * @param nombreDif Nombre del difunto.
     * @param apellidosDif Apellidos del difunto.
     * @param fecNacimiento Fecha de nacimiento.
     * @param fecFallecimiento Fecha de fallecimiento.
     * @param lugarFallecimiento Lugar donde ocurrió el fallecimiento.
     */
    public Difunto(String nombreDif, String apellidosDif, Date fecNacimiento, Date fecFallecimiento, String lugarFallecimiento) {
        this.nombreDif = nombreDif;
        this.apellidosDif = apellidosDif;
        this.fecNacimiento = fecNacimiento;
        this.fecFallecimiento = fecFallecimiento;
        this.lugarFallecimiento = lugarFallecimiento;
    }

    /**
     * Obtiene el ID del difunto.
     *
     * @return ID del difunto.
     */
    public int getIdDifunto() {
        return idDifunto;
    }

    /**
     * Establece el ID del difunto.
     *
     * @param idDifunto ID del difunto.
     */
    public void setIdDifunto(int idDifunto) {
        this.idDifunto = idDifunto;
    }

    /**
     * Obtiene el nombre del difunto.
     *
     * @return Nombre del difunto.
     */
    public String getNombreDif() {
        return nombreDif;
    }

    /**
     * Establece el nombre del difunto.
     *
     * @param nombreDif Nombre del difunto.
     */
    public void setNombreDif(String nombreDif) {
        this.nombreDif = nombreDif;
    }

    /**
     * Obtiene los apellidos del difunto.
     *
     * @return Apellidos del difunto.
     */
    public String getApellidosDif() {
        return apellidosDif;
    }

    /**
     * Establece los apellidos del difunto.
     *
     * @param apellidosDif Apellidos del difunto.
     */
    public void setApellidosDif(String apellidosDif) {
        this.apellidosDif = apellidosDif;
    }

    /**
     * Obtiene la fecha de nacimiento del difunto.
     *
     * @return Fecha de nacimiento.
     */
    public Date getFecNacimiento() {
        return fecNacimiento;
    }

    /**
     * Establece la fecha de nacimiento del difunto.
     *
     * @param fecNacimiento Fecha de nacimiento.
     */
    public void setFecNacimiento(Date fecNacimiento) {
        this.fecNacimiento = fecNacimiento;
    }

    /**
     * Obtiene la fecha de fallecimiento del difunto.
     *
     * @return Fecha de fallecimiento.
     */
    public Date getFecFallecimiento() {
        return fecFallecimiento;
    }

    /**
     * Establece la fecha de fallecimiento del difunto.
     *
     * @param fecFallecimiento Fecha de fallecimiento.
     */
    public void setFecFallecimiento(Date fecFallecimiento) {
        this.fecFallecimiento = fecFallecimiento;
    }

    /**
     * Obtiene el lugar donde ocurrió el fallecimiento.
     *
     * @return Lugar de fallecimiento.
     */
    public String getLugarFallecimiento() {
        return lugarFallecimiento;
    }

    /**
     * Establece el lugar donde ocurrió el fallecimiento.
     *
     * @param lugarFallecimiento Lugar de fallecimiento.
     */
    public void setLugarFallecimiento(String lugarFallecimiento) {
        this.lugarFallecimiento = lugarFallecimiento;
    }
}
