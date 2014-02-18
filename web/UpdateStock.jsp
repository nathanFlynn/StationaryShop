<div id="updateStock">
        <h1>Update the stock levels of a product:</h1>
        <form name="updateStockForm" id="updateStockForm" action="UpdateStock" onsubmit ="return validateForm();" method="post">
            <table>
                <tr><td>Product ID:</td><td><input type="text" id = "id" name="id" /></td></tr>
                <tr><td>New stock level:</td><td><input type="number" id = "stockLevel" name="stockLevel" min="0" max="1000" /></td></tr>
            </table>
            <input type="submit" id="UpdateStock" value="Update stock" />
        </form>
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
</div>