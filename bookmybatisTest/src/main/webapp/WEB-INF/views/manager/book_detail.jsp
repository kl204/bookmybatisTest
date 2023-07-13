<%@page import="bitedu.bipa.book.vo.BookCopy"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<style>
        table, td, th {
            border : 1px solid black;
            border-collapse: collapse;
            margin: 20px auto;
        }
        td {
            width: 150px;
            height: 50px;
            padding: 5px;
            font-size: 20px;
            /* text-align: center; */
        }

        input , select {
            font-size: 20px;
        }
        .data_ui {
            width: 350px; 
            height: 50px;
        }

        button {
            font-size: 15px;
            margin: 5px;
        }        
        
        #message {
        	color: red;
        }
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#view_update').click(function(){
				const bookSeqVal = document.getElementById("bookseq").value;
				$('#frm').attr('action',"/book/mybatisdb/view_update.do?bookSeq="+bookSeqVal);
				$('#frm').submit();
			});
		});
		
		$(document).ready(function(){
			$('#book_list').click(function(){
				$('#frm').attr('action','/book/mybatisdb/list.do');
				$('#frm').attr('method','GET')
				$('#frm').submit();
			});
		});
	</script>
</head>
<body>
<% BookCopy copy = (BookCopy)request.getAttribute("copy"); %>
<form action="" method="post" id='frm'>
    <table>
        <tr><th colspan="4" id="form"><h1>도서 상세</h1></th></tr>
        <tr><th>구분</th><th class="data_ui" colspan="2">내용</th><th>비고</th></tr>
        <tr>
            <td>도서번호</td>
            <td colspan="2" id="book_seq">
            	<%=copy.getBookSeq()%>
            	<input type="hidden" id="bookseq" value="<%=copy.getBookSeq()%>">
            </td>
            <td id="message"></td></tr>
        <tr>
        	<td>ISBN</td>
        	<td colspan="2">
        		<%=copy.getIsbn()%>
        	</td>
        	<td>
        	</td>
        </tr>
        <tr>
        	<td>도서명</td>
        	<td colspan="2">
        		<%=copy.getTitle()%>
        	</td><td></td>
        </tr>
        <tr>
        	<td>저자/역자</td>
        	<td colspan="2">
        		<%=copy.getAuthor()%>
        	</td><td></td>
        </tr>
        <tr>
        	<td>출판일</td>
        	<td colspan="2">
        		<fmt:formatDate value="<%=copy.getPublishDate()%>" pattern="yyyy-MM-dd"/> 
        		
        	</td>
        	<td></td>
        <tr>
        <tr>
        	<td>도서위치</td>
        	<td colspan="2">
        	<%=copy.getBookPosition().equals("BS-001")?"인문서재":""%>
        	<%=copy.getBookPosition().equals("BS-002")?"과학서재":""%>
        	<%=copy.getBookPosition().equals("BS-003")?"특별서재":""%>
        	</td>
        	<td></td>
        <tr>
        <tr>
        	<td>도서상태</td>
        	<td colspan="2">
        	<%=copy.getBookStatus().equals("BM-001")?"대출":""%>
        	<%=copy.getBookStatus().equals("BM-002")?"예약":""%>
        	<%=copy.getBookStatus().equals("BM-003")?"미반납":""%>
        	</td>
        	<td></td>
        <tr>
        <tr>
        	<td colspan="4" id="sending" style="text-align: center">
        		<input type="button" value="수정화면으로" id="view_update"> 
        		<input type="button" value="도서리스트" id="book_list"> 
        	</td>
        </tr>
    </table>
</form>
</body>
</html>