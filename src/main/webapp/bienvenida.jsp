
<html>
  <head>
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
  background-color: #006FB0;
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
  background-color: #006FB0;
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
      
    <title>Bienvenida</title>
  </head>
  
  <body>
      
    <header>
    <h1>Bienvenido</h1>
    
    <h1>Página de Registro de la Iglesia Fuente del Cielo</h1>
  
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
  </main>
 <footer>
    <p>Versión 1.0 Desarrollado por MLS</p>
  </footer>
  </body>
</html>
