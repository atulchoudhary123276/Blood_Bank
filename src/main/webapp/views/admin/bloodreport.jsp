<jsp:include page="header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div class="main">
    <aside class="sidebar">
        <ul>
            <li><a href="/dashboard" >Dashboard</a></li>
                       <li><a href="/dashboard/createagent">Create Agent</a></li>
                       <li><a href="/dashboard/alluserslist">AllUsers List</a></li>
                       <li><a href="/dashboard/bloodrequests">Requests</a></li>
                       <li><a href="/dashboard/bloodstock" >Stock</a></li>
            <li><a class="active" href="/dashboard/bloodreport">Blood Report</a></li>
            <li><a href="/dashboard/coinvalue" >Coin Value</a></li>


        </ul>
    </aside>

   <div class="container">
               <h2 class="text-center mb-4"> Report For Blood Requests(Reject/Approved)</h2>
               <table class="table table-bordered table-hover">
                   <thead>
                       <tr>

                           <th>Blood Group</th>
                           <th>Approved Requests</th>
                           <th>Rejected Requests</th>
                           <th>Total Request Count</th>
                           <th>Coin Value</th>

                       </tr>
                   </thead>
                   <tbody>
                       <c:forEach items="${bloodReport}" var="bloodStock" varStatus="loop">
                           <tr>
                               <td>${bloodStock.bloodGroup}</td>
                               <td>${bloodStock.approvedRequests}</td>
                               <td>${bloodStock.rejectedRequests}</td>
                               <td>${bloodStock.rejectedRequests+bloodStock.approvedRequests}</td>
                               <td>${bloodStock.coinValue}</td>
                           </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div>
</div>
<jsp:include page="footer.jsp"/>