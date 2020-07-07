<%-- 
    Document   : eliminarCategoria2
    Created on : 4 jul 2020, 21:29:41
    Author     : Raquel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<body>

</body>
<%

    if (request.getParameter("id") != null) {

        Connection conexion = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/funkopop", "root", "");
            stmt = conexion.prepareStatement("DELETE FROM cat_categorias WHERE id_cat=?");
            stmt.setString(1, request.getParameter("id"));
            stmt.executeUpdate();
        } catch (Exception e) {
            out.print(e.getMessage());
        }
    }
%>
