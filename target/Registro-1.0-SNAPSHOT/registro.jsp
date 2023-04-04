 <%@page import="com.mycompany.registro.resources.ConexionBD"%>
<!--Se importa la hoja de estilos donde se le da forma y color  -->
<link rel="stylesheet" type="text/css" href="estilos.css">
<link rel="icon" href="imagenlogo.png" type="image/png">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>

<!--Se se Verifica si la seción esta iniciada  -->
<% if (session.getAttribute("usuario") == null) { %>
  <% response.sendRedirect("ingreso.jsp"); %>
<% } else { %>

<%
  // Establecer conexión con la base de datos
ConexionBD conexionBD = new ConexionBD(getServletContext());
conexionBD.conectar();

 Connection conexion = conexionBD.getConexion();
  
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
  email = email.replaceAll("\\\\", "\\\\\\\\")
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
    <title>Registro completado</title>
  </head>
  <body>
      <img src="imagenlogo.png" alt="Imagen de fondo" id="imagen_fondo">
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
    <a href="consultar.jsp"><button>Modificar</button></a>
  </body>
</html>

<% } %>