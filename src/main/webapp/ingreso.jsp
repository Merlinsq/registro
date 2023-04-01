<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="estilos.css">
    
    <title>Ingreso de usuarios</title>
    <link rel="icon" href="imagenlogo.png" type="image/png">
  </head>
  
  <body>
     
    <h1>Registro</h1>
    <h2>Fuente del Cielo</h2>
    <h3>Somos Familia...</h3>
    <img src="imagenlogo.png" alt="Imagen de fondo" id="imagen_fondo">
    <form action="validar_usuario.jsp" method="post">
      <label for="email">Email:</label>
      <input type="text" name="email" id="email">
      <label for="contra">Contraseña:</label>
      <input type="password" name="contra" id="contra">
      <input type="submit" value="Validar">
    </form>
    <h3>Version 1.0</h3>
  </body>
  
</html>




