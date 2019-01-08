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

<br/>
<a href="/">Обратно к списку деталей</a>

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
                <input name="searchString" type="text" t value="${searchString}" />
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
</c:if>
</body>
</html>
