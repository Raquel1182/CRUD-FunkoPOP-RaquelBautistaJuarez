<%-- 
    Document   : eliminarCategoria
    Created on : 4 jul 2020, 21:29:31
    Author     : Raquel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    int id = 0;
    String categoria = "";
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        Connection conexion = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/funkopop", "root", "");
            stmt = conexion.prepareStatement("SELECT * FROM cat_categorias WHERE id_cat=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            rs.next();
            categoria = rs.getString("nombre");
            id = rs.getInt("id_cat");
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Eliminar Categoria</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <style>
            body {
                    background-image: url("Images/fondo5.jpg");
                    
                    
                    background-size: cover;
            }
    </style>
    <body>
        <div>
            <h3 class="text-center" >¿Esta seguro de eliminar la categoria?</h3>
        </div>
         <a href="index.jsp" class="btn btn-primary btn-block">Cancelar</a> 
        <div><a class="btn btn-danger btn-block" href="eliminarCategoria2.jsp?id=<%out.print(id);%>">Eliminar</a></div>
    </body>
</html>
