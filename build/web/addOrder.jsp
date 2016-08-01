<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>

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
               
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String today = dateFormat.format(date);
            
            String client = (String)session.getAttribute("client");
         
            String id = request.getParameter("id");
            String items = request.getParameter("items");
            String val = request.getParameter("value");
            String cod = request.getParameter("cod");
            String pick = request.getParameter("pickup");
            String sup = request.getParameter("sup_info");
            String delivery = request.getParameter("delivery");
            String name = request.getParameter("cust_name");
            String address = request.getParameter("cust_address");
            String phone = request.getParameter("cust_phone");
            String city = request.getParameter("destination");
            
            if (id.equals("")||items.equals("")||val.equals("")||cod.equals("")|| pick.equals("")|| sup.equals("")|| delivery.equals("")|| name.equals("")||address.equals("")|| phone.equals("")|| city.equals("")) {
                response.sendRedirect("newOrder.jsp?msg=Please Fill all the required fields");
            } else {
                PreparedStatement ps = con.prepareStatement("insert into order_informations(id,client_name,order_id,order_item,order_value,cod,picup_from,supplier_details,delivery_to,customer_name,customer_addres,customer_phone,destination,date_time) values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)");
       
                ps.setString(1, client);
                ps.setString(2, id);
                ps.setString(3, items);
                ps.setString(4, val);
                ps.setString(5, cod);
                ps.setString(6, pick);
                ps.setString(7, sup);
                ps.setString(8, delivery);
                ps.setString(9, name);
                ps.setString(10, address);
                ps.setString(11, phone);
                ps.setString(12, city);
                ps.setString(13, today);
                
                ps.executeUpdate(); 
                
                response.sendRedirect("order.jsp");
            }
            
        }
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
     
%>
