<%-- 
    Document   : login
    Created on : 20-Jan-2014, 17:46:37
    Author     : NFLYN_000
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stationary Shop</title>
    </head>
    <body>
        <form name="login" action="Login" method="post">
            Email: <input type="text" name="email">   
            Password: <input type="password" name="password">
            <input type="submit" value="Submit">
        </form><br><br>

        <strong>${requestScope.login}</strong><br>
        Email: ${email}<br>
        Password: ${password} <br><br>

        <a href="index.jsp">
            <button>Return</button>
        </a>
    </body>
</html>
