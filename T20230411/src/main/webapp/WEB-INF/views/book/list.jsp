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
            <p>도서 조회/수정</p>
        </div>

        <div class="list">
            <table width="100%" class="t" id="">
                <thead>
                    <tr>
                       <th>도서번호</th>
                        <th>도서명</th>
                        <th>표지</th>
                        <th>출판일자</th>
                        <th>금액</th>
                        <th>출판사</th>	
                        <th>도서소개</th>										
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${list }">
                        <tr>
                            <td>
                                <c:out value="${book.bookNo}"></c:out>
                            </td>
                            <td>
                                <a class="move" href="${book.bookNo}"><c:out value="${book.bookName}"></c:out></a>
                            </td>
                            <td>
                                <c:out value="${book.bookCoverimg}"></c:out>
                            </td>
                            <td>
                            	<fmt:formatDate pattern="yyyy/MM/dd" value="${book.bookDate}"/>
                            </td>
                            <td>
                                <c:out value="${book.bookPrice}"></c:out>
                            </td>
                            <td>
                                <c:out value="${book.bookPublisher}"></c:out>
                            </td>
                            <td>
                            	<c:out value="${book.bookInfo}"></c:out>
                        	</td>											
                        	</tr>
                    </c:forEach>                   
                </tbody>
            </table>
        </div>
    </div>
    
    
    <footer>
		<p>HRDKOREA Copyright&copy; 2016 All reserved. Human Resources Development Service of Korea.</p>
    </footer>
	
</body>
</html>