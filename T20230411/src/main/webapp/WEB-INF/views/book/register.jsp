<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작화면</title>
<style>
    header h2 {
        text-align: center;
        background-color: rgb(210, 210, 210);
        height: 80px;
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
        margin: 20px 0;
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
    	height: 50px;
    	padding: 20px;
        background-color: rgb(210, 210, 210);
        color: white;
        text-align: center;
    }
    .register_form {
        width: 600px;
        margin: 0 auto;
        border: 1px solid rgb(177, 175, 175);
        padding: 20px;
    }
    .register_form p {
        text-align: center;
    }
    .register_form ul {
        list-style-type: none;
    }

    .register_form label {
    	width: 150px;
    	display: inline-block;

    }
    .register_form input {
    	width: 350px;
     	margin-bottom: 20px;
     	height: 30px;   	
    }
     .register_form textarea {
    	width: 350px; 
    	height: 60px;	
    }
    .btn_reg {
    	text-align: center;
    }
    a {
    	color:white;
    }
</style>

</head>
<body>
	<header>
        <h2>도서대여관리</h2>
        <nav>
            <ul>
                <li><a href="/book/register">도서등록</a></li>
                <li><a href="/book/list">도서목록조회/수정</a></li>
                <li><a href="/book/rent">대여현황조회</a></li>
                <li><a href="/book/index">홈으로</a></li>
            </ul>
        </nav>
    </header>
    <div id="container">
        <div class="body_title">
            <p>도서 등록</p>
        </div>

        <div class="register_form">
			<form action="/book/register" method="post">
                <ul>
                    <li>
                        <label>도서번호</label>
                        <input type="text" id="bookNo" name="bookNo" value="${bno}" readonly>
                    </li>
                    <li>
                        <label>도서명</label>
                        <input type="text" id="bookName" name="bookName">
                    </li>
                    <li>
                        <label>도서표지</label>
                        <input type="text" id="bookCoverimg" name="bookCoverimg">
                    </li>
                    <li>
                        <label>출판일자</label>
                        <input type="date" id="bookDate" name="bookDate">
                    </li>
                    <li>
                        <label>금액</label>
                        <input type="text" id="bookPrice" name="bookPrice">
                    </li>
                    <li>
                        <label>출판사</label>
                        <input type="text" id="bookPublisher" name="bookPublisher">
                    </li>
                    <li>
                        <label>도서소개</label>
                        <textarea id="bookInfo" name="bookInfo"></textarea>
                    </li>
                </ul>
                <div class="btn_reg">
	                <button type="submit" class="submit_btn">등록</button>
	                <button>조회</button>
                </div>
			</form>
        </div>
    </div>
    
    
    <footer>
		<p>HRDKOREA Copyright&copy; 2016 All reserved. Human Resources Development Service of Korea.</p>
    </footer>
	
	<script>
		
	$(document).ready(function () {
		
		$('.submit_btn').on('click', function (e) {
			e.preventDefault();
			var inputBN = $('input[name="bookName"]').val();
			console.log(inputBN);
			if(inputBN == null) {
				alert("도서명이 입력되지 않았습니다.");
				$('input[name="bookName"]').focus();
				
			} else {
				
				// ajax 호출.
				$.ajax({
					url:'',
					processDate: false,
					contentType: false,
					type: 'post',
					data: formData,
					success: function (result) {
						alert("도서 등록이 완료되었습니다.");
						console.log(result);
						
					},
					error: function (reject) {
						alert('Error');
						console.error(reject);
					}
				})
			}
			
		})
	})
	
	
	</script>
	
</body>
</html>