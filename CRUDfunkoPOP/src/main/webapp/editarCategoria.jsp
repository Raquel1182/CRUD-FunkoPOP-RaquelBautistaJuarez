<%-- 
    Document   : editarCategoria
    Created on : 4 jul 2020, 21:29:01
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
        stmt = conexion.prepareStatement("UPDATE cat_categorias SET nombre=? WHERE id_cat = ?");
        stmt.setString(1,request.getParameter("nombre"));
        stmt.setInt(2,Integer.parseInt(request.getParameter("id_cat")));
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
        <title>Agregar una nueva Categoria</title>
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