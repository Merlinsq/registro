<%-- 
    Document   : cerrarSesion
    Created on : 28 mar 2023, 18:59:47
    Author     : msand
--%>

<% 
  // Eliminar el atributo de sesión "usuario"
  session.removeAttribute("usuario");
  
  // Redirigir al usuario a la página de inicio de sesión
  response.sendRedirect("ingreso.jsp");
%>
