<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<style>
table, td, th {
	border: 1px solid black;
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

input, select {
	font-size: 20px;
}

button {
	font-size: 15px;
	margin: 5px;
}

#sending {
	text-align: center;
}

#form {
	font-size: 30px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

	<form action="" method="post" id='frm'>
		<table>
			<tr>
				<th colspan="4" id="form">도서등록</th>
			</tr>
			<tr>
				<th>구분</th>
				<th class="data_ui" colspan="2">데이터입력</th>
				<th>비고</th>
			</tr>
			<tr>
				<td>도서번호</td>
				<td colspan="2"><input type="text" id="bookSeq"
					name="bookSeq" disabled="disabled"></td>
				<td id="message">자동생성</td>
			</tr>

			<tr>
				<td>ISBN</td>
				<td colspan="2"><input type="text" id="isbn" name="isbn">
				</td>
				<td><input type="hidden" id="flag" value="false"></td>
			</tr>
			<tr>
				<td>도서명</td>
				<td colspan="2"><input type="text" id="title"
					name="title"></td>
				<td></td>
			</tr>
			<tr>
				<td>저자/역자</td>
				<td colspan="2"><input type="text" id="author" name="author">
				</td>
				<td></td>
			</tr>

			<tr>
				<td>출판일</td>
				<td colspan="2"><input type="text" id="publishDate" size="35"
					name="publishDate"></td>
				<td></td>
			<tr>
			<tr>
				<td>도서위치</td>
				<td colspan="2"><select name="bookPosition"
					disabled="disabled">
						<option value='BS'>--도서 위치--
						<option value='BS-001' selected>인문서재
						<option value='BS-002'>과학서재
						<option value='BS-003'>특별서재
				</select></td>
				<td>기본값삽입</td>
			<tr>
			<tr>
				<td>도서상태</td>
				<td colspan="2"><select name="bookStatus" disabled="disabled">
						<option value='BM'>--도서 상태--
						<option value='BM-001' selected>대출
						<option value='BM-002'>예약
						<option value='BM-003'>반납
				</select></td>
				<td>기본값삽입</td>
			<tr>
			<tr>
				<td colspan="4" id="sending"><input type="button" value="도서등록"
					id="book_regist"> <input type="button" value="도서리스트"
					id="book_list"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#book_regist').click(function(e){
			
			var flag = false;
			flag = nullCheck();
			
			if(!flag){
				$('#frm').attr('action','/book/mybatisdb/regist.do');
				$('#frm').submit();				
			}
			e.preventDefault();
		});

		$('#book_list').click(function(){
				
				console.log("book_listddd");
			
				window.location.href = "/book/mybatisdb/list.do";
			/*
			$('#frm').attr('action','/book/mybatisdb/list.do');
			$('#frm').attr('method','GET');
			$('#frm').submit();  */
		
		});
		
		let nullCheck = function(){
			var flag = false;
			
			let isbn = document.getElementById("isbn").value;
			let title = document.getElementById("title").value;
			let author = document.getElementById("author").value;
			let publishDate = document.getElementById("publishDate").value;
			
			if(isbn==null || isbn=='' ||title==null || title=='' ||author==null || author=='' ||publishDate==null || publishDate=='' ){
				console.log("nullCheck : false");
				alert("ISBN, 도서명, 저자, 출판일은 적어야합니다.");
				flag =true;
				return flag;
			}
		};
		
	});
	</script>
</body>
</html>