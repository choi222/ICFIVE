<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="resources/css/check.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="resources/css/alertify.core.css" />
        <link rel="stylesheet" href="resources/css/alertify.default.css" id="toggleCSS" />
        <script src="resources/js/alertify.min.js"></script>	
			<title>Insert title here</title>
			<style>
				body{
			background-image: url('resources/img/back.jpg');
			}
			input::-webkit-input-placeholder { color: white; }
		    
			}
			</style>
	</head>
	<body>
	
			<div class="form">
			  <div class="form-toggle"></div>
			  <div class="form-panel one">
			    <div class="form-header">
			      <h1>Find ID</h1>
			    </div>
			    <div class="form-content">
			      <form method="post" id="form" name="form">
			        <div class="form-group">
			          <label for="userName">Username</label>
			          <input class="cls1" type="text" id="username" name="username" required="required" placeholder="이름을 입력해주세요"/>
			        </div>
			        <div class="form-group">
			          <label for="birth">Birth</label>
			          <input type="date" id="birth" name="birth" required="required"/>
			        </div>
			        <div class="form-group">
			          <label for="email">Email</label>
			          <input type="email" id="email" name="email" required="required"/>
			        </div>
			        <div class="form-group">
			          <button type="button" id="findid">찾기</button>
			        </div>
			        <div class="form-group">
			          <button type="button"  onclick="location.href='./'">메인으로</button>
			        </div>
			        <div class="form-group" id="Findid">
			        </div>
			      </form>
			    </div>
			  </div>
			  
			  
			  <div class="form-panel two">
			    <div class="form-header">
			      <h1>Find PW</h1>
			    </div>
			    <div class="form-content">
			      <form method="post" id="form" name="form">
			        <div class="form-group">
			          <label for="userId">ID</label>
			          <input class="cls2" type="text" id="userId" name="userId" required="required" placeholder="아이디를 입력해주세요"/>
			        </div>
			        <div class="form-group">
			          <label for="userName">Name</label>
			          <input class="cls2" type="text" id="userName" name="userName" required="required" placeholder="이름을 입력해주세요"/>
			        </div>
			        <div class="form-group">
			          <label for="Birth">Birth</label>
			          <input type="date" id="Birth" name="Birth" required="required"/>
			        </div>
			        <div class="form-group">
			          <label for="Email">Email Address</label>
			          <input class="cls2" type="email" id="Email" name="Email" required="required" placeholder="이메일을 정확히 입력해주세요"/>
			        </div>
			        <div class="form-group">
			          <button type="button" id="findpw">찾기</button>
			        </div>
			        <div class="form-group">
			          <button type="button"  onclick="location.href='./'">메인으로</button>
			        </div>
			      </form>
			    </div>
			  </div>
			</div>
		
                  <!-- <h4>아이디 찾기</h4>
				  <form method="post" id="form" name="form">  
				    <div>이름
				      <input type="text" name="userName" placeholder="이름을 입력해주세요" id="userName">
				    </div>
				    <div>생일
				      <input type="date" name="birth" id="birth">
				    </div>
				    <div>이메일
				      <input type="email" name="tomail" placeholder="이메일 주소" id="email">
		
				    </div>   
				    <div>
				      <input type="button" value="찾기" id="findid"/>
				    </div>
				    
				    회원 아이디 : <input type="text" value="" id="Findid"/>
				   			 <input type="button" value="메인으로" onclick="location.href='./'"/>
				  </form> -->
	</body>
	<script>
		var url;
		var data;
		var find="${fi}";
		
		var msg="${msg}"
			if(msg!=""){
				alert(msg);
			}
		//아이디 찾기
		$("#findid").click(function(){
			data={};
			data.name = $("#username").val();
			data.birth = $("#birth").val();
			data.email = $("#email").val();
			if(data.name==""){
				alertify.alert("이름을 입력하세요!");
				return false;
			}else if(data.birth==""){
				alertify.alert("생일을 입력하세요!");
				return false;
			}else if(data.email==""){
				alertify.alert("이메일을 입력하세요!");
				return false;
			}else
			ajaxCall("./rest/findid", data);
		});
		
		//비밀번호찾기
		$("#findpw").click(function(){
        	data={};
        	data.id = $("#userId").val();
			data.Name = $("#userName").val();
			data.Birth = $("#Birth").val();
			data.Email = $("#Email").val();
			if(data.id==""){
				alertify.alert("아이디를 입력하세요!");
				return false;
			}else if(data.Name==""){
				alertify.alert("이름을 입력하세요!");
				return false;
			}else if(data.Birth==""){
				alertify.alert("생일을 입력하세요!");
				return false;
			}else if(data.Email==""){
				alertify.alert("이메일을 입력하세요!");
				return false;
			}else
			ajaxcall("./rest/findpw", data);

        });
		
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./rest/findid"){
						if(d.fi !=""){
							$("#Findid").html("회원님의 아이디는 : "+d.fi);
							alertify.alert("회원님의 아이디는 : "+d.fi+"입니다.");
						}else{
							alert(d.msg);
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}
		
		function ajaxcall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./rest/findpw"){
						if(d.success==1){
							alertify.alert(d.msg);
							location.href="./";
						}else{
							alertify.alert(d.msg);
							$("#userId").val("");
							$("#userName").val("");
							$("#Birth").val("");
							$("#Email").val("");
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}
					
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
	<script type="text/javascript">
	$(document).ready(function() {
	  var panelOne = $('.form-panel.two').height(),
	    panelTwo = $('.form-panel.two')[0].scrollHeight;
	
	  $('.form-panel.two').not('.form-panel.two.active').on('click', function(e) {
	    e.preventDefault();
	
	    $('.form-toggle').addClass('visible');
	    $('.form-panel.one').addClass('hidden');
	    $('.form-panel.two').addClass('active');
	    $('.form').animate({
	      'height': panelTwo
	    }, 200);
	  });
	
	  $('.form-toggle').on('click', function(e) {
	    e.preventDefault();
	    $(this).removeClass('visible');
	    $('.form-panel.one').removeClass('hidden');
	    $('.form-panel.two').removeClass('active');
	    $('.form').animate({
	      'height': panelOne
	    }, 200);
	  });
	});
</script>
</html>