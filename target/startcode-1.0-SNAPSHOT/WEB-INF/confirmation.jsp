<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
    </jsp:attribute>

    <jsp:attribute name="footer">

    </jsp:attribute>

    <jsp:body>

        <h1>Du er nu booket!</h1>
        Vi har booket en session med følgende oplysninger: <br>
        Navn: ${requestScope.get("name")}<br>
        E-mail: ${requestScope.get("email")}<br>
        Mobil nummer: ${requestScope.get("mobile")}<br>
        <br>
        Husk at dit sauna event er på ${requestScope.saunaevent.address}


    </jsp:body>
</t:pagetemplate>