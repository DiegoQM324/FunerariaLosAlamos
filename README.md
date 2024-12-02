# **Los Alamos - Funeraria**

## **Descripción**
El sistema de gestión de servicios funerarios y de entierro de _Los Alamos_ es una plataforma diseñada para facilitar la organización y administración de los servicios funerarios que ofrecemos. Desarrollado en Java con Spring Boot, este proyecto tiene como objetivo proporcionar un flujo de trabajo eficiente para coordinar los servicios funerarios con la máxima empatía y profesionalismo.

## **Tecnologías Utilizadas**
- **Java 21**:  Lenguaje de programación utilizado para el desarrollo principal.
- *Tomcat: Servidor de aplicaciones web que ejecuta Java Servlets, JSP y WebSocket, ideal para sistemas web dinámicos y escalables.*Spring Boot**: Framework que permite una rápida creación y mantenimiento del sistema.

## **Requisitos Previos**
Asegúrate de tener instaladas las siguientes herramientas antes de comenzar:

- **JDK 21**: [Descargar JDK](https://www.oracle.com/java/technologies/javase-jdk21-downloads.html)

## **Configuración del Proyecto**

1. **Clonar el Repositorio**
   ```bash
   git clone https://github.com/tuusuario/funeraria-los-alamos.git
   cd funeraria-los-alamos

# **Flujo de Trabajo con Gitflow Simplificado**

## **Introducción**
Este documento describe el flujo de trabajo con Gitflow simplificado que utilizaremos en nuestro proyecto. La estructura está diseñada para mantener el desarrollo organizado y asegurar que todos los cambios se integren de manera controlada y sin conflictos.

## **Estructura de Ramas**

1. **`master`**
    - **Propósito**: Contiene el código de producción que se utiliza para gestionar los servicios funerarios. Esta rama debe mantenerse siempre estable.
    - **Reglas**:
        - No se realizan cambios directos en `master`.
        - Solo se fusionan cambios desde `develop` cuando el sistema está listo para una nueva versión.
        - Cada fusión en `master` debe ir acompañada de un tag para marcar la versión.

2. **`develop`**
    - **Propósito**: Se utilizan para desarrollar nuevas funcionalidades, como mejoras en la gestión de obituarios, optimización del sistema de reservas o actualizaciones en el inventario.
    - **Reglas**:
        - Los cambios se integran primero en `develop`.
        - La rama debe mantenerse funcional y libre de errores.

3. **Ramas de `feature`**
    - **Propósito**: Se utilizan para desarrollar nuevas funcionalidades, mejoras o correcciones específicas.
    - **Reglas**:
        - Cada nueva funcionalidad se desarrolla en su propia rama `feature`, que se crea a partir de `develop`.
        - Cuando la funcionalidad esté lista, se fusiona en `develop` y se elimina la rama.
    - **Convención para nombrar ramas**:
      ```bash
      feature/descripcion-breve-funcionalidad
      ```





