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
        <h1>Catalog</h1>

        <table id="customerListTable" border="3">
            <tr >
                <th bgcolor=>ID</th>
                <th bgcolor=>Name</th>
                <th bgcolor=>description</th>
                <th bgcolor=>price</th>
            </tr>
            <c:forEach var="product" begin="0" items="${productsList}">
                <tr>
                    <td>${product.getID()}&nbsp;&nbsp;</td> 
                    <td>${product.getName()}&nbsp;&nbsp;</td> 
                    <td>${product.getDesc()}&nbsp;&nbsp;</td>
                    <td>${product.getPrice()}&nbsp;&nbsp;</td>
                    <td><form action="AddToCart" method="post">
                            <input type="hidden"
                                   name="product"
                                   value="${product.getID()}">
                            <input type="submit"
                                   name="submit"
                                   value="add to cart">
                        </form></td>

                </tr> 

            </c:forEach>

        </table>
    </body>
</html>
