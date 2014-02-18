<h1>Add a new product</h1>
<form name="addProductForm" id="addProductForm" action="AddProduct" onsubmit ="return validateForm();" method="post">
    <table>
        <tr><td>name</td><td><input type="text" id = "name" name="name" /></td></tr>
        <tr><td>description</td><td><input type="text" id = "description" name="description" /></td></tr>
        <tr><td>price</td><td><input type="text" id = "price" name="price" /></td></tr>
        <tr><td>stock</td><td><input type="number" id = "stock" name="stock" /></td></tr>
    </table>
    <input type="submit" id="CreateProduct" value="CreateProduct" />
</form>
<br><a href="ListCustomer"><strong>Go to List of customers</strong></a>
<script>
    function validateForm()
    {
        var name = document.forms["addProductForm"]["name"].value;
        var description = document.forms["addProductForm"]["description"].value;
        var price = document.forms["addProductForm"]["price"].value;
        var stock = document.forms["addProductForm"]["stock"].value;

        if (name == "" || description == "" || price == "" || stock == "")
        {
            alert("All fields must be filled in!");
            return false;
        }
    }
</script>
