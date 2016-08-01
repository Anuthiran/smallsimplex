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

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Simplex Express</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="css/dataTables.bootstrap.css" >
    </head>
    <body>
        <div class="container" style="margin-top:10px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary ">
                        <div class="panel-heading text-center">
                            <h4>Simplex Express Clients Suppliers Informations<a href="clientHome.jsp" class='btn btn-default pull-right'><span class="glyphicon glyphicon-arrow-left"></span> Back To home</a></h4>                           
                        </div>
                        <div class="panel-body" style="margin: 10px;">
                            <div class="row">
                                <div class="col-md-3">
                                    <a href="supplier.jsp" class="btn btn-sm btn-primary btn-block active"><span class="glyphicon glyphicon-eye-open "></span> My Suppliers</a>
                                </div>
                                <div class="col-md-3">
                                    <a href="newSupplier.jsp" class="btn btn-sm btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span> Add New Suppliers</a>
                                </div>
                            </div> 
                            <div class="row">
                                <table id="view_supplier" class="table table-striped table-bordered table-hover table-responsive text-center" style="font-size: 12px;">
                                    <h3 class="text-primary text-center"><strong>Simplex clients</strong></h3>
                                    <thead>
                                        <tr class=" bg-primary">
                                            <th>Supplier Name</th>
                                            <th>Supplier Address</th>
                                            <th>Supplier Phone</th>
                                            <th>Contact Person</th>
                                            <th>Contact Phone</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr class=" bg-primary">
                                            <th>Supplier Name</th>
                                            <th>Supplier Address</th>
                                            <th>Supplier Phone</th>
                                            <th>Contact Person</th>
                                            <th>Contact Phone</th>
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
                                                    ResultSet rs = statement.executeQuery("select * from supplier where client_name = 'kaymu'");
                                                    while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><% out.println(rs.getString("name")); %></td>
                                            <td><% out.println(rs.getString("address")); %></td>
                                            <td><% out.println(rs.getString("phone")); %></td>
                                            <td><% out.println(rs.getString("contact_person")); %></td>
                                            <td><% out.println(rs.getString("contact_phone")); %></td>
                                            <td><a href="edit_supplier.jsp?id=<% out.println(rs.getString("id")); %>" class="btn btn-warning"><span class="glyphicon glyphicon-edit"> </span></a></td>   
                                            <td><a href="delete_supplier.jsp?id=<% out.println(rs.getString("id")); %>" onclick="return checkDelete()" class="btn btn-danger"><span class="glyphicon glyphicon-trash"> </span></a></td>
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
        <script src="js/jquery.dataTables.js"></script>
        <script src="js/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function() {
                $('#view_supplier').DataTable({});
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