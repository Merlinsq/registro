package com.mycompany.registro.resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;

public class ConexionBD {
    private Connection conexion;

    public void conectar() {
        try {
            Properties propiedades = new Properties();
            InputStream entrada = getClass().getClassLoader().getResourceAsStream("/WEB-INF/config/config.properties");
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
