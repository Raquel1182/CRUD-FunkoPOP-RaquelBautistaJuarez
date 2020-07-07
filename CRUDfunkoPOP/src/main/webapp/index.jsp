<%-- 
    Document   : index
    Created on : 4 jun 2020, 18:44:59
    Author     : Raquel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>FunkoPOP</title>
    </head>
    <style>
        body {
                    background-image: url("Images/fondo5.jpg");
                    background-size: cover;
                    
                    
            }    
    </style>
    <body>
        

        <%-- style="background-color:#eaf7f8; background-size: cover;--%>
        <br>
        
        <div align="center">
         <img src="Images/funko.png" align="center" alt="funko" title="Funko" style="width:300px;height:300px;">
        </div>
        <br>
        <br>
        <h1 class="text-center">Tenemos la mejor selección para ti ¡Busca tu funkoPOP favorito!</h1>
        <br>
        <h5 class="text-center">
            ¿Quieres un muñeco Pop concreto?, busca en nuestro catálogo de categorías Pop, trabajamos cada día para 
            mantener las listas actualizadas e ir añadiendo todas las colecciones disponibles y las opciones de compra en México.
        </h5>
        <br>
        <br>
        
            <%
                Connection conexion;
                ResultSet rs = null;
                PreparedStatement ps;

                try {
                    String url = "jdbc:mysql://localhost/funkopop";
                    String Driver = "com.mysql.jdbc.Driver";
                    String user = "root";
                    String clave = "";
                    Class.forName(Driver);
                    conexion = DriverManager.getConnection(url, user, clave);

                    ps = conexion.prepareStatement("SELECT * from funkos");
                    rs = ps.executeQuery();

                } catch (Exception e) {
                    out.println("error" + e);
                }

            %>
            
        <div class="container-fluid">
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <td colspan="2"><h2>Registros</h2></td>
                        <td><a class="btn btn-success btn-block" href="formularioFunko.jsp">Agregar registro</a></td>
                    </tr>
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Peso del producto</th>
                    <th>Edad minima</th>
                    <th>Material</th>
                    <th>Numero de piezas</th>
                    <th>Precio</th>
                    <th>Categoria</th>
                    <th align="center">Acciones</th>
                    <th></th>
                </tr>
                </thead>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id_funko")%></td>
                    <td><%= rs.getString("nombre")%></td>
                    <td><%= rs.getString("peso_producto")%></td>
                    <td><%= rs.getString("edad_minima")%></td>
                    <td><%= rs.getString("material")%></td>
                    <td><%= rs.getInt("num_piezas")%></td>
                    <td><%= rs.getString("precio")%></td>
                    <td><%= rs.getInt("id_categoria")%></td>
                    <td><a class="btn btn-warning btn-block" href="formularioFunko.jsp?id=<%=rs.getInt("id_funko")%>">Editar precio</a></td>
                    <td><a class="btn btn-danger btn-block"  href="eliminarRegistro.jsp?id=<%out.print(rs.getInt("id_funko"));%>">Eliminar registro</a> </td>
                </tr>
                <%}%>
            </table>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </div>
        <%

            try {
                String url = "jdbc:mysql://localhost/funkopop";
                String Driver = "com.mysql.jdbc.Driver";
                String user = "root";
                String clave = "";
                Class.forName(Driver);
                conexion = DriverManager.getConnection(url, user, clave);

                ps = conexion.prepareStatement("Select * from cat_categorias");
                rs = ps.executeQuery();

            } catch (Exception e) {
                out.println("error" + e);
            }
        %>
        <div class="container-fluid">
            <table class="table table-hover" align="center" style="width:50%"><%--style="width:30%"--%>
                <h2 style="color:#005b96; font-family:Comic Sans MS,Arial,Verdana; text-align:center"> Catálogo </h2>
                <thead class="thead-dark">
                    <tr>
                        <td colspan="2"><h2>Categorías funkoPOP</h2></td>
                        <td><a class="btn btn-success btn-block"href="formularioCatalogo.jsp">Agregar categoria</a></td>
                    </tr>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <%
                    while (rs.next()) {
                %>

                <tr>
                    <td><%= rs.getInt("id_cat")%></td>
                    <td><%= rs.getString("nombre")%></td>
                    <td><a class="btn btn-danger btn-block"  href="eliminarCategoria.jsp?id=<%out.print(rs.getInt("id_cat"));%>">Eliminar categoría</a> </td>
                </tr>
                <%}%>
            </table>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </div>
    </body>
</html>
