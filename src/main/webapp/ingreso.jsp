<!DOCTYPE html>
<html>
  <head>
    <title>Ingreso de usuarios</title>
    <link rel="icon" href="C:\Users\msand\OneDrive\Escritorio/imagenlogo.png" type="image/png">

    <style>
      /* Aplicamos estilos al body para centrar el contenido y aplicar un fondo de color */
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #F9FAFB;
      }

      /* Estilos para el título */
      h1 {
        font-size: 3rem;
        text-align: center;
        text-transform: uppercase;
        font-family: "Arial Black", sans-serif;
        margin-top: 0;
        padding-top: 50px;
        
      }

      /* Efecto de sombra para el título */
      h1::before {
        content: "";
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        box-shadow: 0px 0px 15px #ccc;
        z-index: -1;
      }

      /* Efecto degradado para el título 
      h1::after {
        content: "Registro Fuente del Cielo";
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(to right, #00c3ff, #ffff1c, #ff00c3);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        z-index: -2;
      }*/

      /* Estilos para el formulario */
      form {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0px 0px 5px #ccc;
        background-color: white;
        margin-top: 50px;
      }
      
      /* Estilos para los labels */
      label {
        font-size: 18px;
        margin-bottom: 10px;
      }
      
      /* Estilos para los inputs */
      input {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 20px;
        width: 100%;
        box-sizing: border-box;
      }
      
      /* Estilos para el botón */
      input[type="submit"] {
        background-color: #006FB0;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
      }
      
      /* Efecto hover para el botón */
      input[type="submit"]:hover {
        background-color: #007EB0;
      }
    </style>
  </head>
  <body>
      <img src="C:\Users\msand\OneDrive\Escritorio/imagenlogo.png" alt="escudo" style="position: absolute; top: 0; left: 0; width: 50px; height: 50px;">

    <h1>Registro Fuente del Cielo</h1>
    <form action="validar_usuario.jsp" method="post">
      <label for="email">Email:</label>
      <input type="text" name="email" id="email">
      <label for="contra">Contraseña:</label>
      <input type="password" name="contra" id="contra">
      <input type="submit" value="Validar">
    </form>
  </body>
  
</html>




