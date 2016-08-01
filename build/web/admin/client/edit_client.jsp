<%@page import="java.sql.*;"%>

<%
    String id = request.getParameter("id");
   // out.println(id);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Simplex Admin Home</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    </head>
    <body>

        <div class="container" style="margin-top:10px;">
            <%                
                    try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
                    if (!con.isClosed()) {
                        Statement statement = con.createStatement();
                        ResultSet rs = statement.executeQuery("select * from client where id='" + id + "'");
                        while (rs.next()) {
            %>
            <div clss="row">
                <div class="col-md-12">
                    <div class="panel panel-primary ">
                        <div class="panel-heading text-center">
                            <h4>Simplex Express Edit Clients <a href="../adminHome.jsp" class='btn btn-default pull-right'><span class="glyphicon glyphicon-arrow-left"></span> Back To home</a></h4>

                        </div>
                        <div class="panel-body" style="margin: 10px;">  
                            <div class="row" style="margin: 10px;">
                                <div class="col-md-12">
                                    <h4 class="text-danger">Now you can edit your Client Details</h4>
                                </div>
                            </div>  
                            <div class="row" style="margin: 20px;">
                                <form class="form-horizontal" action="update_client.jsp" method="get">
                                    <input type="hidden" name="id" value="<% out.println(id);%>">
                                    <div class="form-group" >
                                        <label class="col-md-2 control-label">Online Store Name</label>
                                        <div class="col-md-10">
                                            <input type="text" name="store" class="form-control" value="<% out.println(rs.getString("storename")); %>">
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <label class="col-md-2 control-label">User Name</label>
                                        <div class="col-md-10">
                                            <input type="text" name="user" class="form-control" value="<% out.println(rs.getString("username")); %>">
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <label class="col-md-2 control-label">Password</label>
                                        <div class="col-md-10">
                                            <input name="pwd" type="password" class="form-control" value="<% out.println(rs.getString("password")); %>">
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <label class="col-md-2 control-label">Confirm Password</label>
                                        <div class="col-md-10">
                                            <input name="cpwd" type="password" class="form-control" value="<% out.println(rs.getString("password")); %>">
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <div class="col-md-6">
                                            <button  type="submit" class="btn btn-block btn-success">UPDATE</button>
                                        </div>
                                        <div class="col-md-6">
                                            <a href="client.jsp" type="submit" class="btn btn-block btn-danger">CANCEL</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>                          
                    </div>                       
                </div>                    
            </div> 
            <%
                        }
                    }
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>
