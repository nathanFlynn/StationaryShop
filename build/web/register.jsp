        <h1>Register</h1>
        <form name="registerForm" id="createPersonForm" action="Register" onsubmit ="return validateForm();" method="post">
            <table>
                <tr><td>name</td><td><input type="text" id = "name" name="name" /></td></tr>
                <tr><td>address</td><td><input type="text" id = "address" name="address" /></td></tr>
                <tr><td>email</td><td><input type="text" id = "email" name="email" /></td></tr>
                <tr><td>password</td><td><input type="password" id = "password" name="password" /></td></tr>
            </table>
            <input type="submit" id="CreateCustomer" value="Register" />
        </form>
    <script>
        function validateForm()
        {
            var name=document.forms["registerForm"]["name"].value;
            var address=document.forms["registerForm"]["address"].value;
            var email=document.forms["registerForm"]["email"].value;
            var password=document.forms["registerForm"]["password"].value;
            var atpos=email.indexOf("@");
            var dotpos=email.lastIndexOf(".");
            
            if (name == "" || address == "" || email == "" || password == "" )
            {
                alert("All fields must be filled in!");
                return false;
            }
            else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
            {
              alert("Not a valid e-mail address");
              return false;
            }
        }
    </script>