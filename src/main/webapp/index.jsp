<%-- 
    Document   : index
    Created on : Feb 28, 2021, 1:57:51 PM
    Author     : achal
--%>

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/common_css_js.jsp"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-4 mx-2">



                <%                String cat = request.getParameter("category");
                    //                    out.println(cat);
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>				
                <!--category-->


                <div class="col-md-2">

                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            Categories
                        </a>

                        <%
                            for (Category c : clist) {
                        %>    
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

                        <%
                            }


                        %>
                    </div>



                </div>

                <!--/*show product*/-->
                <div class="col-md-10">

                    <div class="row mt-4">
                        <!--column-->
                        <div class="col-md-12">
                            <div class="card-columns">
                                <!--Traversing products-->

                                <%                                for (Product p : list) {


                                %>

                                <div class="card">
                                    <div class="container text-center">

                                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height:200px;max-width: 100%;width: auto;" class="card-img-top m-2" alt="..."/>


                                    </div>
                                    <div class="card-body">

                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%>
                                        </p>
                                    </div>

                                    <div class="card-footer">
                                        <button type="submit" class="btn custom-bg text-white">Add cart</button>
                                        <button type="submit" class="btn btn-outline-primary">&#8377 <%= p.getpPrice()%></button>

                                    </div>

                                </div>
                                <%
                                    }
                                    if (list.size() == 0) {
                                        out.println("<h3>no item in this category</h3>");
                                    }

                                %>
                            </div>


                        </div>

                    </div>
                </div>

            </div>
        </div>


    </body>
</html>
