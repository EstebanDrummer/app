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
        <a href="index.jsp">Regresar al inicio</a>
        <%
            Connection canal = null;
            ResultSet tabla = null;
            Statement instruccion = null;
            String sitiobase = "jdbc:mysql://localhost:8889/mibase?" + "user=root&password=root";
            String strcon = "com.mysql.jdbc.Driver";
            
             if(request.getParameter("buscar")!=null){
                try {
                    Class.forName(strcon);
                    canal = DriverManager.getConnection(sitiobase);
                    instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    
                    String id = request.getParameter("id");
                    String consulta = "SELECT * FROM mitabla WHERE id="+id;
                    tabla = instruccion.executeQuery(consulta);
                    tabla.next();
                    out.println(tabla.getString(1));
                    if(tabla.getString(1)!=null)
                    {
                        String idd=tabla.getString(1);out.println("listo");
                        request.setAttribute("Enable", "edad");
                    }
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
             
             if(request.getParameter("actualizar")!=null){
                 out.println("soy actualizar");
             };
           
             out.println("<FORM ACTION=Actualizar.jsp METHOD=post>");
             out.println("ID: <input type=text name=id><BR>");
             out.println("<INPUT TYPE=SUBMIT NAME=buscar VALUE=Buscar><BR>");
             out.println("Nombre: <input type=text name=nombre disabled=enable><BR>");
             out.println("Edad: <input type=text name=edad disabled=disabled><BR>");
             out.println("<INPUT TYPE=SUBMIT NAME=actualizar VALUE=Actualizar disabled=disabled><BR>");
             out.println("</FORM>"); 
        %>
    </body>
</html>
