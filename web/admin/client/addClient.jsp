<%@page import="java.sql.*;"%>
<%
    if (session != null) {
        if (session.getAttribute("admin") != null) {
            String user = (String) session.getAttribute("admin");
        } else {
            response.sendRedirect("login.jsp?msg=Please login here");
        }
    }
%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
        if (!con.isClosed()) {
            //out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            String store = request.getParameter("store");
            String user = request.getParameter("user");
            String pwd = request.getParameter("pwd");
            String cpwd = request.getParameter("cpwd");

            //out.println(store);
            //out.println(user);
            //out.println(pwd);
            //out.println(cpwd);
            if (store.equals("") || user.equals("") || pwd.equals("") || cpwd.equals("")) {
                response.sendRedirect("newClient.jsp?msg=Please Fill all the required fields");
            } else {
                if(!pwd.equals(cpwd)){
                    response.sendRedirect("newClient.jsp?msg=Please check your password. different Password");
                }else{
                PreparedStatement ps = con.prepareStatement("insert into client(id,storename,username,password) values(null,?,?,?)");

                ps.setString(1, store);
                ps.setString(2, user);
                ps.setString(3, pwd);

                ps.executeUpdate();

                response.sendRedirect("client.jsp");
                }
            }
        }
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
