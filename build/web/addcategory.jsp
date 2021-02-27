<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="adminheader.jsp" %>
        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center">Add Category</h1>
            <form action="addcategoryresponse.jsp" method="post" enctype="multipart/form-data" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Category Name :</label>
                    <div class="col-sm-5">
                        <input type="text" name ="catname" class="form-control" required placeholder="Enter Category Name"/>
                    </div>                   
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Description :</label>
                    <div class="col-sm-5">
                        <textarea col="5" rows="5" class="form-control" name ="des"  required placeholder="Add Description"></textarea>
                    </div>                   
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Select Photo :</label>
                    <div class="col-sm-5">
                        <input type="file" class="form-control" name="photo" />
                    </div>                   
                </div>
                
                 <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Add"/>
                                            </div>
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
            </div></div>   
            <%@include file="footer.jsp" %>
    </body>
</html>
