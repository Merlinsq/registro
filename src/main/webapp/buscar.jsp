<%@page import="java.sql.*" %>

<%
// Establecer la conexión a la base de datos
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/miembros_fuente";
String user = "root";
String password = "12345678";

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
}

// Obtener el id del usuario a buscar
int id = Integer.parseInt(request.getParameter("id"));

// Realizar la búsqueda del usuario en la base de datos
String query = "SELECT * FROM usuarios WHERE id = ?";
PreparedStatement pstmt = conn.prepareStatement(query);
pstmt.setInt(1, id);
ResultSet rs = pstmt.executeQuery();

// Mostrar los datos del usuario y permitir su modificación
if (rs.next()) {
    String nombre = rs.getString("nombre");
    String apellido = rs.getString("apellido");
    String fecha_nacimiento = rs.getString("fecha_nacimiento");
    String telefono = rs.getString("telefono");
    String email = rs.getString("email");
    String direccion = rs.getString("direccion");
%>
   
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
<h1>Modificar usuario</h1>
    <form action="modificar.jsp" method="post">
        <input type="hidden" name="id" value="<%=id%>">
        Nombre: <input type="text" name="nombre" value="<%=nombre%>"><br>
        Apellido: <input type="text" name="apellido" value="<%=apellido%>"><br>
        Fecha de Nacimiento: <input type="text" name="fecha_nacimiento" value="<%=fecha_nacimiento%>"><br>
        Teléfono: <input type="text" name="telefono" value="<%=telefono%>"><br>
        Email: <input type="text" name="email" value="<%=email%>"><br>
        Dirección: <input type="text" name="direccion" value="<%=direccion%>"><br>
        <input type="submit" value="Guardar cambios">
    </form>
<%
} else {
%>
    <h1>No se encontró el usuario con id <%=id%></h1>
<%
}

// Cerrar la conexión a la base de datos
rs.close();
pstmt.close();
conn.close();
%>


