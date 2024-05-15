<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div class="main">
    <aside class="sidebar">
        <ul>
            <li><a href="/dashboard">Dashboard</a></li>
            <li><a href="/signup">Create EndUser</a></li>
            <li><a href="/dashboard/alluserslist" class="active">EndUsers List</a></li>
            <li><a href="/dashboard/bloodrequests">Requests</a></li>
            <li><a  href="/dashboard/bloodreport">Blood Report</a></li>
            <li><a href="/dashboard/coinvalue">Coin Value</a></li>


        </ul>
    </aside>

    <main class="content">
        <h2>Blood Bank Dashboard (Only EndUser List Created by Agent)</h2>
        <h3 style="color:green; text-align:center"> ${operation} </h3>
        <div class="action-buttons">
             <!-- Sorting options -->
                                  <form  action="/dashboard/users" method="post">
                                      <select name="sortOption">
                                      <option value="select"  selected >Select Options</option>
                                          <option value="byname">Sort by Name</option>
                                          <option value="bybloodgroup">Sort by Blood Group </option>
                                      </select>
                                      <button type="submit">Sort</button>


                                  <!-- Filtering options -->
                                      <select id="filterOption" name="filterOption">
                                          <option value="select"  selected >Select Options</option>
                                          <option value="notLoggedIn">Not Logged In Users</option>
                                          <option value="byUsername">By Username</option>
                                          <option value="createdBetween">Created Between</option>
                                      </select>
                                      <input type="text" id="usernameInput" name="username" placeholder="Enter Username" style="display: none;">
                                      <input type="date" id="startDate" name="startDate" placeholder="Start Date" style="display: none;">
                                      <input type="date" id="endDate" name="endDate" placeholder="End Date" style="display: none;">
                                      <button type="submit">Filter</button>
                                  </form>

        </div>
        <div class="enduser-list">
            <table>
                <thead>
                    <tr>
                        <th>Serial No.</th>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Creation Time</th>
                        <th>CreatedBy</th>
                        <th>DOB</th>
                        <th>Blood Group</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${allUsers}"  varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${user.name}</td>
                                <td>${user.userName}</td>
                                <td>${user.createdOn}</td>
                                <td>${user.createdBy}</td>
                                <td>${user.dob}</td>
                                <td>${user.bloodGroup}</td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <c:if test="${empty allUsers}">
            <p>No users found</p>
        </c:if>
    </main>
</div>
<script>
            document.getElementById("filterOption").addEventListener("change", function() {
                var selectedOption = this.value;
                var usernameInput = document.getElementById("usernameInput");
                var startDateInput = document.getElementById("startDate");
                var endDateInput = document.getElementById("endDate");

                if (selectedOption === "byUsername") {
                    usernameInput.style.display = "inline-block";
                    startDateInput.style.display = "none";
                    endDateInput.style.display = "none";
                } else if (selectedOption === "createdBetween") {
                    startDateInput.style.display = "inline-block";
                    endDateInput.style.display = "inline-block";
                    usernameInput.style.display = "none";
                } else {
                    startDateInput.style.display = "none";
                    endDateInput.style.display = "none";
                    usernameInput.style.display = "none";
                }
            });
        </script>
<jsp:include page="footer.jsp" />