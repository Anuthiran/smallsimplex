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
    String sname = request.getParameter("sname");
    String sphone = request.getParameter("sphone");
    String saddress = request.getParameter("saddress");
    String cname = request.getParameter("cname");
    String cphone = request.getParameter("cphone");
    
    //out.println(id);

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
        if (!con.isClosed()) {
            
            PreparedStatement ps = con.prepareStatement("update supplier set name=?, address=?, phone=?, contact_person=?, contact_phone=? where id=?");
       
                ps.setString(1, sname);
                ps.setString(2, saddress);
                ps.setString(3, sphone);
                ps.setString(4, cname);
                ps.setString(5, cphone);
                ps.setString(6, id);
                
                ps.executeUpdate(); 
                
                response.sendRedirect("supplier.jsp"); 
        }
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
        
%>