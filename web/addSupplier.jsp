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
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
        if (!con.isClosed()) {

            String sname = request.getParameter("sname");
            String sphone = request.getParameter("sphone");
            String saddress = request.getParameter("saddress");
            String cname = request.getParameter("cname");
            String cphone = request.getParameter("cphone");

            if (sname.equals("")||sphone.equals("")||saddress.equals("")||cname.equals("")|| cphone.equals("")) {
                response.sendRedirect("newSupplier.jsp?msg=Please Fill all the required fields");
            } else {
                PreparedStatement ps = con.prepareStatement("insert into supplier(id,client_name,name,address,phone,contact_person,contact_phone) values(null,'kaymu',?,?,?,?,?)");
       
                ps.setString(1, sname);
                ps.setString(2, saddress);
                ps.setString(3, sphone);
                ps.setString(4, cname);
                ps.setString(5, cphone);
                
                ps.executeUpdate(); 
                
                response.sendRedirect("supplier.jsp");
            }
        }
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
     
%>
