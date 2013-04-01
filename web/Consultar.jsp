-<%-- 
-    Document   : index
-    Created on : Mar 21, 2013, 4:25:01 PM
-    Author     : yepesk8r
---%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSULTA</title>
    </head>
    <body>
        <h1>Consultar</h1>
         <a href="index.jsp">Regresar al inicio</a>
        <% 
        String user = "root";
            String pwd = "root";
            Connection canal = null;
            ResultSet tabla = null;
            Statement instruccion = null;
            String sitiobase = "jdbc:mysql://localhost:8889/mibase?" + "user=root&password=root";
            String strcon = "com.mysql.jdbc.Driver";
            if (request.getParameter("OK") != null) {
                try {
                    Class.forName(strcon);
                    canal = DriverManager.getConnection(sitiobase);
                    instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    out.println("<TABLE Border=10 CellPadding=5><TR>");
                    out.println("<th bgcolor=Green> CLAVE </th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>Edad</th></TR>");
                    tabla = instruccion.executeQuery("SELECT * FROM mitabla");
                    while (tabla.next()) {
                        out.println("<TR>");
                        out.println("<TD>" + tabla.getString(1) + "</TD>");
                        out.println("<TD>" + tabla.getString(2) + "</TD>");
                        out.println("<TD>" + tabla.getString(3) + "</TD>");
                        out.println("<TR>");
                    };//FIN DEL WHILE
                    out.println("</TABLE></CENTER></DIV></HTML>");
                    tabla.close();
                    instruccion.close();
                    canal.close();
                } catch (SQLException sqlEx) {
                    System.out.println("SQL  Exception:" + sqlEx.toString());
                } catch (ClassNotFoundException classEx) {
                    System.out.println("hola" + classEx.toString());
                } catch (Exception Ex) {
                    System.out.println("Exception" + Ex.toString());
                }
            };
            out.println("<FORM ACTION=Consultar.jsp METHOD=post>");
            out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE= CONSULTA><BR>");
            out.println("</FORM>");
        %>
    </body>
</html>
