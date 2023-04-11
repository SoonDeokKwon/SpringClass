<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작화면</title>
<style>
    header h2 {
        text-align: center;
        background-color: rgb(210, 210, 210);
        height: 50px;
        margin: 0;
    }
    header li {
        list-style-type: none;
        display: inline-block;
        margin-right: 25px;
        margin-top: 10px;
    }
    nav {
        background-color: black;
        color: white;
    }
    nav ul {
        height: 40px;
        margin: 0;
    }

    #container {
        padding: 20px;
    }

    #container .body_title {
        text-align: center;
        font-weight: 700;
    }
    #container .body_title p {
        font-size: 20px;
        font-weight: 700;
    }
    footer {
        background-color: rgb(210, 210, 210);
        color: white;
        text-align: center;
    }
    #container .register_form {
        text-align: center;
    }
</style>

</head>
<body>
	<header>
        <h2>도서대여관리</h2>
        <nav>
            <ul>
                <li>도서등록</li>
                <li>도서목록조회/수정</li>
                <li>대여현황조회</li>
                <li>홈으로</li>
            </ul>
        </nav>
    </header>
    <div id="container">
        <div class="body_title">
            <p>도서 등록</p>
        </div>

        <div class="register_form">
			<form action="">
                <li>
                    <label>도서번호</label>
                    <input type="text" id="" name="" value="" readonly>
                </li>
			</form>
        </div>
    </div>
    
    
    <footer>
		<p>HRDKOREA Copyright&copy; 2016 All reserved. Human Resources Development Service of Korea.</p>
    </footer>
	
</body>
</html>