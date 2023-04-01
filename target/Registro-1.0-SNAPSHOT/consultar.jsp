<%-- 
    Document   : consultar
    Created on : 22 mar 2023, 20:52:35
    Author     : msand
--%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>


<link rel="stylesheet" type="text/css" href="estilos2.css">
<link rel="icon" href="imagenlogo.png" type="image/png">




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
     
    <title>Consulta de Registros</title>
  </head>
  <body>
    <h1>Consulta de Registros</h1>

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
    
    <script>
            $(document).ready(function() {
            $('#miTabla').DataTable({
            "order": [[ 0, "asc" ]], // Ordenar por la primera columna de forma ascendente
            "columnDefs": [
              { "orderable": true, "targets": [ 0, 1, 2 ] } // Las columnas 0, 1 y 2 pueden ordenarse
            ]
            });
            });

    </script>
    <!-- Código para cerrar la Sesi[on --> 
    
    <table class="table" id="miTabla"
     border="1"
      style="margin:auto;">
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
            <td>
            <form action="eliminar.jsp" method="post">
            <input type="hidden" name="id" value="<%= rs.getString("id") %>">
            <input type="submit" value="Eliminar">
          </form>
            </td>
        </td>
      </tr>
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
