/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 * Clase que representa un asesor con sus atributos y métodos de acceso. Provee
 * constructores para inicializar objetos de tipo Asesor y métodos getter y
 * setter para acceder y modificar sus atributos.
 *
 * Atributos: - `idAsesor`: Identificador único del asesor. - `nombreAse`:
 * Nombre del asesor. - `apellidosAse`: Apellidos del asesor. - `costo`: Costo
 * asociado al asesor.
 *
 * @author Acer
 */
public class Asesor {

    // Atributos privados de la clase
    private int idAsesor;        // ID del asesor
    private String nombreAse;    // Nombre del asesor
    private String apellidosAse; // Apellidos del asesor
    private double costo;        // Costo del asesor

    /**
     * Constructor vacío. Permite crear un objeto Asesor sin inicializar sus
     * atributos.
     */
    public Asesor() {
    }

    /**
     * Constructor parametrizado. Permite crear un objeto Asesor inicializando
     * todos sus atributos.
     *
     * @param idAsesor Identificador único del asesor
     * @param nombreAse Nombre del asesor
     * @param apellidosAse Apellidos del asesor
     * @param costo Costo asociado al asesor
     */
    public Asesor(int idAsesor, String nombreAse, String apellidosAse, double costo) {
        this.idAsesor = idAsesor;
        this.nombreAse = nombreAse;
        this.apellidosAse = apellidosAse;
        this.costo = costo;
    }

    /**
     * Obtiene el ID del asesor.
     *
     * @return ID del asesor
     */
    public int getIdAsesor() {
        return idAsesor;
    }

    /**
     * Establece el ID del asesor.
     *
     * @param idAsesor ID del asesor
     */
    public void setIdAsesor(int idAsesor) {
        this.idAsesor = idAsesor;
    }

    /**
     * Obtiene el nombre del asesor.
     *
     * @return Nombre del asesor
     */
    public String getNombreAse() {
        return nombreAse;
    }

    /**
     * Establece el nombre del asesor.
     *
     * @param nombreAse Nombre del asesor
     */
    public void setNombreAse(String nombreAse) {
        this.nombreAse = nombreAse;
    }

    /**
     * Obtiene los apellidos del asesor.
     *
     * @return Apellidos del asesor
     */
    public String getApellidosAse() {
        return apellidosAse;
    }

    /**
     * Establece los apellidos del asesor.
     *
     * @param apellidosAse Apellidos del asesor
     */
    public void setApellidosAse(String apellidosAse) {
        this.apellidosAse = apellidosAse;
    }

    /**
     * Obtiene el costo asociado al asesor.
     *
     * @return Costo del asesor
     */
    public double getCosto() {
        return costo;
    }

    /**
     * Establece el costo del asesor.
     *
     * @param costo Costo del asesor
     */
    public void setCosto(double costo) {
        this.costo = costo;
    }
}
