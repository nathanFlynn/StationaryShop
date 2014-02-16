        <h1>Remove a product</h1><br>
        <strong>Enter the ID of the product you want to remove</strong><br>
        <form name="removeProductForm" id="removeProductForm" action="RemoveProduct" onsubmit ="return validateForm();" method="post">
            ID: <input type="text" id = "id" name="id" />
            <input type="submit" id="removeProduct" value="Remove Product" />
        </form>
        <br><a href="Catalog"><strong>Go to List of Products</strong></a>
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
