<%@page import="java.io.InputStream"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*" %>
<%@page import="com.mycompany.registro.resources.ConexionBD"%>

<link rel="stylesheet" type="text/css" href="estilos.css">
<link rel="icon" href="imagenlogo.png" type="image/png">


<% if (session.getAttribute("usuario") == null) { %>
  <% response.sendRedirect("ingreso.jsp"); %>
<% } else { %>
 
<%
// Crear una instancia de ConexionBD y establecer una conexi�n
ConexionBD conexionBD = new ConexionBD(getServletContext());
conexionBD.conectar();

// Obtener el id del usuario a buscar
int id = Integer.parseInt(request.getParameter("id"));

// Realizar la b�squeda del usuario en la base de datos
String query = "SELECT * FROM usuarios WHERE id = ?";
PreparedStatement pstmt = conexionBD.getConexion().prepareStatement(query);
pstmt.setInt(1, id);
ResultSet rs = pstmt.executeQuery();

// Mostrar los datos del usuario y permitir su modificaci�n
if (rs.next()) {
    String nombre = rs.getString("nombre");
    String apellido = rs.getString("apellido");
    String fecha_nacimiento = rs.getString("fecha_nacimiento");
    String telefono = rs.getString("telefono");
    String email = rs.getString("email");
    String direccion = rs.getString("direccion");
%>
 
      
<h1>Modificar usuario</h1>

<!-- C�digo para cerrar la Sesi[on --> 
    <div id="cerrar-sesion">
        <button id="cerrar-sesion-btn">Cerrar sesi�n</button>
    </div>
    <script>
            const cerrarSesionBtn = document.getElementById('cerrar-sesion-btn');
            cerrarSesionBtn.addEventListener('click', function() {
            window.location.href = 'cerrarSesion.jsp';
            });
    </script>
    <!-- C�digo para cerrar la Sesi[on --> 

<img src="imagenlogo.png" alt="Imagen de fondo" id="imagen_fondo">
    <form action="modificar.jsp" method="post">
        <input type="hidden" name="id" value="<%=id%>">
        Nombre: <input type="text" name="nombre" value="<%=nombre%>"><br>
        Apellido: <input type="text" name="apellido" value="<%=apellido%>"><br>
        Fecha de Nacimiento: <input type="text" name="fecha_nacimiento" value="<%=fecha_nacimiento%>"><br>
        Tel�fono: <input type="text" name="telefono" value="<%=telefono%>"><br>
        Email: <input type="text" name="email" value="<%=email%>"><br>
        Direcci�n: <input type="text" name="direccion" value="<%=direccion%>"><br>
        <input type="submit" value="Guardar">
        
    </form>
        <form action="consultar.jsp">
  <button type="submit"> Volver  </button>
<%
} else {
%>
    <h1>No se encontr� el usuario con id <%=id%></h1>
<%
}

// Cerrar la conexi�n a la base de datos
rs.close();
pstmt.close();
conexionBD.desconectar();
%>

<% } %>
