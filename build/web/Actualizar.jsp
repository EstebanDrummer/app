<%-- 
    Document   : Actualizar
    Created on : Apr 1, 2013, 10:46:28 AM
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
        <h1>Actualizar</h1>
        <a href="index.jsp">Regresar al inicio</a><BR>
        <%
            Connection canal = null;
            ResultSet tabla = null;
            Statement instruccion = null;
            String sitiobase = "jdbc:mysql://localhost:8889/mibase?" + "user=root&password=root";
            String strcon = "com.mysql.jdbc.Driver";
            
             out.println("<FORM ACTION=Actualizar.jsp METHOD=post>");
             out.println("ID: <input type=text name=id><BR>");
             out.println("<INPUT TYPE=SUBMIT NAME=buscar VALUE=Buscar><BR>");
             out.println("</FORM>"); 
             if(request.getParameter("buscar")!=null){
                 
                try {
                    Class.forName(strcon);
                    canal = DriverManager.getConnection(sitiobase);
                    instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    
                    String id = request.getParameter("id");
                    String consulta = "SELECT * FROM mitabla WHERE id="+id;
                    tabla = instruccion.executeQuery(consulta);
                    tabla.next();
                    id = tabla.getString(1);
                    out.println("<TABLE Border=10 CellPadding=5><TR>");
                    out.println("<th bgcolor=Green> CLAVE </th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>Edad</th></TR>");
                    out.println("<TR>");
                    out.println("<TD>" + tabla.getString(1) + "</TD>");
                    out.println("<TD>" + tabla.getString(2) + "</TD>");
                    out.println("<TD>" + tabla.getString(3) + "</TD>");
                    out.println("</TABLE></CENTER></DIV></HTML>");
                    out.println("<TR>");
                    out.println("<FORM ACTION=Actualizar.jsp METHOD=post>");
                    out.println("ID: <input type=text name=idd  value="+id+" readonly ><BR>");
                    out.println("Nombre: <input type=text name=nombre><BR>");
                    out.println("Edad: <input type=text name=edad ><BR>");
                    out.println("<INPUT TYPE=SUBMIT NAME=actualizar VALUE=Actualizar><BR>");
                    out.println("</FORM>");                     
                    tabla.close();
                    instruccion.close();
                    

                    canal.close();
                } catch (SQLException sqlEx) {
                    System.out.println("SQL  Exception:" + sqlEx.toString());
                    out.println("NO SE ENCONTRÓ EL REGISTRO" );
                } catch (ClassNotFoundException classEx) {
                    System.out.println("hola" + classEx.toString());
                } catch (Exception Ex) {
                    System.out.println("Exception" + Ex.toString());
                }
             };
              if (request.getParameter("actualizar") != null) {
                 try {
                         Class.forName(strcon);
                         canal = DriverManager.getConnection(sitiobase);
                         instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                         String id = request.getParameter("idd");
                         String nombre =request.getParameter("nombre");
                         String edad =request.getParameter("edad");
                         String actualizar = "UPDATE mitabla SET NOMBRE = '"+nombre+"', EDAD="+edad+" WHERE id="+id+";";
                         out.println("Registro actualizado con exito");
                    int re = instruccion.executeUpdate(actualizar);
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
             
        %>
    </body>
</html>
