/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 * Clase que representa un plan dentro del sistema. Contiene información
 * relevante sobre un plan, incluyendo su ID, nombre, descripción y costo.
 *
 * Esta clase permite crear, almacenar y gestionar los datos relacionados con
 * los planes disponibles.
 *
 * Atributos: - `idPlan`: Identificador único del plan. - `nombrePlan`: Nombre
 * del plan. - `descripcion`: Descripción del plan. - `costo`: Costo del plan.
 *
 * @author Acer
 */
public class Plan {

    // Atributos privados de la clase
    private int idPlan;                // ID único del plan
    private String nombrePlan;         // Nombre del plan
    private String descripcion;        // Descripción del plan
    private double costo;              // Costo del plan

    /**
     * Constructor vacío. Permite crear un objeto `Plan` sin inicializar sus
     * atributos.
     */
    public Plan() {
    }

    /**
     * Constructor parametrizado. Inicializa todos los atributos del plan.
     *
     * @param idPlan ID único del plan.
     * @param nombrePlan Nombre del plan.
     * @param descripcion Descripción del plan.
     * @param costo Costo del plan.
     */
    public Plan(int idPlan, String nombrePlan, String descripcion, double costo) {
        this.idPlan = idPlan;
        this.nombrePlan = nombrePlan;
        this.descripcion = descripcion;
        this.costo = costo;
    }

    /**
     * Obtiene el ID del plan.
     *
     * @return ID del plan.
     */
    public int getIdPlan() {
        return idPlan;
    }

    /**
     * Establece el ID del plan.
     *
     * @param idPlan ID del plan.
     */
    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    /**
     * Obtiene el nombre del plan.
     *
     * @return Nombre del plan.
     */
    public String getNombrePlan() {
        return nombrePlan;
    }

    /**
     * Establece el nombre del plan.
     *
     * @param nombrePlan Nombre del plan.
     */
    public void setNombrePlan(String nombrePlan) {
        this.nombrePlan = nombrePlan;
    }

    /**
     * Obtiene la descripción del plan.
     *
     * @return Descripción del plan.
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Establece la descripción del plan.
     *
     * @param descripcion Descripción del plan.
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * Obtiene el costo del plan.
     *
     * @return Costo del plan.
     */
    public double getCosto() {
        return costo;
    }

    /**
     * Establece el costo del plan.
     *
     * @param costo Costo del plan.
     */
    public void setCosto(double costo) {
        this.costo = costo;
    }
}
