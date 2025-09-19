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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vegas/2.4.4/vegas.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.10.0/css/lightbox.min.css">


</head>
<body>


<div class="openbtn"><span></span><span></span><span></span></div>
<nav id="g-nav">
<div id="g-nav-list">
<ul>
<li><a href="LogoutServlet">Logout</a></li>	
<li><a href="AccountChangeServlet">Account</a></li>	
<li><a href="HistoryServlet">Purchase History</a></li>	
<li><a href="AdminServlet">Admin</a></li>	
</ul>
</div>
</nav>


<div id="slider-area" class="bgextend bgRLextendTrigger">
    <div class="bgappearTrigger">
        <div id="slider">
        	<div class="slider-text js_typing_top">BIKE AND GUNPLA </div>
        	<div class="slider-text-under js_typing_top"> EC SHOP</div>
        </div>
    </div>  
</div>
<div class="search-container">


<!-- <a href="LogoutServlet" class="register-button">ログアウト(仮)</a>
<a href="AccountChangeServlet" class="register-button">アカウント変更画面へ(仮)</a>
<a href="CartListServlet" class="register-button">ショッピングカート画面へ(仮)</a>
<a href="HistoryServlet" class="register-button">注文履歴画面へ(仮)</a>
 -->
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

<!--  商品画像を4つずつ表示-->
<div>SHOP</div>
<div class="item-container">
    <c:forEach var="item" items="${shohinList}">
    <div class="item-box">
        <a href="ShohinDetailServlet?shohin_id=${item.shohinId}">
  			<img src="images/${item.shouhinGazou}" alt="${item.shouhinMei}" width="150">
		</a>
        <p class="js_typing_item">${item.shouhinMei}</p>
        <p class="js_typing_item">価格：${item.kakaku}円</p>
        
    </div>
	</c:forEach>
</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/vegas/2.4.4/vegas.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/shuffle-text@0.3.0/build/shuffle-text.min.js"></script>
<!-- <script src="js/script.js"></script> -->
<script src="js/menu.js"></script>

</body>
</html>

<style>
	body {
	  background-color: #000000; /* 完全な黒 */
	  color: #ffffff;            /* テキストを白にして読みやすく */
	  font-family: 'Oswald', sans-serif;
	}
	
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
    	background-color: #222;
    	padding: 16px;                  /* 内側の余白 */
    	margin-bottom: 20px;            /* 下の余白 */
    	border-radius: 8px;             /* 角を丸く */
    	/* background-color: #f9f9f9;      /* 背景色（任意） */ */
    	box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* ほんのり影（任意） */
}


.item-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* 4列に分割 */
  gap: 20px; /* アイテム間の余白 */
  padding: 20px;
}


#slider {
  height: 100vh;
  width: 100%;
  position: relative;
  z-index: 1;
  overflow: hidden;
}

.slider-text {
  position: absolute;
  top: 50%;
  left: 20%;
  transform: translate(-50%, -50%);
  color: white;
  font-size: 3rem;
  font-weight: bold;
  text-shadow: 2px 2px 5px rgba(0,0,0,0.7);
  z-index: 2;
  pointer-events: none;
}
.slider-text-under {
  position: absolute;
  top: 60%;
  left: 15%;
  transform: translate(-50%, -50%);
  color: white;
  font-size: 3rem;
  font-weight: bold;
  text-shadow: 2px 2px 5px rgba(0,0,0,0.7);
  z-index: 2;
  pointer-events: none;
}
/* .slider-text-shohin{
 position: absolute;
  top: 60%;
  left: 15%;
  transform: translate(-50%, -50%);
  color: white;
  font-size: 3rem;
  font-weight: bold;
  text-shadow: 2px 2px 5px rgba(0,0,0,0.7);
  z-index: 2;
  pointer-events: none;


} */

</style>

<script>

document.addEventListener("DOMContentLoaded", function () {
  // スライダー画像の切り替え
  const slider = document.getElementById("slider");
  const images = [
    "images/Ggundam.jpg",
    "images/gyakusyuugundam.jpg",
    "images/SeedDestinygundam.jpg",
    "images/UCgundam.jpg",
    "images/Wgundam.jpg"
  ];
  let currentIndex = 0;
  const img = document.createElement("img");
  img.src = images[currentIndex];
  img.alt = "スライダー画像";
  img.style.width = "100%";
  img.style.height = "auto";
  slider.appendChild(img);

  setInterval(() => {
    currentIndex = (currentIndex + 1) % images.length;
    img.src = images[currentIndex];
  }, 2000); // 2秒ごとに切り替え

  // ファーストビューの文字は即アニメーション
  const topElements = document.querySelectorAll('.js_typing_top');
  topElements.forEach(el => {
    const shuffle = new ShuffleText(el);
    shuffle.duration = 3000;
    shuffle.start();
  });

  // 商品一覧の文字はスクロールしてから1秒後にアニメーション
  const itemElements = document.querySelectorAll('.js_typing_item');
  const observer = new IntersectionObserver((entries, obs) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        setTimeout(() => {
          const shuffle = new ShuffleText(entry.target);
          shuffle.duration = 3000;
          shuffle.start();
        }, 200);
        obs.unobserve(entry.target);
      }
    });
  }, {
    threshold: 0.1
  });

  itemElements.forEach(el => observer.observe(el));
});

</script>


