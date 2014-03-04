
<div id="AddJob">
    <h1>Add a Job</h1>
        <form name="addJobForm" id="addJobForm" action="AddJob" onsubmit ="return validateForm();" method="post">
            <table id="addJobTable" align="center">
                <tr><td>priceperpage</td><td><input type="text" id = "priceperpage" name="priceperpage" /></td></tr>
                <tr><td>pagesize</td><td><input type="text" id = "pagesize" name="pagesize" /></td></tr>
            </table>
            <input type="submit" id="CreateJob" value="CreateJob" />
        </form>
</div>