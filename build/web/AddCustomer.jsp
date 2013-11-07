<%-- 
    Document   : AddCustomer
    Created on : 31-Oct-2013, 12:03:13
    Author     : n8
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Customer</title>
    </head>
    <body>
        <h1>Create a Customer record</h1>
        <form id="createPersonForm" action="AddCustomer" method="post">
            <table>
                <tr><td>name</td><td><input type="text" id = "name" name="name" /></td></tr>
                <tr><td>address</td><td><input type="text" id = "address" name="address" /></td></tr>
                <tr><td>email</td><td><input type="text" id = "email" name="email" /></td></tr>
                <tr><td>password</td><td><input type="password" id = "password" name="password" /></td></tr>
            </table>
            <input type="submit" id="CreateCustomer" value="CreateCustomer" />
        </form>
        <br><a href="ListCustomer"><strong>Go to List of customers</strong></a>
    </body>
</html>
