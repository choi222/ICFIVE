<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="icon" href="resources/img/icon.png">
		<style>
			#fileName{
				border : 1px solid black;
				
			}
			img,a{
				pointer-events: none;
				cursor: default;
			}
			body,dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, 
				pre, form, fieldset, input, textarea, p, blockquote, th, td { 
				  padding:0;
				  margin:0;}
				
				fieldset, img {border:0}
				:focus {outline:none}
				
				body,
				input
				{
				  font-family: 'Open Sans', sans-serif;
				  font-size: 16px;
				  color: #4c4c4c;
				}
				
				h1 {
				  font-size: 32px;
				  font-weight: 300;
				  color: #4c4c4c;
				  text-align: center;
				  padding-top: 10px;
				  margin-bottom: 10px;
				}
				
				html{
				  background-color: #ffffff;
				}
				
				.testbox {
				  margin: 20px auto;
				  width: 500px; 
				  height: 800px;
				  -webkit-border-radius: 8px/7px; 
				  -moz-border-radius: 8px/7px; 
				  border-radius: 8px/7px; 
				  background-color: #ebebeb; 
				  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
				  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
				  box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
				  border: solid 1px #cbc9c9;
				}
				
				form{
				  margin: 0 30px;
				}
				hr{
				  color: #a9a9a9;
				  opacity: 0.3;
				}
				
				input[type=text]{ 
				  height: 27px; 
				  -webkit-border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
				  -moz-border-radius: 0px 4px 4px 0px/0px 0px 4px 4px; 
				  border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
				  background-color: #fff; 
				  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
				  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
				  box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
				  border: solid 1px #cbc9c9;
				  margin-top: 13px;
				  padding-left: 10px;
				}
				#update{
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  margin: 10px 8px 20px 0px;
				  display: inline-block;
				  text-decoration: none;
				  width: 200px; height: 27px; 
				  -webkit-border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  border-radius: 5px; 
				  background-color: #3a57af; 
				  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
				  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
				  box-shadow: 0 3px rgba(58,87,175,.75);
				  transition: all 0.1s linear 0s; 
				  top: 0px;
				  position: relative;
				  margin-left: 8px;
				}
				
				#update {
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
				}
				#can{
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  margin: 10px 8px 20px 0px;
				  display: inline-block;
				  text-decoration: none;
				  width: 200px; height: 27px; 
				  -webkit-border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  border-radius: 5px; 
				  background-color: #3a57af; 
				  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
				  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
				  box-shadow: 0 3px rgba(58,87,175,.75);
				  transition: all 0.1s linear 0s; 
				  top: 0px;
				  position: relative;
				  margin-left: 10px;
				}
				
				#can {
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
				}
				#attach{
					text-align: center;
				}
				#file{
					margin-left: 55px;
				}
				#userId{
					width: 220px;
					text-align: center;
					margin-left: 60px;
				}
				#userName{
					margin-left: 33px;
					width:220px;
					text-align: center;
				}
				#birth{
					margin-left: 43px;
					width: 220px;
					text-align: center;
				}
				#email{
					margin-left: 37px;
					width: 120px;
				}
				#dotcom{
					width:100px;
					margin-left: 3px;
				}
				#phone{
					margin-left: 28px;
				}
				#fowNum,#backNum{
					text-align: center;
				}
				#zipNo{
					margin-left: 10px;
				}
				#but{
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  display: inline-block;
				  text-decoration: none;
				  height: 27px; 
				  -webkit-border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  border-radius: 5px; 
				  background-color: #3a57af; 
				  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
				  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
				  box-shadow: 0 3px rgba(58,87,175,.75);
				  transition: all 0.1s linear 0s; 
				  top: 0px;
				  position: relative;
				  margin-left: -2px;
				}
				#but {
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
				}
		</style>
		<title>Insert title here</title>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	<div class="testbox">
			
			  <form id="form" name="form" method="post" action="alter" enctype="multipart/form-data">
			  <h1>My Page</h1>
			  <div id="attach"></div><br>
			  <div id="file"><input type="file" id="file" name="file" onchange="fileView(this)"/></div>
			  <input id="fileName" type="hidden" name="fileName" value=""/><br/>
			  <hr>
			  <div id="use">ID : <input type="text" name="userId" id="userId" value="${sessionScope.loginId}" readonly="readonly"/></div>
			  <div id="use">Name : <input type="text" name="userName" id="userName" value="${up.user_name}" /></div><br>
			  <div id="use">Birth : <input type="date" name="birth" id="birth" value="${up.birth}"/></div>
			  <div id="use">Email : <input type="text" name="email" id="email" value=""/> @ <input type="text" name="dotcom" id="dotcom"/>
                	<select id="address" onchange="addMail(this)">
                		<option id="direct">직접입력</option>
                		<option id="google" value="google.com">google.com</option>
                		<option id="naver" value="naver.com">naver.com</option>
                		<option id="daum" value="daum.net">daum.net</option>
                		<option id="nate" value="nate.com">nate.com</option>
                	</select>
                	</div><br>
			  <div id="use">Phone : <select name="number"  name="phone" id="phone" value="">
                    	<option value="010">010</option>
                    	<option value="011">011</option>
                    	<option value="016">016</option>
                    	<option value="017">017</option>
                    	<option value="019">019</option>
              </select>-
                    
                    <input type="Number" name="fowNum"  style="width : 90px; color: black;" id="fowNum" value=""/>-
           	        <input type="Number" name="backNum" style="width : 90px; color: black;" id="backNum" value=""/></div><br>
			  <div id="use">우편번호 : 
			  <input type="hidden" id="confmKey" name="confmKey" value=""  >
			  <input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
			  <input type="button"  value="주소검색" onclick="goPopup();" id="but"></div><br>
			  <div id="use">도로명 주소 : </div>
			  <input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:85%" value="">
			  <div id="use">상세주소 : </div>
			  <input type="text" id="roadAddrPart2" name="roadAddrPart2"  style="width:280" value="">
			  <input type="text" id="addrDetail" name="addrDetail" style="width:120" value="">
			  <input type="submit" id="update" value="변경"/>
			  <input type="button" id="can" value="취소" onclick="location.href='./detailForm?id=${sessionScope.loginId}'"/>
			  </form>
	</div>
