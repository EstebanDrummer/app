<%-- 
    Document   : Insertar
    Created on : Apr 1, 2013, 10:44:48 AM
    Author     : yepesk8r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insertar</h1>
        <a href="index.jsp">Regresar al inicio</a>
        <%
          out.println("<FORM ACTION=Insertar.jsp METHOD=post>");
          out.println("ID: <input type=text name=id><BR>");
          out.println("Nombre: <input type=text name=nombre><BR>");
          out.println("Edad: <input type=text name=edad><BR>");
          out.println("<INPUT TYPE=SUBMIT NAME=insertar VALUE= Insertar><BR>");
          out.println("</FORM>");
        %>
    </body>
</html>
