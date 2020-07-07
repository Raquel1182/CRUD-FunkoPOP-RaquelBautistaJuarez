<%-- 
    Document   : formularioCatalogo
    Created on : 4 jul 2020, 21:28:07
    Author     : Raquel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String titulo = "Agregar categoria", nombre = "", action = "agregarCategoria.jsp";
    int id = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        titulo = "Editar Categoria";
        action = "editarCategoria.jsp";
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
            nombre = rs.getString("nombre");
            
            
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>Formulario Funko</title>
    </head>
     <style>
            body {
                    background-image: url("Images/fondo5.jpg");
                    
                    
                    background-size: cover;
            }
    </style>
    <body>
        <h1 class="text-center"><%=titulo%></h1>
        <div class="container">
            <form action="<%=action%>" method="GET" >
                <div class="form-group">   
                    <% if (id != 0) {%>
                    <div>
                        <input type="hidden" class="form-control"  name="id_funko" value="<%=id%>"/><br>
                    </div>
                    <% }%>
                    <div>
                        <input type="text" value="<%=nombre%>" class="form-control" placeholder="Categoria" name="nombre" required><br>
                    </div>
                    
                    <div class="col">
                        <input type="submit"  class="btn btn-success  btn-block " value="Enviar"/><br>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>

