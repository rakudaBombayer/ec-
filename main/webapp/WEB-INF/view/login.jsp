<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログイン画面</title>
    
</head>
<body>
    <div class="container">
        <h1>バイク・ガンプラショップ</h1>
        <form action="LoginServlet" method="post">
            ユーザーID:<br>
            <input type="text" name="userId" required><br>
            パスワード:<br>
            <input type="password" name="pass" required><br>
                     
            <input type="submit" value="ログイン">          
        </form>
        <a href="RegisterServlet" class="register-button">会員登録</a>
        
        <c:if test="${not empty successMessage}">
    		<p style="color: blue;">${successMessage}</p>
		</c:if>
		<c:if test="${not empty errorMessage}">
    		<p style="color: white;">${errorMessage}</p>
		</c:if>
    </div>
</body>
</html>

<style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-color: #000000;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 40px;
             font-weight: bold;
             color: white;
        }

        form {
            background-color: black;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
             font-weight: bold;
             color: white;
        }

        input[type="text"] {
            width: 250px;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            
        }
        input[type="password"] {
        	width: 250px;
        	padding: 10px;
		    margin-bottom: 20px; /* ← 下に余白を追加 */
		    border: 1px solid #ccc;
            border-radius: 4px;
		}
		        

        input[type="submit"], .register-button {
            width: 250px;
            padding: 10px;
            box-sizing: border-box;
            background-color: #ff0000; 
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
             font-weight: bold;
        }
        
        

        input[type="submit"]:hover,
        .register-button:hover {
            background-color: #af0e0e;
           
        }
        
		.button-group {
    		display: flex;
    		flex-direction: column;
    		align-items: center;
    		width: 100%;
		}
		
        .register-button {
		    display: inline-block;
		    width: 250px;
		    padding: 10px;
		    background-color: #ff0000;
		    color: white;
		    border: none;
		    border-radius: 4px;
		    font-size: 16px;
		    font-weight: bold;
		    text-align: center;
		    text-decoration: none;
		    cursor: pointer;
		    box-sizing: border-box; /* ← これが重要！ */
		    line-height: 1.5;        /* 高さの調整に有効 */
		}


    </style>
