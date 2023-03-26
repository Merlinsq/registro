<%-- 
    Document   : consultar
    Created on : 22 mar 2023, 20:52:35
    Author     : msand
--%>

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
  
  // Consultar los datos de la tabla usuarios
  String consulta = "SELECT * FROM usuarios";
  PreparedStatement pstmt = conexion.prepareStatement(consulta);
  ResultSet rs = pstmt.executeQuery();
%>

<html>
  <head>
      <style>body {
  font-family: Arial, sans-serif;
  text-align: center;
  background-color: #f2f2f2;
}

a {
  text-decoration: none;
  color: #333;
}

h1 {
  font-size: 36px;
  font-weight: bold;
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
    <title>Consulta de registros</title>
  </head>
  <body>
    <h1>Consulta de registros</h1>
    <table border="1">
      <tr>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Fecha de nacimiento</th>
        <th>Teléfono</th>
        <th>Email</th>
        <th>Dirección</th>
        <th>Acciones</th>
      </tr>
      <% while (rs.next()) { %>
      <tr>
        <td><%= rs.getString("nombre") %></td>
        <td><%= rs.getString("apellido") %></td>
        <td><%= rs.getString("fecha_nacimiento") %></td>
        <td><%= rs.getString("telefono") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("direccion") %></td>
        <td>
          <form action="buscar.jsp" method="post">
            <input type="hidden" name="id" value="<%= rs.getString("id") %>">
            <input type="submit" value="Modificar">
          </form>
          <form action="eliminar.jsp" method="post">
            <input type="hidden" name="id" value="<%= rs.getString("id") %>">
            <input type="submit" value="Eliminar">
          </form>
        </td>
      </tr>
      <% } %>
    </table>
    <p><a href="bienvenida.jsp">Volver a la página de bienvenida</a></p>
  </body>
</html>

<%
  // Cerrar la conexión
  rs.close();
  pstmt.close();
  conexion.close();
%>
