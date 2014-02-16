<%-- 
    Document   : index
    Created on : 31-Oct-2013, 11:53:55
    Author     : n8
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/shop.css">
        <title>Stationary Shop</title>
    </head>
    <body>
        <div id="main">
            <div id="header">
                <h1>The Stationary Shop</h1><br><br>
            </div>
            <div id="login">
                <a href="login.jsp">
                    <button>Login</button>
                </a>  
                <a href="Logout">
                    <button>Logout</button>
                </a>
            </div>
            <div id="indexLeftColumn">
                <br>
                <a href="register.jsp">Register</a><br>
                <a href="Catalog">Catalog</a><br>
                <a href="admin.jsp">Admin Page</a><br><br>
                <a href="cart.jsp">View Cart</a>
            </div>

            <div id="indexRightColumn">
            </div>

            <div id="footer">
                footer
            </div>
        </div>
    </body>
</html>
