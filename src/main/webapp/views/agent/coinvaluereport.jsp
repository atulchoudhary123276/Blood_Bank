<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main">
    <aside class="sidebar">
        <ul>
            <li><a href="/dashboard">Dashboard</a></li>
            <li><a href="/signup">Create EndUser</a></li>
            <li><a href="/dashboard/alluserslist" >EndUsers List</a></li>
            <li><a href="/dashboard/bloodrequests"  >Requests</a></li>
            <li><a href="/dashboard/bloodreport">Blood Report</a></li>
            <li><a href="/dashboard/coinvalue" class="active">Coin Value</a></li>
        </ul>
    </aside>

       <div class="container">
            <h2 class="text-center mb-4">Coin Value</h2>
            <table class="table table-bordered table-hover">
                       <thead>
                           <tr>
                               <th>Serial No.</th>
                               <th>Blood Group</th>
                               <th>End User Coins</th>
                               <th>Rate</th>
                               <th>Agent Coins</th>
                           </tr>
                       </thead>
                       <tbody>
                            <c:forEach var="entry" items="${getCoinReport}" varStatus="loop">
                                           <tr>
                                               <%-- Extract blood group and coins array from the map entry --%>
                                               <%-- Ensure to use c:forEach varStatus to access loop.index --%>
                                               <c:set var="bloodGroup" value="${entry.key}" />
                                               <c:set var="coinsAndRate" value="${entry.value}" />
                                               <c:set var="userCoins" value="${coinsAndRate[0]}" />
                                               <c:set var="agentCoins" value="${coinsAndRate[1]}" />
                                               <c:set var="rate" value="${coinsAndRate[2]}" />
                                               <td>${loop.index + 1}</td>
                                               <td>${bloodGroup}</td>
                                               <td>${userCoins}</td>
                                               <td>${rate}</td>
                                               <td>${agentCoins}</td>
                                           </tr>
                                   <%-- Update the totalAgentCoins variable --%>
                                      <c:set var="totalAgentCoins" value="${totalAgentCoins + agentCoins}" />
                                       </c:forEach>

                       </tbody>
                       <tr>
                           <td colspan="4"><strong>Total Agent Coins:</strong></td>
                           <td>${totalAgentCoins}</td>
                       </tr>
                   </table>
            <c:if test="${empty getCoinReport}">
            <strong>No request found</strong>
            </c:if>
        </div>
</div>
<jsp:include page="footer.jsp" />
