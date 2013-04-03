<%-- 
    Document   : Borrar
    Created on : Apr 1, 2013, 10:46:47 AM
    Author     : yepesk8r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Borrar</h1>
        <a href="index.jsp">Regresar al inicio</a>
        <%
             Connection canal = null;
             ResultSet tabla = null;
             Statement instruccion = null;
             String sitiobase = "jdbc:mysql://localhost:8889/mibase?" + "user=root&password=root";
             String strcon = "com.mysql.jdbc.Driver";
                if (request.getParameter("Borrar") != null) {
                 try {
                         Class.forName(strcon);
                         canal = DriverManager.getConnection(sitiobase);
                         instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                         String id= request.getParameter("id");
                         String borrar = "DELETE FROM mitabla WHERE id = "+id ;
                         int re =instruccion.executeUpdate(borrar);
                         instruccion.close();
                         canal.close();
                     } catch (SQLException sqlEx) {
                         System.out.println("SQL  Exception:" + sqlEx.toString());
                         out.println("No se pudo Borrar el registro");
                     } catch (ClassNotFoundException classEx) {
                         System.out.println("hola" + classEx.toString());
                     } catch (Exception Ex) {
                         System.out.println("Exception" + Ex.toString());
                     }
                };
                out.println("<FORM ACTION=Borrar.jsp METHOD=post>");
                out.println("ID: <input type=text name=id><BR>");
                out.println("<INPUT TYPE=SUBMIT NAME=Borrar VALUE=Borrar><BR>");
                out.println("</FORM>");
        %>
    </body>
</html>
