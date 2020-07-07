<%-- 
    Document   : AgregarRegistro
    Created on : 4 jul 2020, 19:51:37
    Author     : Raquel
--%>

<%@page import="java.sql.*"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<%
    Connection conexion = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/funkopop", "root", "");
        stmt = conexion.prepareStatement("INSERT INTO funkos SET nombre=?");
        stmt.setString(1, request.getParameter("nombre"));
        if (stmt.executeUpdate() == 1) {
%>

<div class="alert alert-success" role="alert">
    <h2>Se agregó exitosamente el registro en la base de datos</h2>
</div>
<% 
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Agregar un nuevo Registro</title>
    </head>
     <style>
            body {
                    background-image: url("Images/fondo5.jpg");
                    
                    
                    background-size: cover;
            }
    </style>
    <body>
        <form action="index.jsp" methode="POST" class="form" >
            <div class="form-row">
                <div class="col">
                    <input type="submit" class="btn btn-success btn-block" value="Regresar" />
                </div>
            </div>
        </form>
    </body>
</html>
<%
    } catch (Exception e) {%>
    <form action="index.jsp" methode="POST" class="form" >
        <div class="alert alert-success" role="alert">
                    <h2 align="center">No se pudo agregar el registro a la base de datos, consulte con los administradores</h2>
                    <input type="submit" class="btn btn-success btn-block" value="Regresar" />
        </div>
    </form>
    <%}
%>