<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="resources/css/join.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="resources/css/alertify.core.css" />
        <link rel="stylesheet" href="resources/css/alertify.default.css" id="toggleCSS" />
        <script src="resources/js/alertify.min.js"></script>
		<title>Insert title here</title>
		<style>
			body{
			background-image: url('resources/img/back.jpg');
			
			}
			.forn-groupId label{
			color: rgba(0, 0, 0, 0.6);
			}
			.forn-groupId input {
			  outline: none;
			  background: rgba(0, 0, 0, 0.1);
			  width: 80%;
			  border: 0;
			  border-radius: 4px;
			  box-sizing: border-box;
			  padding: 12px 20px;
			  color: rgba(0, 0, 0, 0.6);
			  font-family: inherit;
			  font-size: inherit;
			  font-weight: 500;
			  line-height: inherit;
			  -webkit-transition: 0.3s ease;
			          transition: 0.3s ease;
			}
			.forn-groupId button {
			  outline: none;
			  background: #4285F4;
			  border: 0;
			  border-radius: 4px;
			  padding: 13px 14px;
			  color: #FFFFFF;
			  font-family: inherit;
			  font-size: inherit;
			  font-weight: 500;
			  line-height: inherit;
			  text-transform: uppercase;
			  cursor: pointer;
			}
			#zipNo{
			  outline: none;
			  background: rgba(0, 0, 0, 0.1);
			  width: 150px;
			  border: 0;
			  border-radius: 4px;
			  box-sizing: border-box;
			  color: rgba(0, 0, 0, 0.6);
			  font-family: inherit;
			  font-size: inherit;
			  font-weight: 500;
			  line-height: inherit;
			  -webkit-transition: 0.3s ease;
			          transition: 0.3s ease;
			}
			#roadAddrPart1{
			  outline: none;
			  background: rgba(0, 0, 0, 0.1);
			  width: 225px;
			  border: 0;
			  border-radius: 4px;
			  box-sizing: border-box;
			  color: rgba(0, 0, 0, 0.6);
			  font-family: inherit;
			  font-size: inherit;
			  font-weight: 500;
			  line-height: inherit;
			  -webkit-transition: 0.3s ease;
	          transition: 0.3s ease;
			}
			#roadAddrPart2{
			  outline: none;
			  background: rgba(0, 0, 0, 0.1);
			  width: 225px;
			  border: 0;
			  border-radius: 4px;
			  box-sizing: border-box;
			  color: rgba(0, 0, 0, 0.6);
			  font-family: inherit;
			  font-size: inherit;
			  font-weight: 500;
			  line-height: inherit;
			  -webkit-transition: 0.3s ease;
			          transition: 0.3s ease;
			}
			#addrDetail{
			  outline: none;
			  background: rgba(0, 0, 0, 0.1);
			  width: 144px;
			  border: 0;
			  border-radius: 4px;
			  box-sizing: border-box;
			  color: rgba(0, 0, 0, 0.6);
			  font-family: inherit;
			  font-size: inherit;
			  font-weight: 500;
			  line-height: inherit;
			  -webkit-transition: 0.3s ease;
			          transition: 0.3s ease;
			}
		</style>
	</head>
	<body>
				
		<div class="forn">
		  <div class="forn-toggle"></div>
		  <div class="forn-panel one">
		    <div class="forn-header">
		      <h1>Member Join</h1>
		    </div>
		    <div class="forn-content">
		        <div class="forn-groupId">
		          <label for="userId">ID</label><br>
		          <input type="text" id="userId" name="userId" required="required"/>
		          <button id="overlay">중복확인</button>
		       </div>
		       <br>
		        <div class="forn-group">
		          <label for="password">Password</label>
		          <input type="password" id="userPw" name="userPw" required="required"/>
		        </div>
		        <div>
		        	<span id="matchMsg"></span>
		        </div>
		        <div class="forn-group">
		          <label for="password">Password</label>
		          <input type="password" id="pwChk" name="pwChk" required="required"/>
		        </div>
		        <div class="forn-group">
		          <label for="userName">NAME</label>
		          <input type="text" id="userName" name="userName" required="required"/>
		       </div>
		          <label for="gender" id="gen">GENDER</label>
		          <input type="radio" name="gender" class="gender" value="남자" checked/>남자
				  <input type="radio" name="gender" class="gender" value="여자"/>여자&nbsp;
				  <label for="birth" class="birth">Birth</label>
		          <input type="date" id="birth" name="birth" required="required"/>
		       <br><br>
		       <div> 
		          <label for="Email" class="email">Email</label><br>
		          <input type="text" id="email" name="email" required="required"/> @ 
		          <input type="text" id="dotcom"/>
		          <select id="address" onchange="addMail(this)">
                		<option id="direct">직접입력</option> 
                		<option id="google" value="google.com">google.com</option>
                		<option id="naver" value="naver.com">naver.com</option>
                		<option id="daum" value="daum.net">daum.net</option>
                		<option id="nate" value="nate.com">nate.com</option>
                </select>
                </div>
                <div>
                	<span id="Ms"></span>
                </div>
                <br>
		       <div>
		       <label for="phone" class="phone">Phone</label><br>
		       	  <select name="number" id="phone">
	                   	<option value="010">010</option>
	                   	<option value="011">011</option>
	                   	<option value="016">016</option>
	                   	<option value="017">017</option>
	                   	<option value="019">019</option>
	              </select> -
		          <input type="Number" id="fowNum" name="fowNum" required="required"/> -
		          <input type="Number" id="backNum" name="backNum" required="required"/>
		       </div><br>
		       <form name="form" id="form" method="post">
		       <div class="form-group">
		          <label for="Address" class="addr">Address</label><br>
		          <label>우편번호</label>&nbsp;&nbsp;&nbsp;
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly>
						<input type="button"  value="주소검색" onclick="goPopup();"><br>
				  <br><label>도로명주소</label>
						<input type="text" id="roadAddrPart1"><br>
				  <br><label>상세주소</label>&nbsp;&nbsp;&nbsp;
				  		<input type="text" id="roadAddrPart2" value="">
						<input type="text" id="addrDetail" value="">
		       </div>
		       </form>
		        <div class="forn-group">
		          <button type="button" id="regist" onclick="sendit()">회원가입</button>
		          <button type="button" id="regist" onclick="location.href='./'">취소</button>
		        </div>
		    </div>
		  </div>
		  </div>
		</body>
	<script>
		var chkSum = 0;
		var url;
		var data;
		//비밀번호 확인
		$("#pwChk").keyup(function(){
			if($("#userPw").val() != $("#pwChk").val()){
				$("#matchMsg").html("일치 하지 않습니다.");
				$("#matchMsg").css("color","red");
			}else{
				$("#matchMsg").html("일치 합니다.");
				$("#matchMsg").css("color","green");
				chkSum ++;
			}
			if($("#user_pw").val() == "" || $("#pwChk").val()== ""){
				$("#matchMsg").html("");
			}
		});
		$("#email").keyup(function(){
			$("#Ms").html("ID/PW 찾을 때 사용하므로 정확하게 입력하세요!");
			$("#Ms").css("color","blue");
		});
		
		//아이디 확인
		function isEng(str) { 
			for(var i=0;i<str.length;i++){ 
				achar = str.charCodeAt(i); 
			if( achar > 128 ){ 
				return false; 
				} 
			} 
			return true; 
		} 
		
		function sendit() { 
			if(!isEng($("#userId").val())){ 
				alert('ID는 영어와 숫자만 사용할 수 있습니다.');
				$("#userId").val("");
				return false; 
				} 
			return true; 
		} 
		
		$("#user_pw").keyup(function(){
			if($("#user_pw").val() != $("#pwChk").val()){
				$("#matchMsg").html("일치 하지 않습니다.");
				$("#matchMsg").css("color","red");
			}else{
				$("#matchMsg").html("일치 합니다.");
				$("#matchMsg").css("color","green");
				chkSum ++;
			}
			if($("#user_pw").val() == "" || $("#pwChk").val()== ""){
				$("#matchMsg").html("");
			}
		});
		//중복 확인
		$("#overlay").click(function(){
			data ={};
			data.id = $("#userId").val();
			ajaxCall("./rest/overlay",data);
		});
		
		//회원가입
		$("#regist").click(function(){
			data={};
			data.id = $("#userId").val();
			data.pw = $("#userPw").val();
			data.name = $("#userName").val();
			data.gender = $(".gender:checked").val();
			data.birth = $("#birth").val();
			data.email = $("#email").val()+"@"+$("#dotcom").val();
			data.phone = $("#phone").val()+"-"+$("#fowNum").val()+"-"+$("#backNum").val();
			data.fownum = $("#fowNum").val();
			data.backnum = $("#backNum").val();
			data.addr = $("#addrDetail").val();
			data.address = $("#zipNo").val()+"/"+$("#roadAddrPart1").val()+"/"+$("#roadAddrPart2").val()+"/"+$("#addrDetail").val();
			data.con = $("#con").val();
			data.reg = $("#reg").val();
			
			if(data.id ==""){
				alertify.alert("아이디를 다시 입력하세요.");
				return false;
			}else if(data.pw ==""){
				alertify.alert("패스워드를 입력하세요.");
				return false;
			}else if($("#userPw").val()!=$("#pwChk").val()){
				alertify.alert("비밀번호가 일치하지 않습니다.");
				$("#pwChk").val("");
				return false;
			}else if(data.name ==""){
				alertify.alert("이름을 입력하세요.");
				return false;
			}else if(data.birth ==""){
				alertify.alert("생일을 입력하세요.");
				return false;
			}else if($("#email").val()==""||$("#dotcom").val()==""){
				alertify.alert("이메일을  모두 입력하세요.");
				return false;
			}else if(data.fownum ==""){
				alertify.alert("휴대폰 번호를 다 입력하세요.");
				return false;
			}else if(data.backnum ==""){
				alertify.alert("휴대폰 번호를 다 입력하세요.");
				return false;
			}else if(data.addr ==""){
				alertify.alert("주소를 다 입력하세요.");
				return false;
			}
			
			if(chkSum<2){
				alert("중복확인과 비밀번호 확인을 해 주세요!");
			}else{
				ajaxCall("./rest/join", data);
			}			
		});
		
		// 이메일
	    function addMail(elem){
				console.log(elem.value);
				var addr = elem.value;
				if(addr == "직접입력"){
					$("#dotcom").val("");
				}else{
					$("#dotcom").val(addr);
				}
		}
		
		
		//ajax 실행
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./rest/overlay"){
						if(d.use == "Y"){
							chkSum ++;
							alertify.alert("사용 가능한 아이디 입니다.");
						}else{
							alertify.alert("누군가가 사용 하고 있는 아이디 입니다.");
							$("#userId").val("");
						}
					}else{
						if(d.success == 1){
							alert("가입에 성공 하였습니다.");
							location.href="./";
						}else{
							alertify.alert("가입에 실패 하였습니다. 다시 입력 해 주세요!");
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}
		
		// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
		//document.domain = "abc.go.kr";

		function goPopup(){
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		    var pop = window.open("address","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		    
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		/** API 서비스 제공항목 확대 (2017.02) **/
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
								, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.roadAddrPart2.value = roadAddrPart2;
			document.form.addrDetail.value = addrDetail;
			document.form.zipNo.value = zipNo;
		}
		
		
	</script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
  var panelOne = $('.forn-panel.two').height();

  $('.forn-panel.two').not('.forn-panel.two.active').on('click', function(e) {
    e.preventDefault();

    $('.forn-toggle').addClass('visible');
    $('.forn-panel.one').addClass('hidden');
    $('.forn-panel.two').addClass('active');
    $('.forn').animate({
      'height': panelTwo
    }, 200);
  });

  $('.forn-toggle').on('click', function(e) {
    e.preventDefault();
    $(this).removeClass('visible');
    $('.forn-panel.one').removeClass('hidden');
    $('.forn-panel.two').removeClass('active');
    $('.forn').animate({
      'height': panelOne
    }, 200);
  });
});
</script>
</html>