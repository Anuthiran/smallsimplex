<%
    if (session != null) {
        if (session.getAttribute("client") != null) {
            String user = (String) session.getAttribute("client");
        } else {
            response.sendRedirect("index.jsp?msg=Please login here");
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Simplex Admin HomeS</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="margin-top:50px;">
            <div clss="row">
                <div class="col-md-12">
                    <div class="panel panel-primary ">
                        <div class="panel-heading text-center">
                            <h3><span class="glyphicon glyphicon-home"></span> Simplex Client Dash Board </h3>
                            <h5><span><%= session.getAttribute("client") %></span></h5>
                        </div>
                        <div class="panel-body" style="margin: 50px;">
                            <div class="row">
                                <div class="col-md-4" >
                                    <a href="order.jsp" class="btn btn-block btn-default" style="height:150px; padding:20px;">
                                        <span class="glyphicon glyphicon-list-alt text-primary" style="font-size: 90px;"></span><br>
                                        <h4 class="text-primary">ORDER PLACEMENT</h4>
                                    </a>
                                </div>
                                <div class="col-md-4 " >
                                    <a href="supplier.jsp" class="btn btn-block btn-default " style="height:150px; padding:20px;">
                                        <span class="glyphicon glyphicon-user text-primary" style="font-size: 90px;"></span><br>
                                        <h4 class="text-primary">SUPPLIERS</h4>
                                    </a>
                                </div>
                                <div class="col-md-4" >
                                    <a href="" class="btn btn-block btn-default" style="height:150px; padding:20px;">
                                        <span class="glyphicon glyphicon-send text-primary" style="font-size: 90px;"></span><br>
                                        <h4 class="text-primary">REPORTS</h4>
                                    </a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 50px;">
                                <div class="col-md-4" >
                                    <a href="" class="btn btn-block btn-default" style="height:150px; padding:20px;">
                                        <span class="glyphicon glyphicon-cog text-primary" style="font-size: 90px;"></span><br>
                                        <h4 class="text-primary">SETTING</h4>
                                    </a>
                                </div>
                                <div class="col-md-4" >
                                    <a href="" class="btn btn-block btn-default" style="height:150px; padding:20px;">
                                        <span class="glyphicon glyphicon-bell text-primary" style="font-size: 90px;"></span><br>
                                        <h4 class="text-primary">NOTIFICATIONS</h4>
                                    </a>
                                </div>
                                <div class="col-md-4" >
                                    <a href="logout.jsp" onclick="return checkDelete()" class="btn btn-block btn-default" style="height:150px; padding:20px;">
                                        <span class="glyphicon glyphicon-log-out text-primary" style="font-size: 90px;"></span><br>
                                        <h4 class="text-primary">LOGOUT</h4>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script>
              function checkDelete(){
                   var r = confirm("Do You Want To Logout ?");
                   if (r == true) {				
                    } 
                    else {
                        return false;
                     }
               }
        </script>
    </body>
</html>
