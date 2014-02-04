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
                <a href="ListCustomer">List Customers</a><br><br>
                <a href="AddCustomer.jsp">Add Customers</a><br>
                <a href="Catalog">Catalog</a>
            </div>

            <div id="indexRightColumn">
                right column
            </div>

            <div id="footer">
                footer
            </div>
        </div>
    </body>
</html>
