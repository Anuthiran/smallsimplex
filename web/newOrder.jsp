<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Simplex Express</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="margin-top:10px;">
            <div clss="row">
                <div class="col-md-12">
                    <div class="panel panel-primary ">
                        <div class="panel-heading text-center">
                            <h4>Simplex Express Clients Order Placement<a href="clientHome.jsp" class='btn btn-default pull-right'><span class="glyphicon glyphicon-arrow-left"></span> Back To home</a></h4>                           
                        </div>
                        <div class="panel-body" style="margin: 10px;">
                            <div class="row">
                                <div class="col-md-3">
                                    <a href="order.jsp" class="btn btn-sm btn-primary btn-block "><span class="glyphicon glyphicon-eye-open "></span> My Orders</a>
                                </div>
                                <div class="col-md-3">
                                    <a href="newOrder.jsp" class="btn btn-sm btn-primary btn-block active"><span class="glyphicon glyphicon-plus"></span> Add New Order</a>
                                </div>
                            </div> 
                            <%
                                    if (msg != null) {
                                        out.println("<div class='alert alert-danger' style='margin-top:30px;'>" + msg + "</div>");
                                    }
                                %>
                                <form class="form-horizontal" action="addOrder.jsp" method="post" autocomplete="off"  style="margin: 30px; background-color: rgba(0, 0, 0, 0.0001); padding: 20px;">
                                <div class="row">
                                    <div class="col-md-4 " style="border: 1px solid #f5f5f5; padding: 20px;">
                                        <div class="text-warning text-center "><strong>Order Informations</strong></div><hr>
                                        <div class="form-group" >
                                            <label class="col-md-12">Order ID</label>
                                            <div class="col-md-12">
                                                <input type="text" name="id" class="form-control" placeholder="order id">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-md-12">Order Items</label>
                                            <div class="col-md-12">
                                                <textarea class="form-control" rows="3" name="items"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-md-12">Order Value</label>
                                            <div class="col-md-12">
                                                <input type="number" class="form-control" name="value" placeholder="order value">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-md-12">COD</label>
                                            <div class="col-md-12 radio">
                                                <label>
                                                    <div class="col-md-6"><input checked type="radio" name="cod" value="yes"> Yes</div>
                                                    <div class="col-md-6"><input type="radio" name="cod" value="no"> No</div>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 " style="border: 1px solid #f5f5f5; padding: 20px;">
                                        <div class="text-warning text-center"><strong>Pick Up Informations</strong></div><hr>
                                        <div class="form-group" >
                                            <label class="col-md-12">Pick up From</label>
                                            <div class="col-md-12 radio">
                                                <label>
                                                    <div class="col-md-8"><input checked type="radio" name="pickup" value="supplier"> Supplier</div>
                                                    <div class="col-md-4"><input type="radio" name="pickup" value="<%= session.getAttribute("client") %>"> Store</div>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-md-12">Select your Suppliers</label>
                                            <div class="col-md-12">
                                                <select class="form-control" name="sup_info">
                                                    <%
                                                        try {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
                                                            if (!con.isClosed()) {
                                                                Statement statement = con.createStatement();
                                                                ResultSet rs = statement.executeQuery("select * from supplier where client_name = 'kaymu'");
                                                                while (rs.next()) {
                                                    %>
                                                    <option value="<% out.println(rs.getString("name")+"\n"+rs.getString("address")+"\n"+rs.getString("phone")); %>">
                                                    <% out.println(rs.getString("name")); %><br>
                                                    <% out.println(rs.getString("address")); %><br>
                                                    <% out.println(rs.getString("phone")); %><br>
                                                    </option>
                                                    <%
                                                                }
                                                            }
                                                        } catch (Exception e) {
                                                            out.println(e.getMessage());
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 " style="border: 1px solid #f5f5f5; padding: 20px;">
                                        <div class="text-warning text-center"><strong>Delivery Informations</strong></div><hr>
                                        <div class="form-group" >
                                            <label class="col-md-12">Delivery To</label>
                                            <div class="col-md-12 radio">
                                                <label>
                                                    <div class="col-md-8"><input type="radio" checked name="delivery" value="customer"> Customer</div>
                                                    <div class="col-md-4"><input type="radio" name="delivery" value="<%= session.getAttribute("client") %>"> Store</div>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-md-12">Customer Name</label>
                                            <div class="col-md-12">
                                                <input type="text" class="form-control" name="cust_name" placeholder="Customer Name">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-md-12">Customer Address</label>
                                            <div class="col-md-12">
                                                <textarea class="form-control" name="cust_address" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-md-12">Customer Phone Number</label>
                                            <div class="col-md-12">
                                                <input type="number" class="form-control" name="cust_phone" placeholder="Customer phone number">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-md-12">Destination city</label>
                                            <div class="col-md-12">
                                                <select class="form-control" name="destination">
                                                    <option value="colombo">colombo</option>
                                                    <option value="jaffna">jaffna</option>
                                                    <option value="trico">trinco</option>
                                                    <option value="vavuniya">vavuniya</option>
                                                    <option value="kandy">kandy</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-md-6 ">
                                        <button type="submit" class="btn btn-block btn-success"><span class="glyphicon glyphicon-plus"></span> ADD ORDER</button>
                                    </div>
                                    <div class="col-md-6 ">
                                        <a href="order.jsp" class="btn btn-block btn-danger">CANCEL</a>
                                    </div>
                                </div>
                            </form>
                        </div>                          
                    </div>                       
                </div>                    
            </div>           
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>