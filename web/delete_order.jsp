<%@page import="java.sql.*;"%>
<%
    if (session != null) {
        if (session.getAttribute("client") != null) {
            String user = (String) session.getAttribute("client");
        } else {
            response.sendRedirect("index.jsp?msg=Please login here");
        }
    }
%>
<%
    String id = request.getParameter("id");
    //out.println(id);
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
        if (!con.isClosed()) { 
            PreparedStatement ps = con.prepareStatement("delete from order_informations where id=?");
       
                ps.setString(1, id);
                
                ps.executeUpdate(); 
                
                response.sendRedirect("order.jsp"); 
        }
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
