<div id="catalog">

    <h1>Catalog</h1>

    <table id="productListTable" border="3" align="center">
        <tr >
            <th bgcolor=> ID </th>
            <th bgcolor=> Name </th>
            <th bgcolor=> Description </th>
            <th bgcolor=> Price </th>
        </tr>
        <c:forEach var="product" begin="0" items="${productsList}">
            <tr>
                <td> ${product.getID()}&nbsp;&nbsp; </td> 
                <td> ${product.getName()}&nbsp;&nbsp; </td> 
                <td> ${product.getDesc()}&nbsp;&nbsp; </td>
                <td> ${product.getPrice()}&nbsp;&nbsp; </td>

                <td><form action="Cart" method="post">
                        <input type="hidden"
                               name="productID"
                               value="${product.getID()}">
                        <input type="submit"
                               name="submit"
                               value="add to cart">
                        <input type="hidden"
                               name="commandType"
                               value="new">
                    </form></td>

            </tr> 
        </c:forEach>
    </table><br>
    <a href="index.jsp">
        <button>Return</button>
    </a> 
    <a href="cart.jsp">
        <button>View Cart</button>
    </a>
</div>
