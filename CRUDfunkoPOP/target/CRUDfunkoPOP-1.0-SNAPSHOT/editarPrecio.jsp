<%-- 
    Document   : editarPrecio
    Created on : 4 jul 2020, 19:55:18
    Author     : Raquel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<%
    Connection conexion = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/funkopop", "root", "");
        stmt = conexion.prepareStatement("UPDATE funkos SET precio=? WHERE id_funko = ?");
        stmt.setString(1,request.getParameter("precio"));
        stmt.setInt(2,Integer.parseInt(request.getParameter("id_funko")));
        if (stmt.executeUpdate()>0) {
%>
                <div class="alert alert-success" role="alert">
                    <h2 align="center">Se realizó exitosamente la modificacion</h2>
                </div>
                <%}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title align="center">Agregar un nuevo Registro</title>
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
                    <h2 align="center">La modificacion no ha sido exitosa</h2>
                    <input type="submit" class="btn btn-success btn-block" value="Regresar" />
        </div>
    </form>
    <%}
%>