<jsp:include page="header.jsp" />

<div class="main">
    <aside class="sidebar">
        <ul>
            <li><a href="/dashboard" class="active">Dashboard</a></li>
            <li><a href="/dashboard/createagent">Create Agent</a></li>
            <li><a href="/dashboard/alluserslist">AllUsers List</a></li>
            <li><a href="/dashboard/bloodrequests">Requests</a></li>
            <li><a href="/dashboard/bloodstock" >Stock</a></li>
            <li><a  href="/dashboard/bloodreport">Blood Report</a></li>
            <li><a href="/dashboard/coinvalue" >Coin Value</a></li>

        </ul>
    </aside>

    <main class="content">
        <h1>Welcome to Admin Dashboard</h1>
        <h2 style="color:green"> ${success} </h2>
            <div class="admin-profile">
                <h2>Admin Profile</h2>
                <p><strong>Name:</strong> ${name}</p>
                <p><strong>Username:</strong> ${userId}</p>
                <p><strong>Created At:</strong> ${createdOn}</p>
                <p><strong>Created By:</strong> ${createdBy}</p>
                <p><strong>DOB:</strong> ${dob}</p>
                <p><strong>Blood Group:</strong> ${bloodGroup}</p>
            </div>
    </main>
</div>
<jsp:include page="footer.jsp" />