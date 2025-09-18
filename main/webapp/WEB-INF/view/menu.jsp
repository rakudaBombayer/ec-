<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー画面</title>
<link rel="stylesheet" type="text/css" href="css/menu.css">
</head>
<body>


<div class="openbtn"><span></span><span></span><span></span></div>
<nav id="g-nav">
<div id="g-nav-list">
<ul>
<li><a href="LogoutServlet">Logout</a></li>	
<li><a href="AccountChangeServlet">Account</a></li>	
<li><a href="HistoryServlet">History</a></li>	
<li><a href="AdminServlet">Admin</a></li>	
</ul>
</div>
</nav>




<div class="search-container">
<a href="LogoutServlet" class="register-button">ログアウト(仮)</a>
<a href="AccountChangeServlet" class="register-button">アカウント変更画面へ(仮)</a>
<a href="CartListServlet" class="register-button">ショッピングカート画面へ(仮)</a>
<a href="HistoryServlet" class="register-button">注文履歴画面へ(仮)</a>

<!--アドミンユーザーのみ表示: 未実装-->
<a href="AdminServlet" class="register-button">管理者用画面へ(仮)</a>
<!--アドミンユーザーのみ表示: 未実装-->


    <form action="SearchServlet" method="get" class="search-form">
			<!-- 商品名 -->
			<input type="text" name="keyword" placeholder="商品名を入力">

			<!-- カテゴリー -->
			<label for="category">カテゴリ選択:</label> <select name="category"
				id="category">
				<option value="">-- 全て --</option>
				<option value="バイク１">バイク１</option>
				<option value="ガンダム">ガンダム</option>
				<option value="書籍">書籍</option>
			</select> <input type="submit" value="検索">
	</form>
    
</div>
    <c:forEach var="item" items="${shohinList}">
    <div class="item-box">
        <a href="ShohinDetailServlet?shohin_id=${item.shohinId}">
            ${item.shouhinMei}
        </a>
        <p>${item.shouhinSetsumei}</p>
        <p>価格：${item.kakaku}円</p>
        <img src="images/${item.shouhinGazou}" alt="${item.shouhinMei}" width="150">
    </div>
	</c:forEach>



<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="js/menu.js"></script>
</body>
</html>

<style>
    /* フォーム全体を左上に配置 */
    .search-container {
        text-align: left;
        padding: 20px;
    }

    /* 検索フォームとカテゴリ選択を横並びにする */
    .search-form {
        display: flex;
        align-items: center;
        gap: 10px; /* 要素の間隔 */
    }

    input[type="text"] {
        width: 250px;
        padding: 5px;
    }

    select {
        padding: 5px;
    }

    input[type="submit"] {
        padding: 5px 15px;
    }
    .item-box {
    	border: 1px solid #ccc;         /* 枠線の色と太さ */
    	padding: 16px;                  /* 内側の余白 */
    	margin-bottom: 20px;            /* 下の余白 */
    	border-radius: 8px;             /* 角を丸く */
    	background-color: #f9f9f9;      /* 背景色（任意） */
    	box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* ほんのり影（任意） */
}
    
</style>