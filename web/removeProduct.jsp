<%-- 
    Document   : removeProduct
    Created on : 27-Jan-2014, 16:02:23
    Author     : NFLYN_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stationary Shop</title>
    </head>
    <body>
        <h1>Remove a product</h1><br>
        <strong>Enter the ID of the product you want to remove</strong><br>
        <form name="removeProductForm" id="removeProductForm" action="RemoveProduct" onsubmit ="return validateForm();" method="post">
            ID: <input type="text" id = "id" name="id" />
            <input type="submit" id="removeProduct" value="Remove Product" />
        </form>
        <br><a href="Catalog"><strong>Go to List of Products</strong></a>
    </body>
    <script>
        function validateForm()
        {
            var id=document.forms["addProductForm"]["id"].value;
            
            if (id == ""){
                alert("You must enter an ID!");
                return false;
            }
        }
    </script>
</html>
