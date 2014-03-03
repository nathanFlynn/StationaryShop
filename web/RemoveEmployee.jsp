<%-- 
    Document   : RemoveEmployee
    Created on : Mar 3, 2014, 10:54:25 AM
    Author     : User
--%>
<div id="removeEmployee">
    <h1>Remove an Employee</h1><br>
        <strong>Enter the ID of the Employee you want to remove</strong><br>
        <form name="removeEmployeeForm" id="removeEmployeeForm" action="RemoveEmployee" onsubmit ="return validateForm();" method="post">
            ID: <input type="text" id = "id" name="id" />
            <input type="submit" id="removeEmployee" value="Remove Employee" />
        </form>
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
