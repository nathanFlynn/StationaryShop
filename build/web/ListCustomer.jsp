<%-- 
    Document   : ListCustomer.jsp
    Created on : 04-Nov-2013, 22:36:55
    Author     : n8
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
        <h1>List of Customers currently in Database</h1>

        <table id="customerListTable" border="3">
            <tr >
                <th bgcolor=>ID</th>
                <th bgcolor=>Name</th>
                <th bgcolor=>Address</th>
                <th bgcolor=>Email</th>
            </tr>
            <c:forEach var="customer" begin="0" items="${requestScope.customerList}">
                <tr>
                    <td>${customer.getID()}&nbsp;&nbsp;</td> 
                    <td>${customer.getName()}&nbsp;&nbsp;</td> 
                    <td>${customer.getAddress()}&nbsp;&nbsp;</td>
                    <td>${customer.getEmail()}&nbsp;&nbsp;</td>
                </tr> 

            </c:forEach>

        </table>
        <a href="AddCustomer.jsp"><strong>Create a Customer Record</strong></a>
    </body>
</html>
