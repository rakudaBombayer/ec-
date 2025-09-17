<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録画面</title>
</head>
<body>
<c:choose>
  <c:when test="${empty task}">
    <h2>【会員登録】</h2>
  </c:when>
  <c:otherwise>
    <h2>【登録変更】</h2>
  </c:otherwise>
</c:choose>
<form action="RegisterServlet" method="post">
    <div>
        <label>氏名</label><br>
        <input type="text" name="shimei" size="40" placeholder="氏名を入力" required>
    </div>
    <div>
        <label>パスワード</label><br>
        <input type="text" name="password" size="40" placeholder="パスワードを入力" required>
    </div>
    <div>
        <label>郵便番号</label><br>
        <input type="text" name="yuubin_bangou" id="zipcode" size="40" placeholder="郵便番号を入力" required>
    </div>
    <div>
        <label>住所</label><br>
        <input type="text" name="address" size="40" id="address" placeholder="住所を入力" required>
    </div>
    <div>
        <label>電話番号</label><br>
        <input type="text" name="denwa_bangou" size="40" placeholder="電話番号を入力" required>
    </div>
    <div>
        <label>生年月日</label><br>
        <input type="date" name="seinengappi" size="40" placeholder="生年月日を入力" required>
    </div>
    <div>
        <label>メールアドレス</label><br>
        <input type="text" name="mail_address" size="40" placeholder="メールアドレスを入力" required>
    </div>
    <div>
        <label>支払方法</label><br>
        <input type="text" name="shiharai_houhou" size="40" placeholder="支払方法を入力" required>
    </div>
    <div>
        <input type="submit" value="登録する">
    </div>
</form>



<a href="LoginServlet" class="register-button">ログイン画面へ</a>
</body>
</html>

<script>
document.getElementById("zipcode").addEventListener("blur", function() {
    const zipcode = this.value.replace(/[^0-9]/g, ""); // 数字のみ抽出
    if (zipcode.length === 7) {
        fetch("https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + zipcode)
            .then(response => response.json())
            .then(data => {
                if (data.results) {
                    const result = data.results[0];
                    const fullAddress = result.address1 + result.address2 + result.address3;
                    document.getElementById("address").value = fullAddress;
                } else {
                    alert("住所が見つかりませんでした。");
                }
            })
            .catch(error => {
                console.error("通信エラー:", error);
                alert("住所検索に失敗しました。");
            });
    } else {
        alert("郵便番号は7桁で入力してください。");
    }
});
</script>

<style>
    body {
        font-family: 'Oswald', sans-serif, sans-serif;
        background-color: #000000;
        color: white;
        padding: 40px;
    }

    h2 {
        text-align: center;
        font-weight: bold;
        color: white;
    }

    form {
        max-width: 500px;
        margin: auto;
        background: #000000;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
    }

    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
        color: white;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="date"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        display: block;
        margin: 25px auto 0 auto;
        width: 150px;
        padding: 12px;
        background-color: #ff0000;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background-color: #af0e0e;
    }

    a.register-button {
        display: block;
        text-align: center;
        margin-top: 30px;
        color: #FFFFFF;
        text-decoration: none;
        font-weight: bold;
    }

    a.register-button:hover {
        text-decoration: underline;
    }
</style>