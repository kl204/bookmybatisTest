<%@page import="bitedu.bipa.book.vo.BookCopy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
            /* width: 250px; */
            height: 50px;
        }

        button {
            font-size: 15px;
            margin: 5px;
        }
        
        
        #sending {
        	text-align: center;
        }
        
        input.poster :disabled {
        	background: gray;
        }
        
        #form {
        	font-size: 30px;
        }
        
        #message {
        	color: red;
        }
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#book_update').click(function(){
				$('#frm').attr('action','/book/mybatisdb/update.do');
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
<%
	BookCopy copy = (BookCopy)request.getAttribute("copy");
%>
<form action="" method="post" id='frm'>
    <table>
        <tr><th colspan="4" id="form">도서 수정</th></tr>
        <tr><th>구분</th><th class="data_ui" colspan="2">데이터입력</th><th>비고</th></tr>
        <tr>
            <td>도서번호</td>
            <td colspan="2">
            	<input type="text" id="bookSeq" name="bookSeq" value="<%=copy.getBookSeq()%>">
      	
            </td>
            <td>
            </td>
         </tr>
        <tr>
        	<td>ISBN</td>
        	<td colspan="2">
        		<input type="text" id="isbn" name="isbn" value="<%=copy.getIsbn()%>">
        	</td>
        	
        </tr>
        <tr>
        	<td>도서명</td>
        	<td colspan="2">
        		<input type="text" id="title" name="title" value="<%=copy.getTitle()%>">
        	</td><
        </tr>
        <tr>
        	<td>저자/역자</td>
        	<td colspan="2">
        		<input type="text" id="author" name="author" value="<%=copy.getAuthor()%>">
        	</td>
        	<td>
        		
        	</td>
        </tr>
        <tr>
        	<td>출판일</td>
        	<td colspan="2">
        		<input type="text" id="publishDate" size="35" name="publishDate" value="<%=copy.getPublishDate()%>">
        	</td>
        	<td></td>
        <tr>
        <tr>
        	<td>도서위치</td>
        	<td colspan="2">
        		<select name="bookPosition" >
        			<option value='BS'>--도서 위치--
        			<option value='BS-001' <%=copy.getBookPosition().equals("BS-001")?"selected":""%>>인문서재
        			<option value='BS-002' <%=copy.getBookPosition().equals("BS-002")?"selected":""%>>과학서재
        			<option value='BS-003' <%=copy.getBookPosition().equals("BS-003")?"selected":""%>>특별서재
        		</select>
        	</td>
        	<td></td>
        <tr>
        <tr>
        	<td>도서상태</td>
        	<td colspan="2">
        		<select name="bookStatus" >
        			<option value='BM'>--도서 상태--
        			<option value='BM-001' <%=copy.getBookStatus().equals("BM-001")?"selected":""%>>대출
        			<option value='BM-002' <%=copy.getBookStatus().equals("BM-002")?"selected":""%>>예약
        			<option value='BM-003' <%=copy.getBookStatus().equals("BM-003")?"selected":""%>>미반납
        		</select>
        	</td>
        	<td></td>
        <tr>
        <tr>
        	<td colspan="4" id="sending">
        		<input type="button" value="수정" id="book_update"> 
        		<input type="button" value="도서리스트" id="book_list"> 
        	</td>
        </tr>
    </table>
</form>
</body>
</html>