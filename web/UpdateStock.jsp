<%-- 
    Document   : UpdateStock
    Created on : 03-Feb-2014, 17:25:00
    Author     : Dara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update stock</title>
    </head>
    <body>
        <h1>Update the stock levels of a product:</h1>
        <form name="updateStockForm" id="updateStockForm" action="UpdateStock" onsubmit ="return validateForm();" method="post">
            <table>
                <tr><td>Product ID:</td><td><input type="text" id = "id" name="id" /></td></tr>
                <tr><td>New stock level:</td><td><input type="number" id = "stockLevel" name="stockLevel" min="0" max="1000" /></td></tr>
            </table>
            <input type="submit" id="UpdateStock" value="Update stock" />
        </form>
    </body>
    <script>
        function validateForm()
        {
            var id=document.forms["addProductForm"]["id"].value;
            var stocklevel=document.forms["addProductForm"]["stockLevel"].value;
            
            if (id == "" || stocklevel == ""){
                alert("All fields must be filled in!");
                return false;
            }
        }
    </script>
</html>
