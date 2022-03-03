 <%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {

        session.setAttribute("message", "you are not logged in !! Login first ");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not Admin ! Don't Access this page ");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"  %>
        <div class="container admin">
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            <div class="row mt-3">

                <!--first--> 
                <div class="col-md-4" >
                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container"> 

                                <img style="max-height:125px " class="img-fluid" src="img/group.png" alt="user_icon"/>
                            </div>
                            <h1>54</h1>
                            <h1 class="text-muted ">Users</h1>   
                        </div>

                    </div>
                </div>

                <!--second-->


                <div class="col-md-4" >
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container"> 

                                <img style="max-height:125px " class="img-fluid" src="img/list.png" alt="Categories_icon"/>
                            </div>
                            <h1>54</h1>
                            <h1 class="text-muted " >Categories</h1>
                        </div>

                    </div>
                </div>

                <!--third-->


                <div class="col-md-4"  >
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container"> 

                                <img style="max-height:125px " class="img-fluid" src="img/box.png" alt="Products_icon"/>
                            </div>

                            <h1>54</h1>
                            <h1 class="text-muted">Products</h1>
                        </div>

                    </div>
                </div>


            </div>


            <div class="container">
                <div class="row mt-3">

                    <div class="col-md-6">
                        <div class="card" data-toggle="modal" data-target="#add-category-modal">
                            <div class="card-body text-center">

                                <div class="container"> 

                                    <img style="max-height:125px " class="img-fluid" src="img/categories.png" alt="user_icon"/>
                                </div>
                                <p>Click here to add Category</p>

                                <h1 class="text-muted">Add Category</h1>   
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card"data-toggle="modal" data-target="#add-product-modal">
                            <div class="card-body text-center">

                                <div class="container"> 

                                    <img style="max-height:125px " class="img-fluid" src="img/delivery-box.png" alt="user_icon"/>
                                </div>
                                <p>Click here to add new Product</p>

                                <h1 class="text-muted">Add Product</h1>   
                            </div>

                        </div>
                    </div>

                </div>

            </div>


        </div>


        <!--start add catagory data modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
                            </div>

                            <div class="form-group">
                                <textarea style="height: 250px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>

                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success ">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <!--end add catagory data modal-->


        <!--Start Add product data modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Product title" required/>
                            </div>

                            <div class="form-group">
                                <textarea style="height: 100px" class="form-control" placeholder="Enter Product description" name="pDesc" required></textarea>

                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="pPrice" placeholder="Enter price of Product" required/>
                            </div>
                                    
                            <div class="form-group">
                                <input type="text" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>
                            </div>
                                    
                            <div class="form-group">
                                <input type="text" class="form-control" name="pQuantity" placeholder="Enter product Quantity" required/>
                            </div>
                           
                            
                            <!--Product Category-->
                                    
                            <%
                            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                            List<Category> list=cdao.getCategories();
                            
                            %>
                            
                            
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                <%
                                for(Category c:list){
                                %>
                                
                                <option value="<%= c.getCategoryId() %>"> <%= c.getCategoryTitle() %> </option>
                                
                                <%} %>
                                </select>
                                
                            </div>
                            
                            <div class="form-group">
                                <label for="pPic">Select picture of product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required>
                                
                            </div>



                            <div class="container text-center">
                                <button class="btn btn-outline-success ">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <!--End Add product data modal-->
    </body>
</html>
