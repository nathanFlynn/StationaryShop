<div id="listCustomers">
<h1>List of Customers currently in Database</h1>

        <table id="customerListTable" border="3" align="center">
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
        <a href="register.jsp"><strong>Create a Customer Record</strong></a>
</div>
