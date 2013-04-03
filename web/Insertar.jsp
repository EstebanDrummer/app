<%-- 
    Document   : Insertar
    Created on : Apr 1, 2013, 10:44:48 AM
    Author     : yepesk8r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar</title>
    </head>
    <body>
        <h1>Insertar</h1>
        <a href="index.jsp">Regresar al inicio</a>
        <%
             Connection canal = null;
             ResultSet tabla = null;
             Statement instruccion = null;
             String sitiobase = "jdbc:mysql://localhost:8889/mibase?" + "user=root&password=root";
             String strcon = "com.mysql.jdbc.Driver";
             if (request.getParameter("insertar") != null) {
                 try {
                         Class.forName(strcon);
                         canal = DriverManager.getConnection(sitiobase);
                         instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                         String id= request.getParameter("id");
                         String nombre =request.getParameter("nombre");
                         String edad =request.getParameter("edad");
                         String insertar = "INSERT INTO mitabla VALUES("+id+",'"+nombre+"',"+edad+") ";
                         int re = instruccion.executeUpdate(insertar);
                         out.println("Registro Ingresado con éxito");
                    instruccion.close();
                    canal.close();
                    } catch (SQLException sqlEx) {
                         System.out.println("SQL  Exception:" + sqlEx.toString());
                         out.println("No se pudo ingresar el Registro");
                     } catch (ClassNotFoundException classEx) {
                         System.out.println("hola" + classEx.toString());
                     } catch (Exception Ex) {
                         System.out.println("Exception" + Ex.toString());
                     }
             };
             //  Construccion de formulario
             out.println("<FORM ACTION=Insertar.jsp METHOD=post>");
             out.println("ID: <input type=text name=id><BR>");
             out.println("Nombre: <input type=text name=nombre><BR>");
             out.println("Edad: <input type=text name=edad><BR>");
             out.println("<INPUT TYPE=SUBMIT NAME=insertar VALUE= Insertar><BR>");
             out.println("</FORM>");
        %>
    </body>
</html>
