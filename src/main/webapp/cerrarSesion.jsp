<%-- 
    Document   : cerrarSesion
    Created on : 28 mar 2023, 18:59:47
    Author     : msand
--%>

<% 
  // Eliminar el atributo de sesi�n "usuario"
  session.removeAttribute("usuario");
  
  // Redirigir al usuario a la p�gina de inicio de sesi�n
  response.sendRedirect("ingreso.jsp");
%>
