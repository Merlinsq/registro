<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%
   Class.forName("com.mysql.jdbc.Driver");
%>

<%
  // Establecer conexión con la base de datos
  String url = "jdbc:mysql://localhost:3306/miembros_fuente";
  String usuario = "root";
  String password = "12345678";
  Connection conexion = DriverManager.getConnection(url, usuario, password);
  
  // Obtener los datos del formulario
  String nombre = request.getParameter("nombre");
  String apellido = request.getParameter("apellido");
  String fecha_nacimiento = request.getParameter("fecha_nacimiento");
  String telefono = request.getParameter("telefono");
  String email = request.getParameter("email");
  String direccion = request.getParameter("direccion");
  
  // Prevenir ataques de inyección de SQL
  nombre = nombre.replaceAll("\\\\", "\\\\\\\\")
                 .replaceAll("\\\"", "\\\\\"")
                 .replaceAll("\\'", "\\\\\\'");
  apellido = apellido.replaceAll("\\\\", "\\\\\\\\")
                     .replaceAll("\\\"", "\\\\\"")
                     .replaceAll("\\'", "\\\\\\'");
  fecha_nacimiento = fecha_nacimiento.replaceAll("\\\\", "\\\\\\\\")
                                       .replaceAll("\\\"", "\\\\\"")
                                       .replaceAll("\\'", "\\\\\\'");
  telefono = telefono.replaceAll("\\\\", "\\\\\\\\")
                       .replaceAll("\\\"", "\\\\\"")
                       .replaceAll("\\'", "\\\\\\'");
  telefono = email.replaceAll("\\\\", "\\\\\\\\")
                       .replaceAll("\\\"", "\\\\\"")
                       .replaceAll("\\'", "\\\\\\'");
  direccion = direccion.replaceAll("\\\\", "\\\\\\\\")
                         .replaceAll("\\\"", "\\\\\"")
                         .replaceAll("\\'", "\\\\\\'");
  
  // Insertar los datos en la tabla usuarios
  String consulta = "INSERT INTO usuarios (nombre, apellido, fecha_nacimiento, telefono, email, direccion) VALUES (?, ?, ?, ?, ?,?)";
  PreparedStatement pstmt = conexion.prepareStatement(consulta);
  pstmt.setString(1, nombre);
  pstmt.setString(2, apellido);
  pstmt.setString(3, fecha_nacimiento);
  pstmt.setString(4, telefono);
  pstmt.setString(5, email);
  pstmt.setString(6, direccion);
  pstmt.executeUpdate();
  
  // Cerrar la conexión
  pstmt.close();
  conexion.close();
%>

<html>
  <head>
      <style>
          
          body {
  font-family: Arial, sans-serif;
  text-align: center;
  background-color: #f2f2f2;
}

a {
  text-decoration: none;
  color: #333;
}

h1 {
  font-size: 40px;
  font-weight: bold;
  margin-top: 50px;
  margin-bottom: 20px;
  text-shadow: 2px 2px #ccc;
}

h4 {
  font-size: 10px;
  margin-top: 50px;
  margin-bottom: 20px;
  text-shadow: 2px 2px #ccc;
}

p {
  font-size: 20px;
  margin-bottom: 20px;
}

form {
  margin: 0 auto;
  width: 400px;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.2);
}

label {
  display: inline-block;
  width: 120px;
  text-align: left;
  font-size: 18px;
  margin-bottom: 10px;
}

input[type="text"],
input[type="date"],
input[type="tel"],
input[type="password"] {
  width: 200px;
  padding: 5px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid #ccc;
  margin-bottom: 10px;
}

input[type="submit"],
input[type="reset"] {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  font-size: 16px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
  margin-right: 10px;
}

input[type="submit"]:hover,
input[type="reset"]:hover {
  background-color: #3e8e41;
}

button {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  font-size: 16px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #3e8e41;
}

      </style>
    <title>Registro completado</title>
  </head>
  <body>
    <h1>Registro completado</h1>
    <p>Gracias por registrarte. </p>
    <h2>Tus datos son:</h2>
    <ul>
      <li><strong>Nombre:</strong> <%= request.getParameter("nombre") %></li>
      <li><strong>Apellido:</strong> <%= request.getParameter("apellido") %></li>
      <li><strong>Fecha de nacimiento:</strong> <%= request.getParameter("fecha_nacimiento") %></li>
      <li><strong>Teléfono:</strong> <%= request.getParameter("telefono") %></li>
      <li><strong>Email:</strong> <%= request.getParameter("email") %></li>
      <li><strong>Dirección:</strong> <%= request.getParameter("direccion") %></li>
    </ul>
    
    <a href="bienvenida.jsp"><button>Regresar</button></a>
    <a href="buscar.jsp"><button>Modificar</button></a>
  </body>
</html>

