<div id="RemoveProduct">
    <h1>Remove a Job</h1><br>
        <strong>Enter the ID of the Job you want to remove</strong><br>
        <form name="removeJobForm" id="removeJobForm" action="RemoveJob" onsubmit ="return validateForm();" method="post">
            ID: <input type="text" id = "id" name="id" />
            <input type="submit" id="removeProduct" value="Remove Job" />
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
</div>
