<div id="JobCatalog">

    <h1>Print Catalog</h1>

    <table id="JobListTable" border="1" align="center">
        <tr >
            <th bgcolor=> ID </th>
            <th bgcolor=> priceperpage </th>
            <th bgcolor=> pagesize </th>
        </tr>
        <c:forEach var="PrintJob" begin="0" items="${JobsList}">
            <tr>
                <td> ${PrintJob.getID()}&nbsp;&nbsp; </td> 
                <td> ${PrintJob.getPriceperPage()}&nbsp;&nbsp; </td> 
                <td> ${PrintJob.getPageSize()}&nbsp;&nbsp; </td>

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
