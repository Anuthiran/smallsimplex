<%@page import="java.sql.*;"%>

<%
    String id = request.getParameter("id");
    out.println(id);
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
        if (!con.isClosed()) { 
            PreparedStatement ps = con.prepareStatement("delete from client where id=?");
       
                ps.setString(1, id);
                
                ps.executeUpdate(); 
                
                response.sendRedirect("client.jsp"); 
        }
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>