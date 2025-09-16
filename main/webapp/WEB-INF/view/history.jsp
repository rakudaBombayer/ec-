<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderHistory" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
  <title>注文履歴</title>
</head>
<body>
  <h1>注文履歴</h1>

  <%
    List<OrderHistory> orderHistory = (List<OrderHistory>) request.getAttribute("orderHistory");
    if (orderHistory == null || orderHistory.isEmpty()) {
  %>
    <p>注文履歴がありません。</p>
  <%
    } else {
  %>
    <table border="1">
      <tr>
        <th>商品名</th>
        <th>価格</th>
        <th>数量</th>
        <th>注文日時</th>
      </tr>
      <%
        for (OrderHistory item : orderHistory) {
      %>
      <tr>
        <td><%= item.getShohinMei() %></td>
        <td><fmt:formatNumber value="${item.kakaku}" type="currency" currencySymbol="円"/></td>
        <td><%= item.getQuantity() %></td>
        <td><fmt:formatDate value="<%= item.getOrderTime() %>" pattern="yyyy年MM月dd日 HH:mm"/></td>
      </tr>
      <%
        }
      %>
    </table>
  <%
    }
  %>

  <p><a href="MenuServlet">メニューへ戻る</a></p>
</body>
</html>
