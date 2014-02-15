<%-- 
    Document   : catalog
    Created on : 19-Jan-2014, 16:30:50
    Author     : NFLYN_000
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stationary Shop</title>
    </head>
    <body>
        <h1>Cart</h1>

        <strong>Cart contains ${shoppingCart.getNumberOfItems()} item(s)</strong><br>
        <table id="productListTable" border="3">
            <tr >
                <th bgcolor=> ID </th>
                <th bgcolor=> Name </th>
                <th bgcolor=> Description </th>
                <th bgcolor=> Price </th>
                <th bgcolor=> Quantity </th>
            </tr>
            <c:forEach var="item" begin="0" items="${shoppingCart.getItems()}">
                <c:set var="product" value="${item.getProduct()}"/>
                <tr>
                    <td> ${product.getID()}&nbsp;&nbsp; </td> 
                    <td> ${product.getName()}&nbsp;&nbsp; </td> 
                    <td> ${product.getDesc()}&nbsp;&nbsp; </td>
                    <td> ${product.getPrice()}&nbsp;&nbsp; </td>
                    <td> ${item.getQuantity()}&nbsp;&nbsp; </td>

                    <%-- increment item in cart --%>
                    <td><form action="Cart" method="post">
                            <input type="hidden"
                                   name="productID"
                                   value="${product.getID()}">
                            <input type="submit"
                                   name="submit"
                                   value=" +1 ">
                            <input type="hidden"
                                   name="commandType"
                                   value="increment">
                        </form></td>

                    <%-- remove item from cart --%>
                    <td><form action="Cart" method="post">
                            <input type="hidden"
                                   name="productID"
                                   value="${product.getID()}">
                            <input type="submit"
                                   name="submit"
                                   value=" X ">
                            <input type="hidden"
                                   name="commandType"
                                   value="remove">
                        </form></td>
                </tr> 
            </c:forEach>
        </table><br>
        <a href="index.jsp">
            <button>Return</button>
        </a>

        <%-- clear cart --%>
        <form action="Cart" method="post">
            <input type="submit"
                   name="submit"
                   value="Clear Cart">
            <input type="hidden"
                   name="productID"
                   value="1">
            <input type="hidden"
                   name="commandType"
                   value="clear">
        </form>
    </body>
</html>
