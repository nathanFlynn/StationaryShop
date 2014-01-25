<%-- 
    Document   : AddProduct
    Created on : 25-Jan-2014, 14:26:06
    Author     : Dara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <h1>Add a new product</h1>
        <form name="addProductForm" id="addProductForm" action="AddProduct" onsubmit ="return validateForm();" method="post">
            <table>
                <tr><td>name</td><td><input type="text" id = "name" name="name" /></td></tr>
                <tr><td>description</td><td><input type="text" id = "description" name="description" /></td></tr>
                <tr><td>price</td><td><input type="text" id = "price" name="price" /></td></tr>
            </table>
            <input type="submit" id="CreateProduct" value="CreateProduct" />
        </form>
        <br><a href="ListCustomer"><strong>Go to List of customers</strong></a>
    </body>
    <script>
        function validateForm()
        {
            var name=document.forms["addProductForm"]["name"].value;
            var description=document.forms["addProductForm"]["description"].value;
            var price = document.forms["addProductForm"]["price"].value;
            
            if (name == "" || description == "" || price == "")
            {
                alert("All fields must be filled in!");
                return false;
            }
        }
    </script>
</html>