</body>
<script>

	var msg= "${msg}";
	if(msg!=""){
		alert(msg);
	}
	
	var url;
	var data;
	
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
	
    var fileName="${up.filename}";
	var newFileName="${up.newfile}";
	console.log(fileName);
	console.log(newFileName);
	
	//프로필 사진
    function fileView(elem){
		var fullPath = elem.value;
		var fileName = fullPath.substring(12);
		console.log(fileName);		
		$("#fileName").val(fileName);
	}
	
  //파일 및 사진 표시asdasdasd
	if(fileName == null){
		$("#attach").html("<img style='width:150px; height:150px; border-radius:75px; -moz-border-radius:75px; -khtml-border-radius:75px; -webkit-border-radius:75px;' src='resources/img/profile.jpg'>");
	}else{
		var ext = newFileName.substring(newFileName.lastIndexOf(".")+1);
		console.log(ext);
		if(ext=="jpg"||ext=="png"||ext=="gif"){
			var content = "<img style='width:150px; height:150px; border-radius:75px; -moz-border-radius:75px; -khtml-border-radius:75px; -webkit-border-radius:75px;' src='resources/upload/"
				+newFileName+"'/></a>";
		}else{
			var content ="<img style='width:150px; height:150px; border-radius:75px; -moz-border-radius:75px; -khtml-border-radius:75px; -webkit-border-radius:75px;' src='resources/img/profile.jpg'/>";
		}
		$("#attach").append(content);
	}
	
	
	//이메일
	var stremail="${up.email}";
	console.log(stremail);
	var atremail=stremail.split('@');
	$("#email").val(atremail[0]);
	$("#dotcom").val(atremail[1]);
	
	
	//전화번호
	var straddr = "${up.phone}";
	console.log(straddr);
	var atraddr=straddr.split('-');
	console.log(atraddr);
	$("#phone").val(atraddr[0]);
	$("#fowNum").val(atraddr[1]);
	$("#backNum").val(atraddr[2]);
	
	//주소
	var straddress="${up.address}";
	console.log(straddress);
	var atraddress=straddress.split('/');
	console.log(atraddress);
	$("#zipNo").val(atraddress[0]);
	$("#roadAddrPart1").val(atraddress[1]);
	$("#roadAddrPart2").val(atraddress[2]);
	$("#addrDetail").val(atraddress[3]);
	console.log(atraddress[1]);
	console.log(atraddress[2]);
	console.log(atraddress[3]);
	
	
	
	
	/*수정
	$("#update").click(function(){
		data={};
		data.filename=$("#fileName").val();
		data.id = $("#userId").val();
		data.name = $("#userName").val();
		data.birth = $("#birth").val();
		data.email = $("#email").val()+"@"+$("#dotcom").val();
		data.phone = $("#phone").val()+"-"+$("#fowNum").val()+"-"+$("#backNum").val();
		data.fownum = $("#fowNum").val();
		data.backnum = $("#backNum").val();
		data.addr = $("#addrDetail").val();
		data.address = $("#zipNo").val()+"/"+$("#roadAddrPart1").val()+"/"+$("#roadAddrPart2").val()+"/"+$("#addrDetail").val();
		ajaxCall("./rest/alter", data);			
	});
	
	
	function ajaxCall(reqUrl, reqData){
		$.ajax({
			url:reqUrl,
			type:'get',
			dataType:'json',
			data: reqData,
			success:function(d){
				console.log(d);
				if(reqUrl=="./rest/alter"){
					if(d.success == 1){
						alert("수정에 성공하셨습니다.");
						location.href="./detailForm?id=${sessionScope.loginId}";
					}else{
						alert("수정에 실패하셨습니다.");
					}
				}
			},
			error:function(e){
				console.log(e);
			}				
		});			
	}*/
	
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	    var pop = window.open("address","pop","width=300,height=300, scrollbars=yes, resizable=yes"); 
	    
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
	
	function back(){
		history.back();
		
	};
	
</script>
</html>