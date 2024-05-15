 <jsp:include page="header.jsp" />
 <div class="main">
            <aside class="sidebar">
                <ul>
              <li><a href="/dashboard" class="active">Dashboard</a></li>
              <li><a href="/signup">Create EndUser</a></li>
              <li><a href="/dashboard/alluserslist" >EndUsers List</a></li>
              <li><a href="/dashboard/bloodrequests">Requests</a></li>
              <li><a href="/dashboard/bloodreport">Blood Report</a></li>
              <li><a href="/dashboard/coinvalue">Coin Value</a></li>


                </ul>
            </aside>
            <div class="main-content">
                <div class="dashboard-container">
                    <h2>Agent Dashboard</h2>
                     <div class="info-section">
                          <h3><ul>Profile<ul></h3>
                          <p><strong>Name:</strong> ${name}</p>
                          <p><strong>Username:</strong> ${userId}</p>
                          <p><strong>Created At:</strong> ${createdOn}</p>
                          <p><strong>Created By:</strong> ${createdBy}</p>
                          <p><strong>DOB:</strong> ${dob}</p>
                          <p><strong>Blood Group:</strong> ${bloodGroup}</p>
                    </div>
                   <h2 style="color:green"> ${success} </h2>

                </div>
            </div>
        </div>
<jsp:include page="footer.jsp" />