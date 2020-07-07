<%-- 
    Document   : eliminarRegistro2
    Created on : 4 jul 2020, 21:20:31
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
            stmt = conexion.prepareStatement("DELETE FROM funkos WHERE id_funko=?");
            stmt.setString(1, request.getParameter("id"));
            stmt.executeUpdate();
        } catch (Exception e) {
            out.print(e.getMessage());
        }
    }
%>
