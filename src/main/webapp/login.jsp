<%-- 
    Document   : login
    Created on : Apr 23, 2021, 12:43:31 PM
    Author     : achal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp"  %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row mt-4">
                <div class="col-md-4 offset-md-4 ">

                    <div class="card">
                        <div class="card-header custom-bg text-white text-center">
                            <div class="text-center"><span class="fa fa-user fa-5x"></span></div>
                            <h2>Login here</h2>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp"  %>

                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <a href="register.jsp" >if you not register click here</a>
                                <div class="container text-center mt-3">
                               <button type="submit" class="btn custom-bg text-white">Submit</button>
                                </div>
                            </form>


                        </div>
                        
                    </div>
                </div>

            </div>
    </body>
</html>
