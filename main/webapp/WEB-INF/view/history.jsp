<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderHistory" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>


<html>
<head>
  <title>注文履歴</title>
</head>
<body>
  <h1>注文履歴</h1>

<c:choose>
    <c:when test="${empty orderHistory}">
      <p>注文履歴がありません。</p>
    </c:when>
    <c:otherwise>
      <table border="1">
        <tr>
          <th>商品名</th>
          <th>価格</th>
          <th>数量</th>
          <th>注文日時</th>
        </tr>
        <c:forEach var="item" items="${orderHistory}">
          <tr>
            <td>${item.shohinMei}</td>
            <td>${item.kakaku}円</td>
            <td>${item.quantity}</td>
            <td><fmt:formatDate value="${item.orderTime}" pattern="yyyy年MM月dd日 HH:mm"/></td>
          </tr>
        </c:forEach>
      </table>
    </c:otherwise>
  </c:choose>

  <p><a href="MenuServlet">メニューへ戻る</a></p>
</body>
</html>
