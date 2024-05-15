<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main">
    <aside class="sidebar">
        <ul>
                  <li><a href="/dashboard" >Dashboard</a></li>
                       <li><a href="/dashboard/createagent">Create Agent</a></li>
                       <li><a href="/dashboard/alluserslist">AllUsers List</a></li>
                       <li><a href="/dashboard/bloodrequests">Requests</a></li>
                       <li><a href="/dashboard/bloodstock"  class="active" >Stock</a></li>
            <li><a  href="/dashboard/bloodreport">Blood Report</a></li>
            <li><a href="/dashboard/coinvalue" >Coin Value</a></li>

        </ul>
    </aside>

       <div class="container">
            <h2 class="text-center mb-4">Avaliable Blood Units Stock</h2>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>

                        <th>Blood Group</th>
                        <th>Avaliable Unit</th>
                        <th>Last Update</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${stock}" var="bloodStock" varStatus="loop">
                        <tr>

                            <td>${bloodStock.bloodGroup}</td>
                            <td>${bloodStock.avaliableUnit}</td>
                            <td>${bloodStock.lastUpdate}</td>


                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
</div>
<jsp:include page="footer.jsp" />