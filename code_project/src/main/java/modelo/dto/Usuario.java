/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 * La clase `Usuario` representa los usuarios del sistema. Cada usuario tiene
 * información personal y de autenticación, como nombre, apellidos, correo, DNI,
 * contraseña y rol.
 *
 * Atributos: - `id_usuario`: Identificador único del usuario. - `nombre`:
 * Nombre del usuario. - `apellidos`: Apellidos del usuario. - `celular`: Número
 * de celular del usuario. - `correo`: Dirección de correo del usuario. - `dni`:
 * Documento Nacional de Identidad del usuario. - `contrasena`: Contraseña para
 * autenticación del usuario. - `rol`: Rol del usuario en el sistema (por
 * ejemplo, "usuario", "administrador").
 *
 * Esta clase permite gestionar y acceder a los datos personales de los
 * usuarios.
 *
 * @author Acer
 */
public class Usuario {

    // Atributos privados de la clase Usuario
    private int id_usuario;      // ID único del usuario
    private String nombre;       // Nombre del usuario
    private String apellidos;    // Apellidos del usuario
    private int celular;         // Número de celular
    private String correo;       // Dirección de correo electrónico
    private int dni;             // Documento Nacional de Identidad (DNI)
    private String contrasena;   // Contraseña para autenticación
    private String rol;          // Rol del usuario en el sistema

    /**
     * Constructor vacío. Permite crear un objeto `Usuario` sin inicializar los
     * atributos.
     */
    public Usuario() {
    }

    /**
     * Constructor parametrizado sin ID. Se utiliza para crear un objeto
     * `Usuario` sin especificar el ID.
     *
     * @param nombre Nombre del usuario.
     * @param apellidos Apellidos del usuario.
     * @param celular Número de celular del usuario.
     * @param correo Correo electrónico del usuario.
     * @param dni Documento Nacional de Identidad (DNI) del usuario.
     * @param contrasena Contraseña para autenticación del usuario.
     * @param rol Rol del usuario en el sistema.
     */
    public Usuario(String nombre, String apellidos, int celular, String correo,
            int dni, String contrasena, String rol) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.celular = celular;
        this.correo = correo;
        this.dni = dni;
        this.contrasena = contrasena;
        this.rol = rol;
    }

    /**
     * Constructor parametrizado con ID. Se utiliza para crear un objeto
     * `Usuario` especificando todos los atributos.
     *
     * @param id_usuario ID único del usuario.
     * @param nombre Nombre del usuario.
     * @param apellidos Apellidos del usuario.
     * @param celular Número de celular del usuario.
     * @param correo Correo electrónico del usuario.
     * @param dni Documento Nacional de Identidad (DNI) del usuario.
     * @param contrasena Contraseña para autenticación del usuario.
     * @param rol Rol del usuario en el sistema.
     */
    public Usuario(int id_usuario, String nombre, String apellidos, int celular,
            String correo, int dni, String contrasena, String rol) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.celular = celular;
        this.correo = correo;
        this.dni = dni;
        this.contrasena = contrasena;
        this.rol = rol;
    }

    // Métodos Getter y Setter para cada atributo
    /**
     * Obtiene el ID del usuario.
     *
     * @return ID del usuario.
     */
    public int getId_usuario() {
        return id_usuario;
    }

    /**
     * Establece el ID del usuario.
     *
     * @param id_usuario ID del usuario.
     */
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    /**
     * Obtiene el nombre del usuario.
     *
     * @return Nombre del usuario.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Establece el nombre del usuario.
     *
     * @param nombre Nombre del usuario.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Obtiene los apellidos del usuario.
     *
     * @return Apellidos del usuario.
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * Establece los apellidos del usuario.
     *
     * @param apellidos Apellidos del usuario.
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * Obtiene el número de celular del usuario.
     *
     * @return Número de celular.
     */
    public int getCelular() {
        return celular;
    }

    /**
     * Establece el número de celular del usuario.
     *
     * @param celular Número de celular.
     */
    public void setCelular(int celular) {
        this.celular = celular;
    }

    /**
     * Obtiene la dirección de correo electrónico del usuario.
     *
     * @return Correo electrónico del usuario.
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * Establece la dirección de correo electrónico del usuario.
     *
     * @param correo Correo electrónico del usuario.
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * Obtiene el DNI del usuario.
     *
     * @return DNI del usuario.
     */
    public int getDni() {
        return dni;
    }

    /**
     * Establece el DNI del usuario.
     *
     * @param dni DNI del usuario.
     */
    public void setDni(int dni) {
        this.dni = dni;
    }

    /**
     * Obtiene la contraseña del usuario.
     *
     * @return Contraseña del usuario.
     */
    public String getContrasena() {
        return contrasena;
    }

    /**
     * Establece la contraseña del usuario.
     *
     * @param contrasena Contraseña del usuario.
     */
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    /**
     * Obtiene el rol del usuario.
     *
     * @return Rol del usuario.
     */
    public String getRol() {
        return rol;
    }

    /**
     * Establece el rol del usuario.
     *
     * @param rol Rol del usuario.
     */
    public void setRol(String rol) {
        this.rol = rol;
    }
}
