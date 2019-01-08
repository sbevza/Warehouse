<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Список деталей</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>

<h1>Список деталей</h1>

<form method=get>
    <input type=checkbox OnChange='this.form.submit()' name='sorting' value='true' <spring:message text="${sorting}"/>/>
    <spring:message text="Сортировать по необходимости для сборки"/>
</form>

<c:if test="${!empty parts}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Наименование</th>
            <th width="120">Необходимость</th>
            <th width="120">Количество</th>
            <th width="60">Редактировать</th>
            <th width="60">Удалить</th>
        </tr>
        <c:forEach items="${parts}" var="part">
            <tr>
                <td>${part.id}</td>
                <td>${part.partName}</td>
                <td>
                    <c:choose>
                        <c:when test="${part.require}">
                            Да
                        </c:when>
                        <c:when test="${!part.require}">
                            Нет
                        </c:when>
                    </c:choose>
                </td>

                <td>${part.quantity}</td>
                <td><a href="<c:url value='/edit/${part.id}'/>">Редактировать</a></td>
                <td><a href="<c:url value='/remove/${part.id}'/>">Удалить</a></td>
            </tr>
        </c:forEach>
    </table>
    <br/>
    <table class="tg">
        <tr>
            <td width="170">Можно собрать</td>
            <td width="40">${canAssemble}</td>
            <td width="100">компьютеров</td>
        </tr>
    </table>
</c:if>

<c:if test="${currentPage > 1}">
<a href="<c:url value="/?page=1" />">
    </c:if>
    <<
    <c:if test="${currentPage > 1}">
</a>
</c:if>

<c:if test="${currentPage > 1}">
<a href="<c:url value="/?page=${currentPage - 1}" />">
    </c:if>
    <
    <c:if test="${currentPage > 1}">
</a>
</c:if>

<c:forEach var="i" begin="${currentPage - 2 < 1 ? 1 : currentPage - 2}"
           end="${currentPage + 2 > pageAmount ? pageAmount : currentPage + 2}">
    <a href="<c:url value="/?page=${i}" />"><spring:message text="${i}"/></a>

</c:forEach>

<c:if test="${currentPage < pageAmount}">
<a href="<c:url value="/?page=${currentPage + 1}" />">
    </c:if>
    >
    <c:if test="${currentPage < pageAmount}">
</a>
</c:if>

<c:if test="${currentPage < pageAmount}">
<a href="<c:url value="/?page=${pageAmount}" />">
    </c:if>
    >>
    <c:if test="${currentPage < pageAmount}">
</a>
</c:if>

<h1>Поиск по наименованию</h1>

<form action="/search" method="post">
    <table>
        <tr>
            <td>
                <label path="label">
                    <spring:message text="Наименование"/>
                </label>
            </td>
            <td>
                <input name="searchString" type="text"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">

                    <input type="submit"
                           value="<spring:message text="Найти"/>"/>

            </td>
        </tr>
    </table>
</form>

<h1>Добавить новую деталь</h1>

<c:url var="addAction" value="/add?page= + ${currentPage}"/>

<form:form action="${addAction}" commandName="part">
    <table>
        <c:if test="${!empty part.partName}">
            <tr>
                <td>
                     <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="partName">
                    <spring:message text="Наименование"/>
                </form:label>
            </td>
            <td>
                <form:input path="partName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="require">
                    <spring:message text="Необходимость"/>
                </form:label>
            </td>
            <td>
                <form:checkbox path="require"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="quantity">
                    <spring:message text="Количество"/>
                </form:label>
            </td>
            <td>
                <form:input path="quantity"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${empty part.partName}">
                    <input type="submit"
                           value="<spring:message text="Добавить"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
