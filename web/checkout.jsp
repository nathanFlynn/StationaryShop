<%-- 
    Document   : checkout
    Created on : 16-Feb-2014, 14:54:15
    Author     : NFLYN_000
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Stationary Shop</title>
    </head>
    <body>
        <%-- must be logged in to checkout --%>
        <c:if test="${logged_in == true}">
            Name: ${name} <br>
            Address: ${address} <br>
            Email: ${email} <br><br>
            ${shoppingCart.getNumberOfItems()} items, total €
            ${shoppingCart.getTotal()} <br>
        </c:if>
        
        <c:if test="${logged_in == false}">
            <strong>Please <a href="login.jsp">login</a> to checkout</strong>
        </c:if>
    </body>
</html>
