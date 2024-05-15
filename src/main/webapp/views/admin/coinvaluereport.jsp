<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main">
    <aside class="sidebar">
        <ul>
             <li><a href="/dashboard">Dashboard</a></li>
                                   <li><a href="/dashboard/createagent">Create Agent</a></li>
                                   <li><a href="/dashboard/alluserslist" >AllUsers List</a></li>
                                   <li><a href="/dashboard/bloodrequests">Requests</a></li>
                                   <li><a href="/dashboard/bloodstock" >Stock</a></li>
                                    <li><a  href="/dashboard/bloodreport">Blood Report</a></li>
                                    <li><a href="/dashboard/coinvalue" class="active">Coin Value</a></li>

        </ul>
    </aside>

       <div class="container">
            <h2 class="text-center mb-4">Coin Value</h2>
            <table class="table table-bordered table-hover">
                       <thead>
                           <tr>
                               <th>Serial No.</th>
                               <th>EndUser UserName</th>
                               <th>Blood Group</th>
                               <th>End User Coins</th>
                               <th>Agent Coins</th>
                               <th>Admin Coins</th>
                           </tr>
                       </thead>
                       <tbody>
                            <c:forEach var="list" items="${getCoinReport}" varStatus="loop">
                                           <tr>
                                               <td>${loop.index + 1}</td>
                                               <td>${list.userName}</td>
                                               <td>${list.bloodGroup}</td>
                                               <td>${list.userCoins}</td>
                                               <td>${list.agentCoins}</td>
                                               <td>${list.adminCoins}</td>
                                           </tr>
                                       </c:forEach>
                                      <c:set var="totalAdminCoins" value="0" />
                                      <c:set var="totalAgentCoins" value="0" />
                                      <c:set var="totalEndUserCoins" value="0" />
                                        <c:forEach items="${getCoinReport}" var="bloodStock" varStatus="loop">
                                            <c:set var="adminCoins" value="${bloodStock.adminCoins}" />
                                            <c:if test="${bloodStock.agentCoins ne ' - '}">
                                            <c:set var="agentCoins" value="${bloodStock.agentCoins}" />
                                            </c:if>
                                            <c:set var="userCoins" value="${bloodStock.userCoins}" />
                                            <c:if test="${not empty adminCoins}">
                                                <c:set var="totalAdminCoins" value="${totalAdminCoins + adminCoins}" />
                                                <c:set var="totalAgentCoins" value="${totalAgentCoins + agentCoins}" />
                                                <c:set var="totalEndUserCoins" value="${totalEndUserCoins + userCoins}" />
                                            </c:if>
                                        </c:forEach>
                                        <tr><td colspan="3">Total Coins: </td>
                                             <td>${totalEndUserCoins}</td>
                                             <td>${totalAgentCoins}</td>
                                             <td>${totalAdminCoins}</td>
                                        </tr>
                       </tbody>
                   </table>
            <c:if test="${empty getCoinReport}">
            <strong>No request found</strong>
            </c:if>
        </div>
</div>
<jsp:include page="footer.jsp" />