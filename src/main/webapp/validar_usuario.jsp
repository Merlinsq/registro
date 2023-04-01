<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" type="text/css" href="estilos.css">
<link rel="icon" href="imagenlogo.png" type="image/png">
<%
   Class.forName("com.mysql.jdbc.Driver");
%>

<%
  // Cargar los valores de configuraci�n desde el archivo
    Properties propiedades = new Properties();
    InputStream entrada = request.getServletContext().getResourceAsStream("/WEB-INF/config/config.properties");
    propiedades.load(entrada);  
       
  // Obtener los valores de configuraci�n
    String url = propiedades.getProperty("db.url");
    String usuario = propiedades.getProperty("db.user");
    String password = propiedades.getProperty("db.password");
    Connection conexion = DriverManager.getConnection(url, usuario, password);
  
  


    // Obtener los datos del formulario
String email = request.getParameter("email");
String contra = request.getParameter("contra");


// Verificar si el usuario y contrase�a son v�lidos
boolean usuarioValido = false;
try {
    String sql = "SELECT * FROM administradores WHERE email=? AND contra=? ";
    PreparedStatement statement = conexion.prepareStatement(sql);
    statement.setString(1, email);
    statement.setString(2, contra);
    ResultSet resultado = statement.executeQuery();
    usuarioValido = resultado.next();
    
} catch (SQLException e) {
    out.println("Error al validar el usuario: " + e.getMessage());
    return;
}

// Si el usuario es v�lido, redirigir a la p�gina de registro
if (usuarioValido) {
    response.sendRedirect("bienvenida.jsp");
    // Establecer el atributo de sesi�n "usuario"
session.setAttribute("usuario", email);

    
    
} else {
    // Mostrar mensaje de error y permitir que el usuario intente ingresar de nuevo
    
    
}

%>

<html>
     
    <body>     
        <div class="container">
         <h1>Iniciar sesi�n</h1>
         <% if (usuarioValido) { %>
           <p>Bienvenido/a a la p�gina de bienvenida</p>
         <% } else { %>
           <p class="error">Usuario y/o contrase�a incorrectos. Por favor, int�ntelo de nuevo.</p>
                <form method="post" action="bienvenida.jsp">
                  <label for="email">Correo electr�nico:</label>
                  <input type="email" name="email" id="email">
                  <br>
                  <label for="contra">Contrase�a:</label>
                  <input type="password" name="contra" id="contra">
                  <br>
                  <input type="submit" value="Ingresar">
                </form>
           <a href="ingreso.jsp" class="btn-volver">Volver</a>
         <% } %>
       </div>    
   </body>     
</html>