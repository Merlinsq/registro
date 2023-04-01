<%-- 
    Document   : eliminar
    Created on : 22 mar 2023, 20:47:47
    Author     : msand
--%>
<link rel="stylesheet" type="text/css" href="estilos2.css">

<% if (session.getAttribute("usuario") == null) { %>
  <% response.sendRedirect("ingreso.jsp"); %>
<% } else { %>
  <!-- Código para página de contenido -->



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
  
  // Obtener el id del usuario a eliminar
  int id = Integer.parseInt(request.getParameter("id"));
  
  // Eliminar el usuario de la tabla usuarios
  String consulta = "DELETE FROM usuarios WHERE id=?";
  PreparedStatement pstmt = conexion.prepareStatement(consulta);
  pstmt.setInt(1, id);
  pstmt.executeUpdate();
  
  // Cerrar la conexión
  pstmt.close();
  conexion.close();
%>

<html>
  <head>
    <title>Registro eliminado</title>
  </head>
  <body>
    <h1>Registro eliminado</h1>
    <p>El registro ha sido eliminado exitosamente.</p>
    <img src="imagenlogo.png" alt="Imagen de fondo" id="imagen_fondo">
    <form action="consultar.jsp">
  <button type="submit">Volver a la página de consulta</button>
  
</form>

  </body>
</html>
<% } %>