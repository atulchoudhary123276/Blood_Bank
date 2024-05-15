<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Requests Status</title>
    <style>
    table {
                                      width: 100%;
                                      border-collapse: collapse;
                                      margin-bottom: 20px;
                                  }

                                  th, td {
                                      padding: 12px;
                                      text-align: left;
                                      border-bottom: 1px solid #ddd;
                                  }

                                  th {
                                      background-color: #f2f2f2;
                                  }

                                  </style>


<div class="container">
            <h2 class="text-center mb-4">User Requests List <br>userName:${userId}----- <br> Name:${name} <br> </h2>
            <form  action="/dashboard/bloodrequests" method="GET">
                                                                                     <!-- Filtering options -->
                                                                                         <select id="filterOption" name="filterOption">
                                                                                             <option value="select"  selected >Select Options</option>
                                                                                             <option value="byStatus">By Status</option>
                                                                                             <option value="createdBetween">Created Between</option>
                                                                                         </select>
                                                                                         <input type="date" id="startDate" name="startDate" placeholder="Start Date" style="display: none;">
                                                                                         <input type="date" id="endDate" name="endDate" placeholder="End Date" style="display: none;">

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
                        <th>Blood Group</th>
                        <th>Quantity</th>
                        <th>Type</th>
                        <th>Created At</th>
                        <th>Status</th>
                        <th>Remark</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requests}" var="bloodStock" varStatus="loop">
                        <tr>
                           <td>${bloodStock.id}</td>
                            <td>${bloodStock.bloodGroup}</td>
                            <td>${bloodStock.quantity}</td>
                            <td>${bloodStock.type.toUpperCase()}</td>
                            <td>${bloodStock.createdAt}</td>
                            <td>${bloodStock.status}</td>
                            <td>${bloodStock.remark}</td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${empty requests}">
            <strong>No request found</strong>
            </c:if>
        </div>
<script>
        document.getElementById("filterOption").addEventListener("change", function() {
            var selectedOption = this.value;
            var usernameInput = document.getElementById("usernameInput");
            var startDateInput = document.getElementById("startDate");
            var endDateInput = document.getElementById("endDate");
            var statusInput = document.getElementById("statusSelect");

            if (selectedOption === "byUsername" ||selectedOption === "byAgent") {
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
