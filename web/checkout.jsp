
<%-- must be logged in to checkout --%>
<c:if test="${logged_in == true}">
    Name: ${name} <br>
    Address: ${address} <br>
    Email: ${email} <br><br>
    ${shoppingCart.getNumberOfItems()} items, total: £
    ${shoppingCart.getTotalString()} <br>
</c:if>

<c:if test="${logged_in == false}">
    <strong>Please <a href="login.jsp">login</a> to checkout</strong>
</c:if>

<br><button name="checkout" onclick="checkOut()">Checkout</button>

<script>
    function checkOut() {
        var num = Math.floor((Math.random()*1000)+100);
        
        alert("Your voucher number is: " +num +".\nPlease come in store to collect your order.");
    }
</script>

