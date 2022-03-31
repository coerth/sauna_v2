<%--
  Created by IntelliJ IDEA.
  User: hvore
  Date: 30-03-2022
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="/error.jsp" isErrorPage="false" %>


<t:pagetemplate>
    <jsp:attribute name="header">
         Booking
    </jsp:attribute>

    <jsp:attribute name="footer">

    </jsp:attribute>

    <jsp:body>
        <p>Book her </p>


        <c:forEach items="${applicationScope.eventArrayList}" var="item" >

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">${item.startTime}</h5>
                <h6 class="card-subtitle mb-2 text-muted">${item.duration} time</h6>
                <p class="card-text">${item.address}</p>
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
            </div>
        </div>



        </c:forEach>

    </jsp:body>

</t:pagetemplate>