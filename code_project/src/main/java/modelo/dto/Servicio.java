/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 * Clase que representa un servicio dentro del sistema. Contiene información
 * sobre los servicios disponibles, como su nombre, descripción, y las
 * relaciones con planes y asesores.
 *
 * Atributos: - `idServicio`: Identificador único del servicio. - `nombreSer`:
 * Nombre del servicio. - `descripcion`: Descripción del servicio. - `idPlan`:
 * Identificador del plan asociado al servicio. - `idAsesor`: Identificador del
 * asesor responsable del servicio.
 *
 * Esta clase permite gestionar y acceder a la información relacionada con los
 * servicios.
 *
 * @author Acer
 */
public class Servicio {

    // Atributos privados de la clase
    private int idServicio;    // ID único del servicio
    private String nombreSer;  // Nombre del servicio
    private String descripcion;// Descripción del servicio
    private int idPlan;        // ID del plan asociado
    private int idAsesor;      // ID del asesor responsable

    /**
     * Constructor vacío. Permite crear un objeto `Servicio` sin inicializar sus
     * atributos.
     */
    public Servicio() {
    }

    /**
     * Constructor parametrizado. Inicializa todos los atributos del servicio.
     *
     * @param idServicio ID único del servicio.
     * @param nombreSer Nombre del servicio.
     * @param descripcion Descripción del servicio.
     * @param idPlan ID del plan asociado al servicio.
     * @param idAsesor ID del asesor responsable del servicio.
     */
    public Servicio(int idServicio, String nombreSer, String descripcion, int idPlan, int idAsesor) {
        this.idServicio = idServicio;
        this.nombreSer = nombreSer;
        this.descripcion = descripcion;
        this.idPlan = idPlan;
        this.idAsesor = idAsesor;
    }

    /**
     * Obtiene el ID del servicio.
     *
     * @return ID del servicio.
     */
    public int getIdServicio() {
        return idServicio;
    }

    /**
     * Establece el ID del servicio.
     *
     * @param idServicio ID del servicio.
     */
    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    /**
     * Obtiene el nombre del servicio.
     *
     * @return Nombre del servicio.
     */
    public String getNombreSer() {
        return nombreSer;
    }

    /**
     * Establece el nombre del servicio.
     *
     * @param nombreSer Nombre del servicio.
     */
    public void setNombreSer(String nombreSer) {
        this.nombreSer = nombreSer;
    }

    /**
     * Obtiene la descripción del servicio.
     *
     * @return Descripción del servicio.
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Establece la descripción del servicio.
     *
     * @param descripcion Descripción del servicio.
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * Obtiene el ID del plan asociado al servicio.
     *
     * @return ID del plan.
     */
    public int getIdPlan() {
        return idPlan;
    }

    /**
     * Establece el ID del plan asociado al servicio.
     *
     * @param idPlan ID del plan.
     */
    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    /**
     * Obtiene el ID del asesor responsable del servicio.
     *
     * @return ID del asesor.
     */
    public int getIdAsesor() {
        return idAsesor;
    }

    /**
     * Establece el ID del asesor responsable del servicio.
     *
     * @param idAsesor ID del asesor.
     */
    public void setIdAsesor(int idAsesor) {
        this.idAsesor = idAsesor;
    }
}
