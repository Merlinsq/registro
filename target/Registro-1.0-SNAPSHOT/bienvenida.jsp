<link rel="stylesheet" type="text/css" href="estilos.css">
<link rel="icon" href="imagenlogo.png" type="image/png">

<% if (session.getAttribute("usuario") == null) { %>
  <% response.sendRedirect("ingreso.jsp"); %>
<% } else { %>

<html>
  <head>   
    <title>Bienvenida</title>
  </head>
  
  <body>  

    <header>
    <h1>Bienvenido</h1>
    <img src="imagenlogo.png" alt="Imagen de fondo" id="imagen_fondo"> 
    
    
    <h2>Página de Registro de la Iglesia Fuente del Cielo</h2>
  </header>
    <p>Por favor, rellene el siguiente formulario de registro</p>
    <form action="registro.jsp" method="post">
      <label for="nombre">Nombre:</label>
      <input type="text" name="nombre" id="nombre"><br>
      <label for="apellido">Apellido:</label>
      <input type="text" name="apellido" id="apellido"><br>
      <label for="fecha_nacimiento">Fecha de nacimiento:</label>
      <input type="date" name="fecha_nacimiento" id="fecha_nacimiento"><br>
      <label for="telefono">Teléfono:</label>
      <input type="tel" name="telefono" id="telefono"><br>
      <label for="email">Correo:</label>
      <input type="text" name="email" id="email"><br>
      <label for="direccion">Dirección:</label>
      <input type="text" name="direccion" id="direccion"><br>
      <label for="convertido">¿Ha sido convertido?</label>
      <select name="convertido" id="convertido">
        <option value="no">No</option>
        <option value="si">Sí</option>
      </select><br>
      <div id="fecha_conversion" style="display:none;">
        <label for="fecha_conversion">Fecha de conversión:</label>
        <input type="date" name="fecha_conversion" id="fecha_conversion"><br>
      </div>
      <script>
        var convertido = document.getElementById('convertido');
        var fechaConversion = document.getElementById('fecha_conversion');
        convertido.addEventListener('change', function() {
          if (convertido.value == 'si') {
            fechaConversion.style.display = 'block';
          } else {
            fechaConversion.style.display = 'none';
          }
        });
      </script>

      <input type="submit" value="Registrar">
      <input type="reset" value="Limpiar">
    </form>
    
    <br>
    <main>
    <section id="consultar">
      <h2>Consultar registros</h2>
      <a href="consultar.jsp"><button>Consultar</button></a>
    </section>
      
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
    <!-- Código para cerrar la Sesi[on --> 
    
    
  </main>
 <footer>
    <p>Versión 1.0</p>
  </footer>
  </body>
</html>
<% } %>