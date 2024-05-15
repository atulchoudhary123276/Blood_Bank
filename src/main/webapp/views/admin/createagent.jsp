<jsp:include page="header.jsp" />

<div class="main">
    <aside class="sidebar">
        <ul>
                 <li><a href="/dashboard" >Dashboard</a></li>
                      <li><a href="/dashboard/createagent" class="active">Create Agent</a></li>
                      <li><a href="/dashboard/alluserslist">AllUsers List</a></li>
                      <li><a href="/dashboard/bloodrequests">Requests</a></li>
                      <li><a href="/dashboard/bloodstock" >Stock</a></li>
            <li><a  href="/dashboard/bloodreport">Blood Report</a></li>
            <li><a href="/dashboard/coinvalue" >Coin Value</a></li>


        </ul>
    </aside>
    <main class="content">
        <h2 style="text-align:center; margin-bottom:10px">Agent Account Creation </h2>
        <h3 style="color:red; text-align:center"> ${errorMsg} </h3>
        <div class="agent-form">
            <form action="/register" method="post" id="signupForm">
                        <label for="userName">Username:</label>
                        <input type="text" id="userName" name="userName" required>

                       <label for="name">Name:</label>
                       <input type="text" id="name" name="name" required>

                        <label for="dob">DOB:</label>
                       <input type="date" id="dob" name="dob" max="2024-03-11" required>

                       <label for="commission">Commission:</label>
                       <input type="text" id="commission" name="commission" required>

                        <label for="bloodGroup">Blood Group:</label>
                        <select id="bloodGroup" name="bloodGroup" required>
                            <option value="" disabled selected>Select Blood Group</option>
                            <option value="A+">A+</option>
                            <option value="A-">A-</option>
                            <option value="B+">B+</option>
                            <option value="B-">B-</option>
                            <option value="AB+">AB+</option>
                            <option value="AB-">AB-</option>
                            <option value="O+">O+</option>
                            <option value="O-">O-</option>
                        </select>
                        <input type="hidden" id="password" name="password" value="2001-01-01" required>


                        <label for="address">Address:</label>
                       <input type="text" id="address" name="address" required>

                        <input type="submit" value="Sign Up">
                    </form>
                    <div th:if="${successMessage}" class="alert alert-success">
                        <strong>${successMessage}</strong>
                    </div>

        </div>
    </main>
</div>
<jsp:include page="footer.jsp" />