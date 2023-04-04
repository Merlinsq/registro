<%-- 
    Document   : consultar
    Created on : 22 mar 2023, 20:52:35
    Author     : msand
--%>
<%@page import="com.mycompany.registro.resources.ConexionBD"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>


<link rel="stylesheet" type="text/css" href="estilos2.css">
<link rel="icon" href="imagenlogo.png" type="image/png">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>

<%
  // Establecer conexión con la base de datos
ConexionBD conexionBD = new ConexionBD(getServletContext());
conexionBD.conectar();

 Connection conexion = conexionBD.getConexion();
  

  // Obtener el valor ingresado en el campo de búsqueda
  String nombre = request.getParameter("nombre");
  
  // Consultar los datos de la tabla usuarios filtrando por nombre
  String consulta = "SELECT * FROM usuarios WHERE nombre LIKE ?";
  PreparedStatement pstmt = conexion.prepareStatement(consulta);
  pstmt.setString(1, "%" + nombre + "%"); // Agregar el valor ingresado en el formulario
  ResultSet rs = pstmt.executeQuery();
%>

<html>
  <head>
     
    <title>Consulta de Registros</title>
  </head>
  <body>
    <h1>Consulta de Registros</h1>
    
    <form action="consultar.jsp" method="post">
  <label for="nombre">Buscar por nombre:</label>
  <input type="text" id="nombre" name="nombre" value="<%= nombre %>">
  <input type="submit" value="Buscar">
</form>


    <!-- Código para cerrar la Sesi[on --> 
    <div id="cerrar-sesion">
        <button id="cerrar-sesion-btn">Cerrar sesión</button>
    </div>
    <script>
            const cerrarSesionBtn = document.getElementById('cerrar-sesion-btn');
            cerrarSesionBtn.addEventListener('click', function() {
            window.location.href = 'cerrarSesion.jsp';
            });
    </script>

    
   <% if (rs.next()) { %>
<table class="table" id="miTabla" border="1" style="margin:auto;">
  <tr>
    <th>Nombre</th>
    <th>Apellido</th>
    <th>Fecha de nacimiento</th>
    <th>Teléfono</th>
    <th>Email</th>
    <th>Dirección</th>
    <th>Modificar</th>
    <th>Eliminar</th>
  </tr>
  <% do { %>
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
    </td>
    <td>
      <form action="eliminar.jsp" method="post">
        <input type="hidden" name="id" value="<%= rs.getString("id") %>">
        <input type="submit" value="Eliminar">
      </form>
    </td>
  </tr>
  <% } while (rs.next()); %>
</table>
<% } else { %>
<p>No se encontraron resultados.</p>
<% } %>

    </table>
  <img src="imagenlogo.png" alt="Imagen de fondo" id="imagen_fondo">
    
      <section id="consultar1">
     
      <a href="bienvenida.jsp"><button>Regresar</button></a>
    </section>

  </body>
</html>

<%
  // Cerrar la conexión
  rs.close();
  pstmt.close();
  conexion.close();
%>
