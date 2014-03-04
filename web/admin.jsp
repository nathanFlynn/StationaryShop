<div id="admin">
    <c:if test="${isEmployee == true}">
        <h1>Administrator Page</h1><br><br>
        <a href="AddProduct.jsp">Add New Product</a><br>
        <a href="removeProduct.jsp">Remove Product</a><br>
        <a href="Catalog">List Products</a><br>
        <a href="UpdateStock.jsp">Update Stock</a><br>
        <a href="ListCustomer">List Customers</a><br>
        <a href="AddEmployee.jsp">Add Employee</a><br>
        <a href="RemoveEmployee.jsp">Remove Employee</a><br>
        <a href="AddJob.jsp">Add Job</a><br>
        <a href="RemoveJob.jsp">Remove Job</a><br>
    </c:if>
    <c:if test="${isEmployee == false}">
          Login as employee
    </c:if>
</div>
