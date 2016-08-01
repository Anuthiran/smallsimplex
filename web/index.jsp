<%
    String msg = request.getParameter("msg");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SimplexExpress</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="margin:100px;">
            <div clss="row">
                <div class="col-md-6 col-md-offset-3">
                    <% 
                        if(msg!=null){
                            out.println("<div class='alert alert-danger'>"+msg+"</div>");
                        }
                    %>
                    <div class="panel panel-primary ">
                        <div class="panel-heading text-center">
                            <h4>Small Simplex Connect Login </h4>
                        </div>
                        <div class="panel-body" style="margin-top: 20px;">
                            
                            <form class="form-horizontal" action="login.jsp" method="post" autocomplete="off">
                                
                                <div class="form-group">
                                    <label  class="col-md-12">Username</label>
                                    <div class="col-md-12">
                                        <input name="uname" type="text" class="form-control"  placeholder="Please input your Email address">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label  class="col-md-12">Password</label>
                                    <div class="col-md-12">
                                        <input name="pwd" type="password" class="form-control"  placeholder="Please input your Password">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> Remember me
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <button type="button" class="btn btn-link">Forgot Password</button>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <button class="btn btn-primary btn-block">LOGIN</button>
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
