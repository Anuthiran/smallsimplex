<%@page import="java.sql.*;"%>

<%
    String id = request.getParameter("id");
    String store = request.getParameter("store");
    String user = request.getParameter("user");
    String pwd = request.getParameter("pwd");
    String cpwd = request.getParameter("cpwd");
    
    out.println(id);

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
        if (!con.isClosed()) {
            
            PreparedStatement ps = con.prepareStatement("update client set storename=?, username=?, password=? where id=?");
       
                ps.setString(1, store);
                ps.setString(2, user);
                ps.setString(3, pwd);
                ps.setString(4, id);
                
                ps.executeUpdate(); 
                
                response.sendRedirect("client.jsp"); 
        }
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
