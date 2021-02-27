
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%            String catname = request.getParameter("cn");
            String des = request.getParameter("des");
            String photo = request.getParameter("photo");
        %>
        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center;">Edit Category</h1>
            <form action="editcategoryresponse.jsp" method="post" enctype="multipart/form-data" class="form-horizontal">

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Category Name :</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" value="<%=catname%>" name="c_name" readonly/>
                    </div>
                </div>                    
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Description :</label>
                    <div class="col-sm-7">
                        <textarea col="5" rows="5" class="form-control" name ="des" ><%=des%></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Category Photo :</label>
                    <div class="col-sm-7">
                        <img src="<%=photo%>" class="img-thumbnail" alt="Category Photo" height="120" width="100"/>
                    </div></div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" style="text-align: right;">Choose New Photo :</label>
                        <div class="col-sm-7">
                            <input type="file"  name="photo" />
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-7">
                            <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Submit"/>
                        </div>


                        </form>
                    <div style="text-align: center">
                        <%String msg1 = request.getParameter("msg");
                            if (msg1 != null) {
                        %>
                        <h1 style="color: red" ><%=msg1%></h1>
                        <%
                            }
                        %>
                    </div>
                    </div>
                    <%@include file="footer.jsp" %>
                    </body>
                    </html>
