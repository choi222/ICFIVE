<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	    	<title>Insert title here</title>
	    	<style>
	    		html {
				  width: 100%;
				  height: 100%;
				}
				a{
				text-decoration: none;
				}
				a:VISITED{
					color: black;
				}
				a:link{
					color: black;
				}
				
				body {
				  background-image: url('resources/img/back.jpg');
				  font-family: "Roboto", sans-serif;
				  font-size: 14px;
				  line-height: 1.6em;
				  -webkit-font-smoothing: antialiased;
				  -moz-osx-font-smoothing: grayscale;
				}
				
				.overlay, .form-panel.one:before {
				  position: absolute;
				  top: 0;
				  left: 0;
				  display: none;
				  background: rgba(0, 0, 0, 0.8);
				  width: 100%;
				  height: 100%;
				}
				
				.form {
				  z-index: 15;
				  position: relative;
				  background: #FFFFFF;
				  width: 600px;
				  border-radius: 4px;
				  box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
				  box-sizing: border-box;
				  margin: 100px auto 10px;
				  overflow: hidden;
				}
				.form-toggle {
				  z-index: 10;
				  position: absolute;
				  top: 60px;
				  right: 60px;
				  background: #FFFFFF;
				  width: 60px;
				  height: 60px;
				  border-radius: 100%;
				  -webkit-transform-origin: center;
				      -ms-transform-origin: center;
				          transform-origin: center;
				  -webkit-transform: translate(0, -25%) scale(0);
				      -ms-transform: translate(0, -25%) scale(0);
				          transform: translate(0, -25%) scale(0);
				  opacity: 0;
				  cursor: pointer;
				  -webkit-transition: all 0.3s ease;
				          transition: all 0.3s ease;
				}
				.form-toggle:before, .form-toggle:after {
				  content: '';
				  display: block;
				  position: absolute;
				  top: 50%;
				  left: 50%;
				  width: 30px;
				  height: 4px;
				  background: #4285F4;
				  -webkit-transform: translate(-50%, -50%);
				      -ms-transform: translate(-50%, -50%);
				          transform: translate(-50%, -50%);
				}
				.form-toggle:before {
				  -webkit-transform: translate(-50%, -50%) rotate(45deg);
				      -ms-transform: translate(-50%, -50%) rotate(45deg);
				          transform: translate(-50%, -50%) rotate(45deg);
				}
				.form-toggle:after {
				  -webkit-transform: translate(-50%, -50%) rotate(-45deg);
				      -ms-transform: translate(-50%, -50%) rotate(-45deg);
				          transform: translate(-50%, -50%) rotate(-45deg);
				}
				.form-toggle.visible {
				  -webkit-transform: translate(0, -25%) scale(1);
				      -ms-transform: translate(0, -25%) scale(1);
				          transform: translate(0, -25%) scale(1);
				  opacity: 1;
				}
				.form-group {
				  -webkit-flex-wrap: wrap;
				      -ms-flex-wrap: wrap;
				          flex-wrap: wrap;
				  -webkit-box-pack: justify;
				  -webkit-justify-content: space-between;
				      -ms-flex-pack: justify;
				          justify-content: space-between;
				  margin: 0 0 20px;
				}
				.form-group:last-child {
				  margin: 0;
				}
				.form-group label {
				  display: block;
				  margin: 0 0 10px;
				  color: rgba(0, 0, 0, 0.6);
				  font-size: 12px;
				  font-weight: 500;
				  line-height: 1;
				  text-transform: uppercase;
				  letter-spacing: .2em;
				}
				.form-group input {
				  outline: none;
				  display: block;
				  background: rgba(0, 0, 0, 0.1);
				  width: 100%;
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
				.form-group input:focus {
				  color: rgba(0, 0, 0, 0.8);
				}
				.form-group button {
				  outline: none;
				  background: #4285F4;
				  width: 100%;
				  border: 0;
				  border-radius: 4px;
				  padding: 12px 20px;
				  color: #FFFFFF;
				  font-family: inherit;
				  font-size: inherit;
				  font-weight: 500;
				  line-height: inherit;
				  text-transform: uppercase;
				  cursor: pointer;
				}
				.form-group .form-remember {
				  font-size: 12px;
				  font-weight: 400;
				  letter-spacing: 0;
				  text-transform: none;
				}
				.form-group .form-remember input[type='checkbox'] {
				  display: inline-block;
				  width: auto;
				  margin: 0 10px 0 0;
				}
				.form-panel {
				  padding: 60px calc(5% + 60px) 60px 60px;
				  box-sizing: border-box;
				}
				.form-panel.one:before {
				  content: '';
				  display: block;
				  opacity: 0;
				  visibility: hidden;
				  -webkit-transition: 0.3s ease;
				          transition: 0.3s ease;
				}
				.form-panel.one.hidden:before {
				  display: block;
				  opacity: 1;
				  visibility: visible;
				}
				.form-header {
				  margin: 0 0 40px;
				}
				.form-header h1 {
				  padding: 4px 0;
				  color: #4285F4;
				  font-size: 24px;
				  font-weight: 700;
				  text-transform: uppercase;
				  text-align: center;
				}
				
				.pen-footer {
				  display: -webkit-box;
				  display: -webkit-flex;
				  display: -ms-flexbox;
				  display: flex;
				  -webkit-box-orient: horizontal;
				  -webkit-box-direction: normal;
				  -webkit-flex-direction: row;
				      -ms-flex-direction: row;
				          flex-direction: row;
				  -webkit-box-pack: justify;
				  -webkit-justify-content: space-between;
				      -ms-flex-pack: justify;
				          justify-content: space-between;
				  width: 600px;
				  margin: 20px auto 100px;
				}
				.pen-footer a {
				  color: #FFFFFF;
				  font-size: 12px;
				  text-decoration: none;
				  text-shadow: 1px 2px 0 rgba(0, 0, 0, 0.1);
				}
				.pen-footer a .material-icons {
				  width: 12px;
				  margin: 0 5px;
				  vertical-align: middle;
				  font-size: 12px;
				}
				.form-recovery{
					font-size: 15px;
				}
				
				.cp-fab {
				  background: #FFFFFF !important;
				  color: #4285F4 !important;
				}
				.pop-layer .pop-container {
				  padding: 20px 25px;
				}
				
				.pop-layer p.ctxt {
				  color: #666;
				  line-height: 25px;
				}
				
				.pop-layer .btn-r {
				  width: 100%;
				  margin: 10px 0 20px;
				  text-align: right;
				}
				
				.pop-layer {
				  display: none;
				  position: absolute;
				  top: 50%;
				  left: 40%;
				  width: 410px;
				  height: auto;
				  z-index: 10;
				}
				
				.dim-layer {
				  display: none;
				  position: fixed;
				  _position: absolute;
				  top: 0;
				  left: 0;
				  width: 100%;
				  height: 100%;
				  z-index: 100;
				}
				
				.dim-layer .dimBg {
				  position: absolute;
				  top: 0;
				  left: 0;
				  width: 100%;
				  height: 100%;
				  background: #000;
				  opacity: .5;
				  filter: alpha(opacity=50);
				}
				
				.dim-layer .pop-layer {
				  display: block;
				}
				
				a.btn-layerClose {
				  display: inline-block;
				  height: 25px;
				  padding: 0 14px 0;
				  border: 1px solid #304a8a;
				  background-color: #3f5a9d;
				  font-size: 13px;
				  color: #fff;
				  line-height: 25px;
				}
				
				a.btn-layerClose:hover {
				  border: 1px solid #091940;
				  background-color: #1f326a;
				  color: #fff;
				}
				#atag1{
				position: absolute;
				top:70%;
				left:45%;
				}
	    	</style>
	</head>
	<body>
		<!-- <div class="form">
		  <div class="form-toggle"></div>
		  <div class="form-panel one">
		    <div class="form-header">
		      <h1>PMS Login</h1>
		    </div>
		    <div class="form-content">
		      <form action="login" method="post">
		        <div class="form-group">
		          <label for="username">ID</label>
		          <input type="text" id="userId" name="userId" required="required" placeholder="아이디"/>
		        </div>
		        <div class="form-group">
		          <label for="password">Password</label>
		          <input type="password" id="userPw" name="userPw" required="required" placeholder="비밀번호"/>
		        </div>
		        <div class="form-group">
		          <label class="form-remember">
		            <input type="checkbox"/>Remember Me
		            <a href="IdFind" class="form-recovery" style="margin-left:200px;">ID/PW찾기</a>|<a href="agree" class="form-recovery">회원가입</a>
		          </label>
		        </div>
		        <div class="form-group">
		          <button type="submit" id="login">Log In</button>
		        </div>
		      </form>
		    </div>
		    </div>
		  </div> -->      	 
			<a id="atag1" href="#layer2" class="btn-example"><img src="resources/img/main.jpg" width="200px" height="100px"><br></a>
				<div class="dim-layer">
				    <div class="dimBg"></div>
				    <div id="layer2" class="pop-layer">
				        <div class="pop-container">
				                <!--content //-->
				                <p class="ctxt mb20">
				                     <div class="form">
									  <div class="form-toggle"></div>
									  <div class="form-panel one">
									    <div class="form-header">
									      <h1>PMS Login</h1>
									    </div>
									    <div class="form-content">
									      <form action="login" method="post">
									        <div class="form-group">
									          <label for="username">ID</label>
									          <input type="text" id="userId" name="userId" required="required" placeholder="아이디"/>
									        </div>
									        <div class="form-group">
									          <label for="password">Password</label>
									          <input type="password" id="userPw" name="userPw" required="required" placeholder="비밀번호"/>
									        </div>
									        <div class="form-group">
									          <label class="form-remember">
									            <input type="checkbox"/>Remember Me
									            <a href="IdFind" class="form-recovery" style="margin-left:200px;">ID/PW찾기</a>|<a href="agree" class="form-recovery">회원가입</a>
									          </label>
									        </div>
									        <div class="form-group">
									          <button type="submit" id="login">Log In</button>
									        </div>
									        <div class="form-group" id="can">
									          <button>취소</button>
									        </div>
									      </form>
									    </div>
									    </div>
				                </p>
				            </div>
				        </div>
				    </div>
				</div>
		               
		
	</body> 
	<script>
		var msg="${msg}";
		if(msg!=""){
			alert(msg);
		}
		
		$('.btn-example').click(function(){
	        var $href = $(this).attr('href');
	        layer_popup($href);
	    });
	    function layer_popup(el){

	        var $el = $(el);        //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('#can').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });

	    }
	</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
		$(document).ready(function() {
		  var panelOne = $('.form-panel.two').height(),
		    panelTwo = $('.form-panel.two');
		
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