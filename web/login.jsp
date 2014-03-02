<div id="loginDiv"><br>
        <form name="login" action="Login" method="post">
            Email: <input type="text" name="email">   
            Password: <input type="password" name="password"><br>
            <input type="radio" name="type" value="Customer">Customer
            <input type="radio" name="type" value="Employee">Employee<br>
            <input type="submit" value="Submit">
        </form><br><br>

<strong>${requestScope.login}</strong><br>
Logged in as: ${email}<br>

        <a href="index.jsp">
            <button>Return</button>
        </a>
</div>
        
