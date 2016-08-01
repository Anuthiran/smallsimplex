<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Simplex Admin Home</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/dataTables.bootstrap.css" >
    </head>
    <body>
        <div class="container" style="margin-top:10px;">
            <div clss="row">
                <div class="col-md-12">
                    <div class="panel panel-primary ">
                        <div class="panel-heading text-center">
                            <h4>Simplex Express Clients <a href="../adminHome.jsp" class='btn btn-default pull-right'><span class="glyphicon glyphicon-arrow-left"></span> Back To home</a></h4>                           
                        </div>
                        <div class="panel-body" style="margin: 10px;">
                            <div class="row">
                                <div class="col-md-3">
                                    <a href="client.jsp" class="btn btn-sm btn-primary btn-block active"><span class="glyphicon glyphicon-user "></span> Our Clients</a>
                                </div>
                                <div class="col-md-3">
                                    <a href="newClient.jsp" class="btn btn-sm btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span> Add New Clients</a>
                                </div>
                            </div>  
                            <div class="row">
                                <table id="view_client" class="table table-striped table-bordered table-hover table-responsive text-center" >
                                    <h3 class="text-primary text-center"><strong>Simplex clients</strong></h3>
                                    <thead>
                                        <tr class=" bg-primary">
                                            <th>Name</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr class=" bg-primary">
                                            <th>Name</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </tfoot>
                                    <tbody> 
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smallsimplex", "root", "");
                                                if (!con.isClosed()) {
                                                    Statement statement = con.createStatement();
                                                    ResultSet rs = statement.executeQuery("select * from client");
                                                    while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><% out.println(rs.getString("storename")); %></td>
                                            <td><% out.println(rs.getString("username")); %></td>
                                            <td><% out.println(rs.getString("password")); %></td>
                                            <td><a href="edit_client.jsp?id=<% out.println(rs.getString("id")); %>" class="btn btn-warning"><i class="glyphicon glyphicon-edit"> </span></a></td>   
                                            <td><a href="delete_client.jsp?id=<% out.println(rs.getString("id")); %>" onclick="return checkDelete()" class="btn btn-danger"><i class="glyphicon glyphicon-trash"> </span></a></td>
                                        </tr>
                                        <%
                                                    }
                                                }
                                            } catch (Exception e) {
                                                out.println(e.getMessage());
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>                          
                    </div>                       
                </div>                    
            </div>  

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="../../js/jquery.dataTables.js"></script>
	<script src="../../js/dataTables.bootstrap.js"></script>
        <script>
             $(document).ready(function(){
		 $('#view_client').DataTable({});
             });
        </script>
        <script>
              function checkDelete(){
                   var r = confirm("Do You Want To Delete This Record ?");
                   if (r == true) {				
                    } 
                    else {
                        return false;
                     }
               }
        </script>
    </body>
</html>