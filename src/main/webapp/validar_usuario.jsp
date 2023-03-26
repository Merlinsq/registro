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
String email = request.getParameter("email");
String contra = request.getParameter("contra");

// Verificar si el usuario y contraseña son válidos
boolean usuarioValido = false;
try {
    String sql = "SELECT * FROM administradores WHERE email=? AND contra=?";
    PreparedStatement statement = conexion.prepareStatement(sql);
    statement.setString(1, email);
    statement.setString(2, contra);
    ResultSet resultado = statement.executeQuery();
    usuarioValido = resultado.next();
    
} catch (SQLException e) {
    out.println("Error al validar el usuario: " + e.getMessage());
    return;
}

// Si el usuario es válido, redirigir a la página de registro
if (usuarioValido) {
    response.sendRedirect("bienvenida.jsp");
    
    
} else {
    // Mostrar mensaje de error y permitir que el usuario intente ingresar de nuevo
    
    
}

%>


<html>
    
    <head>
        
        <style>
          
            body {
  background-color: #f2f2f2;
}

h1 {
  font-size: 24px;
  color: #333;
}

p {
  font-size: 16px;
  color: #666;
}

.btn-volver {
  background-color: #333;
  color: #fff;
  padding: 10px 20px;
  border-radius: 5px;
  text-decoration: none;
  display: inline-block;
  margin-top: 20px;
}
.container {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0,0,0,0.1);
}

form {
  margin-top: 20px;
}

label {
  display: block;
  margin-bottom: 5px;
}

input[type="email"], input[type="password"], input[type="submit"] {
  display: block;
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 5px;
  border: none;
}

input[type="submit"] {
  background-color: #333;
  color: #fff;
  cursor: pointer;
}

.error {
  color: #ff0000;
  font-weight: bold;
}

            
          
      </style>
        
    </head>
  
  <body>
      
      <div class="container">
  <h1>Iniciar sesión</h1>
  <% if (usuarioValido) { %>
    <p>Bienvenido/a a la página de bienvenida</p>
    
  <% } else { %>
    <p class="error">Usuario y/o contraseña incorrectos. Por favor, inténtelo de nuevo.</p>
    <form method="post" action="bienvenida.jsp">
      <label for="email">Correo electrónico:</label>
      <input type="email" name="email" id="email">
      <br>
      <label for="contra">Contraseña:</label>
      <input type="password" name="contra" id="contra">
      <br>
      <input type="submit" value="Ingresar">
    </form>
    <a href="ingreso.jsp" class="btn-volver">Volver</a>
  <% } %>
</div>

      
  </body>
      
</html>