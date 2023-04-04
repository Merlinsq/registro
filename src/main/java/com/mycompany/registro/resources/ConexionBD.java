package com.mycompany.registro.resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

public class ConexionBD {
    private Connection conexion;
    private ServletContext contexto;

    public ConexionBD(ServletContext contexto) {
        this.contexto = contexto;
    }

    public void conectar() {
        try {
            // Cargar los valores de configuración desde el archivo
            Properties propiedades = new Properties();
            InputStream entrada = contexto.getResourceAsStream("/WEB-INF/config/config.properties");
            propiedades.load(entrada);
            String url = propiedades.getProperty("db.url");
            String usuario = propiedades.getProperty("db.user");
            String password = propiedades.getProperty("db.password");
            conexion = DriverManager.getConnection(url, usuario, password);
        } catch (SQLException e) {
            System.out.println("Error al conectar con la base de datos: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("Error al cargar el archivo de configuración: " + e.getMessage());
        }
    }

    public void desconectar() {
        try {
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión con la base de datos: " + e.getMessage());
        }
    }

    public Connection getConexion() {
        return conexion;
    }
}
