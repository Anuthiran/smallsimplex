<%@page import="java.sql.*;"%>

<%
    String name = request.getParameter("uname");
    String pwd = request.getParameter("pwd");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
        if (!con.isClosed()) {

            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");

            ps.setString(1, name);
            ps.setString(2, pwd);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                session.setAttribute( "admin", name );
                response.sendRedirect("adminHome.jsp");
            } else {
                response.sendRedirect("login.jsp?msg=Please Check Your Username and password");
            }

        }
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
