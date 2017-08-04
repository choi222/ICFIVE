<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel='stylesheet' type='text/css' href='resources/css/theme.css' />
		<link rel='stylesheet' type='text/css' href='resources/css/fullcalendar.css' />
		<script type='text/javascript' src='resources/js/jquery.js'></script>
		<script type='text/javascript' src='resources/js/jquery-ui-custom.js'></script>
		<script type='text/javascript' src='resources/js/fullcalendar.min.js'></script>
		<script type='text/javascript'>
		var objArr = new Array();
	$(document).ready(function() {
		
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$.getList();
		
		//alert(JSON.stringify(obj));
		
		$('#calendar').fullCalendar({
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: false,
			events: objArr/* [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			] */
		});
		
	});
	
	$.extend({
		getList : function() {
			$.ajax({
				url : "./rest/getProjectList",
				type : "get",
				dataType : "json",
				async : false,
				success : function(data) {
					
					$.each(data.resultList, function( idx, result ) {
						var obj = new Object();
						obj.title = result.pro_name;
						
						if(result.daystart != null) {
							obj.start = new Date(result.daystart);
						}
						if(result.dayend != null) {
							obj.end = new Date(result.dayend);
						}
						
						objArr.push(obj);
					});
					console.log(JSON.stringify(objArr));
				},
				error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }

			})
		}
		
	})

</script>	
			<title>Insert title here</title>
		<style type='text/css'>
		
			body {
				margin-top: 40px;
				text-align: center;
				font-size: 13px;
				font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
				}
		
			#calendar {
				width: 900px;
				margin: 0 auto;
				}
		ul ul {
				display: none;
			}
			
				 ul li:hover > ul {
					display: block;
				}
			
			
			 ul {
				background: #efefef; 
				background: linear-gradient(top, #efefef 0%, #bbbbbb 100%);  
				background: -moz-linear-gradient(top, #efefef 0%, #bbbbbb 100%); 
				background: -webkit-linear-gradient(top, #efefef 0%,#bbbbbb 100%); 
				box-shadow: 0px 0px 9px rgba(0,0,0,0.15);
				padding: 0 20px;
				border-radius: 10px;  
				list-style: none;
				position: relative;
				display: inline-table;
			}
				 ul:after {
					content: ""; clear: both; display: block;
				}
			
				 ul li {
					float: left;
				}
					 ul li:hover {
						background: #4b545f;
						background: linear-gradient(top, #4f5964 0%, #5f6975 40%);
						background: -moz-linear-gradient(top, #4f5964 0%, #5f6975 40%);
						background: -webkit-linear-gradient(top, #4f5964 0%,#5f6975 40%);
					}
						 ul li:hover a {
							color: #fff;
						}
					
					 ul li a {
						display: block; padding: 25px 40px;
						color: #757575; text-decoration: none;
					}
						
					
				 ul ul {
					background: #5f6975; border-radius: 0px; padding: 0;
					position: absolute; top: 100%;
				}
					 ul ul li {
						float: none; 
						border-top: 1px solid #6b727c;
						border-bottom: 1px solid #575f6a; position: relative;
					}
						 ul ul li a {
							padding: 15px 40px;
							color: #fff;
						}	
							 ul ul li a:hover {
								background: #4b545f;
							}
					
				 ul ul ul {
					position: absolute; left: 100%; top:0;
				}
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
   			<ul>
				<li><a href="index">메인</a></li>
				<li><a href="./detailForm?id=${sessionScope.loginId}">내정보</a></li>
				<li><a href="/main/outputlist?userId=${sessionScope.loginId}">내 프로젝트</a></li>
				<li><a href="/main/outputboard">산출물게시판</a></li>
				<li><a href="/main/pro_writeForm?userId=${sessionScope.loginId}">프로젝트 등록</a></li>
				<li><a href="./calendar">달력 일정</a></li>
			</ul><br>
		<div id='calendar'></div>
	</body>
	<script></script>
</html>