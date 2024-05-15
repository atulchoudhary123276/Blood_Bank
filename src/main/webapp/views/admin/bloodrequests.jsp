<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main">
    <aside class="sidebar">
        <ul>
                  <li><a href="/dashboard" >Dashboard</a></li>
                       <li><a href="/dashboard/createagent">Create Agent</a></li>
                       <li><a href="/dashboard/alluserslist">AllUsers List</a></li>
                       <li><a href="/dashboard/bloodrequests" class="active">Requests</a></li>
                       <li><a href="/dashboard/bloodstock" >Stock</a></li>
                        <li><a c href="/dashboard/bloodreport">Blood Report</a></li>
                       <li><a href="/dashboard/coinvalue" >Coin Value</a></li>


        </ul>
    </aside>

       <div class="container">
            <h2 class="text-center mb-4">User Requests List</h2>
            <c:if test="${statusResult !=null}">
                             <p> ${statusResult} </p>
                              </c:if>
                                          <form class="action-buttons" action="/dashboard/bloodrequests" method="GET">
                                          <!-- Filtering options -->
                                              <select id="filterOption" name="filterOption">
                                                  <option value="select"  selected >Select Options</option>
                                                  <option value="byStatus">By Status</option>
                                                  <option value="byAgent">By Agent</option>
                                                  <option value="byUsername">By Username</option>
                                                  <option value="createdBetween">Created Between</option>
                                              </select>
                                              <input type="text" id="usernameInput" name="input" placeholder="Enter.. " style="display: none;">
                                              <input type="date" id="startDate" name="startDate" placeholder="Start Date" style="display: none;">
                                              <input type="date" id="endDate" name="endDate" placeholder="End Date" style="display: none;" >

                                              <!-- Status select -->
                                                                  <select id="statusSelect" name="status" style="display: none;">
                                                                      <option value="select">Select Status</option>
                                                                      <option value="accepted">Accepted</option>
                                                                      <option value="rejected">Rejected</option>
                                                                      <option value="pending">Pending</option>
                                                                  </select>
                                              <button type="submit">Filter</button>
                                          </form>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Request Id</th>
                        <th>CreatedBy</th>
                        <th>Agent</th>
                        <th>Blood Group</th>
                        <th>Quantity</th>
                        <th>Type</th>
                        <th>Created At</th>
                        <th>DOB</th>
                        <th>Age</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${getBloodRequests}" var="bloodStock" varStatus="loop">
                        <tr>
                           <td>${bloodStock.id}</td>
                            <td>${bloodStock.createdBy}</td>
                            <td>${bloodStock.agent}</td>
                            <td>${bloodStock.bloodGroup}</td>
                            <td>${bloodStock.quantity}</td>
                            <td>${bloodStock.type.toUpperCase()}</td>
                            <td>${bloodStock.createdAt}</td>
                            <td>${bloodStock.dob}</td>
                            <td>${bloodStock.age}</td>
                            <td>${bloodStock.status}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${bloodStock.status eq 'pending'}">
                                        <div class="btn-group">
                                            <form action="/dashboard/approvedRequest" method="POST">
                                                <input type="hidden" name="status" value="accepted">
                                                <input type="hidden" name="reqid" value="${bloodStock.id}">
                                                <button type="submit" class="btn btn-success">Approve</button>
                                            </form>
                                            <form action="/dashboard/rejectRequest" method="POST">
                                                <input type="hidden" name="status" value="rejected">
                                                <input type="hidden" name="userName" value="${bloodStock.createdBy}">
                                                <input type="hidden" name="reqid" value="${bloodStock.id}">
                                                <input type="hidden" name="type" value="${bloodStock.type.toUpperCase()}">
                                                <button type="submit" class="btn btn-danger">Reject</button>
                                            </form>
                                        </div>
                                    </c:when>
                                    <c:when test="${bloodStock.status eq 'rejected'}">
                                        <span class="btn btn-dark">Rejected</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="btn btn-primary">Accepted</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
</div>
<script>
        document.getElementById("filterOption").addEventListener("change", function() {
            var selectedOption = this.value;
            var usernameInput = document.getElementById("usernameInput");
            var startDateInput = document.getElementById("startDate");
            var endDateInput = document.getElementById("endDate");
            var statusInput = document.getElementById("statusSelect");

            if (selectedOption === "byUsername" ) {
                usernameInput.style.display = "inline-block";
                startDateInput.style.display = "none";
                endDateInput.style.display = "none";
                statusInput.style.display = "none";
            } else if (selectedOption === "createdBetween") {
                startDateInput.style.display = "inline-block";
                endDateInput.style.display = "inline-block";
                usernameInput.style.display = "none";
                 statusInput.style.display = "none";

            }
            else if (selectedOption === "byStatus") {
                            statusInput.style.display = "inline-block";
                             startDateInput.style.display = "none";
                            endDateInput.style.display = "none";
                            usernameInput.style.display = "none";

                        }
             else {
                startDateInput.style.display = "none";
                endDateInput.style.display = "none";
                usernameInput.style.display = "none";
                statusInput.style.display = "none";
            }
        });
    </script>
<jsp:include page="footer.jsp" />
