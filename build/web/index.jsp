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
                <form name="login" action="Login" method="post">
                    Email: <input type="text" name="email">   
                    Password: <input type="password" name="password">
                    <input type="submit" value="Submit">
                </form>
            </div>
            <div id="indexLeftColumn">
                <br>
                <a href="ListCustomer">List Customers</a><br><br>
                <a href="AddCustomer.jsp">Add Customers</a><br>
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
