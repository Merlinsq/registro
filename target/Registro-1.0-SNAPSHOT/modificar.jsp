<%@ page language="java" contentType="text/html; charset=UTF-8"
         
pageEncoding="UTF-8"%>
<link rel="icon" href="imagenlogo.png" type="image/png">

<%@ page import="java.sql.*" %>

<% if (session.getAttribute("usuario") == null) { %>
  <% response.sendRedirect("ingreso.jsp"); %>
<% } else { %>
  <!-- Código para página de contenido -->



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
int id = Integer.parseInt(request.getParameter("id"));
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String fecha_nacimiento = request.getParameter("fecha_nacimiento");
String telefono = request.getParameter("telefono");
String email = request.getParameter("email");
String direccion = request.getParameter("direccion");

// Modificar los datos del usuario en la tabla usuarios
String consulta = "UPDATE usuarios SET nombre=?, apellido=?, fecha_nacimiento=?, telefono=?, email=?, direccion=? WHERE id=?";
PreparedStatement pstmt = conexion.prepareStatement(consulta);

pstmt.setString(1, nombre);
pstmt.setString(2, apellido);
if(fecha_nacimiento != null && !fecha_nacimiento.trim().isEmpty()){
   pstmt.setString(3, fecha_nacimiento);
} else {
   // Manejar el caso en que fecha_nacimiento está vacía
}
pstmt.setString(4, telefono);
pstmt.setString(5, email);
pstmt.setString(6, direccion);
pstmt.setInt(7, id);
pstmt.executeUpdate();

// Cerrar la conexión
pstmt.close();
conexion.close();
%>

<html>
  <head>
    <title>Registro modificado</title>
  </head>
  <body>
    <h1>Registro modificado</h1>
    <p>El registro ha sido modificado exitosamente.</p>
    <script>
      alert("El registro ha sido modificado exitosamente.");
      window.history.back();
    </script>
  </body>
</html>
<% } %>