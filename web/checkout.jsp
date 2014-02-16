
        <%-- must be logged in to checkout --%>
        <c:if test="${logged_in == true}">
            Name: ${name} <br>
            Address: ${address} <br>
            Email: ${email} <br><br>
            ${shoppingCart.getNumberOfItems()} items, total ?
            ${shoppingCart.getTotal()} <br>
        </c:if>
        
        <c:if test="${logged_in == false}">
            <strong>Please <a href="login.jsp">login</a> to checkout</strong>
        </c:if>

