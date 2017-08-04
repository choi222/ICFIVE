<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>	
			<title>Insert title here</title>
		<style></style>
	</head>
	<body>
		<div class="container">
		  <h4>비밀번호 찾기</h4>
		  <form method="post" id="form" name="form">  
		    <div><!-- 아이디 -->
		      <input type="text" name="userId" placeholder="아이디를 입력해주세요" id="userId">
		    </div>
		    <div><!-- 이름 -->
		      <input type="text" name="userName" placeholder="이름을 입력해주세요" id="userName">
		    </div>
		    <div><!-- 생일 -->
		      <input type="date" name="birth" id="birth">
		    </div>
		    <div><!-- 받는 사람 이메일 -->
		      <input type="email" name="tomail" placeholder="이메일 주소" id="email">

		    </div>   
		    <div>
		      <input type="button" value="찾기" id="findpw">
		      <input type="button" value="메인으로" onclick="location.href='./'">
		    </div>
		  </form>
		</div>
	</body>
	<script>
		var msg="${msg}";
		if(msg!=""){
			alert(msg);
		}
		
		var url;
		var data;
		
		//비밀번호찾기
		$("#findpw").click(function(){
        	data={};
        	data.id = $("#userId").val();
			data.name = $("#userName").val();
			data.birth = $("#birth").val();
			data.email = $("#email").val();
			ajaxCall("./rest/findpw", data);

        });
		
		
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./rest/findpw"){
						if(d.success==1){
							alert(d.msg);
							location.href="./";
						}else{
							alert(d.msg);
							$("#userId").val() = "";
							$("#userName").val() = "";
							$("#birth").val() = "";
							$("#email").val() = "";
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}
		
	</script>
</html>