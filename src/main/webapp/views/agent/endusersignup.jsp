<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div class="main">
    <aside class="sidebar">
        <ul>
            <li><a href="/dashboard">Dashboard</a></li>
            <li><a href="/signup" class="active">Create EndUser</a></li>
            <li><a href="/dashboard/alluserslist" >EndUsers List</a></li>
            <li><a href="/dashboard/bloodrequests">Requests</a></li>
            <li><a href="/dashboard/bloodreport">Blood Report</a></li>
            <li><a href="/dashboard/coinvalue">Coin Value</a></li>


        </ul>
    </aside>
    <div class="main-body">
      <div class="signup-container">

          <span class="title"><h2>User Registration<c:if test="${role eq 'AGENT'}">
                 </c:if></h2>
              </span>
              <div th:if="${successMessage}" class="alert alert-success">
                            <strong>${successMessage}</strong>
              </div>
          <form action="register" method="post" id="signupForm">
              <label for="userName">Username:</label>
              <input type="text" id="userName" name="userName" required>

              <label for="name">Name:</label>
              <input type="text" id="name" name="name" required>

              <label for="dob">DOB:</label>
              <input type="date" id="dob" name="dob" max="2024-03-11" required>

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
              <c:choose>
                  <c:when test="${role eq 'AGENT'}">
                      <input type="hidden" id="password" name="password" value="abc">
                  </c:when>
                  <c:otherwise>
                      <label for="password">Password:</label>
                      <input type="password" id="password" name="password" required>
                  </c:otherwise>
              </c:choose>
              <label for="address">Address:</label>
              <input type="text" id="address" name="address" required>
              <input type="submit" value="Sign Up">
          </form>


      </div>
      </div>

      </div>
      <jsp:include page="footer.jsp" />