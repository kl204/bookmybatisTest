<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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

        #message1,#message2,#message3 {
        	color: red;
        }
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			$('#check_id').on('click',function(e){
				let userId = $('#userId').val();
				
				console.log(userId);
				
				let message = "";
								
				const regexPattern = new RegExp(`^[a-z][?a-z0-9A-Z]{4,15}.*$`);
				
				console.log("유효식 검사" + regexPattern.test(userId));
				
				if(regexPattern.test(userId)){
					 $.ajax({
				    	    type: "GET", 
				    	    url: "/book/mybatisdb/idCheck.do?userId=" + userId, 
				    	    success: function (data) {
				    		  console.log("success");
				    	      console.log(data);
				    	      
				    	      const Result = data;
				    	  	const flags = document.getElementById("flag");
				    	      
				    	      console.log("아이디 중복체크 : " + Result);				    	  
			    	      
 				    	      if (Result==1) {
				    	        document.getElementById("message1").innerHTML = "아이디가 존재합니다";
				    	        flags.value = false;

				    	      } else {
				    	        document.getElementById("message1").innerHTML = "아이디 생성 가능합니다";
				    	        flags.value = true;
				    	      } 
				    	    },error: function(err){
				    	    	
				    	    	console.log(err);
				    	  
				    	    }
				    	    
				    	    
				    	  });		 
					 
					 
				} else {
					message += 'id가 비어있거나 형식에 맞지 않습니다.';
					$('#message1').html(message);
				}
			//		e.preventDefault();
			});		
			
			let confirm = () => {
				let result = false;
				
				const pwd1 = document.getElementById("userPassword").value;
				const pwd2 = document.getElementById("pwd2").value;

				if(pwd1 ==null || pwd1 =='' ){
					$('#message2').html('비번이 비어있습니다');
				}else{
					
					if(pwd1 == pwd2){
						$('#message2').html('비번이 일치합니다.');
						result = true;
					}else {
						$('#message2').html('비번이 일치하지 않습니다.');
					}
					
				}
				

				return result;
			};
			
			let count = function(){
				result = false;
				
				const interest =document.getElementsByName("interests");
				let interestNum = 0;
				
				Array.from(interest).forEach(ele => {
					  if (ele.checked) {
					    interestNum++;
					  }
					});
				
				
				if(interestNum > 1 && interestNum < 4){
					result= true;
					$('#message3').html('선택되었습니다');

				}else{
					$('#message3').html('2~3개 사이 선택해야합니다.');
				}
				
				return result;
			};
			
			$('#regist').on('click',function(e){
				result = confirm();
				result = count() && result;
				if(!result){
					console.log("아직 등록 못함");
					e.preventDefault();
				}else{
                    $('#frm').attr('action','/book/mybatisdb/userRegist.do');
			        $('#frm').submit();            
			
				}			
				
			});
		});
	</script>
</head>
<body>
<form action="" method="post" id="frm">
    <table>
        <tr><th colspan="4" id="form"><h1>회원가입</h1></th></tr>
        <tr>
        	<th>구분</th>
        	<th class="data_ui" colspan="1">데이터입력</th>
        	<th>유효성검사</th>
        	<th>비고</th>
        </tr>
        <tr>
            <td>아이디</td>
            <td colspan="1">
            	<input type="text" id="userId" name="userId">
            	<button type="button" id="check_id">아이디확인</button>
            </td>
            <td>5자리이상 , 첫글자 영문소문자</td>
            <td id="message1"></td>
        </tr>
        <tr>
        	<td>비밀번호</td>
        	<td colspan="1"><input type="password" id="userPassword" name="userPassword"></td>
        	<td rowspan="1">비밀번호 일치</td>
        	<td id="message2"></td>
        </tr>
        <tr>
        	<td>비번확인</td>
        	<td colspan="1"><input type="text" id="pwd2"></td>
        	<td id=""></td>
        	<td id=""></td>
        </tr>
        <tr>
            <td>성별</td>
            <td colspan="1">
                <input type="radio" name="userGender" value="M">남
                <input type="radio" name="userGender" value="F" checked>여
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>관심분야</td>
            <td colspan="1">
                <input type="checkbox" name="interests" value="0">문학
                <input type="checkbox" name="interests" value="1">어학
                <input type="checkbox" name="interests" value="2" checked>정보IT<br>
                <input type="checkbox" name="interests" value="3">과학
                <input type="checkbox" name="interests" value="4">수학
                <input type="checkbox" name="interests" value="5">예술
            </td>
            <td>2~3개 사이 선택</td>
            <td id="message3"></td>
        </tr>
        <tr>
        	<td>자기소개</td>
        	<td colspan="1"><textarea cols="50" rows="5" name="userIndroduce"></textarea></td>
        	<td></td>
        	<td></td>
        </tr>    
        <tr id="footer">
        	<td colspan="4"><input type="button" value="가입" id="regist"> <input type="reset"></td>
        </tr>
    </table>
    <input type="hidden" id="flag" value="false">
</form>
</body> 
</html>