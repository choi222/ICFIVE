<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="resources/css/default.css">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script src="resources/js/simpleBanner.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link href="resources/css/bootstrapsmall.min.css?ver=1" rel="stylesheet" />
    
    <title>Insert title here</title>
    <style>
		
		 a:link { color: black; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
 		a:hover { color: blue; text-decoration: underline;}


		#contents_area {overflow:hidden; position:relative; width:1200px; margin:0 auto; z-index:90; padding-bottom:40px;}
		.visual_wrap {float:left; width:800px; height:438px;} /*대문이미지*/
		
		.visual_wrap .bxslider {width:648px; height:438px;}
		.visual_wrap .bxslider > li.slider01 {position:relative; width:648px; height:438px; background:url(resources/img/visual_bg01.jpg) no-repeat;} 
		.visual_wrap .bxslider > li > p {position:absolute; width:260px; top:0; left:330px;}
		.visual_wrap .bxslider > li > p > .logo {margin-top:40px;} /*20160831수정*/
		.visual_wrap .bxslider > li > p > .tit {margin-top:20px; font-size:16px; color:#222; line-height:24px; font-weight:700;} /*20160831수정*/
		.visual_wrap .bxslider > li > p > .cont {margin-top:5px; font-size:13px; color:#63646b; line-height:22px;} /*20160831수정*/
		.visual_wrap .bxslider > li > ul.link_menu {position:absolute; top:350px; left:55px;}
		.visual_wrap .bxslider > li > ul.link_menu > li {float:left; margin-left:30px;}
		.visual_wrap .bxslider > li > ul.link_menu > li:first-child {margin-left:0px;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a {text-decoration:none;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a.icon01 {background:url(resources/img/visual_icon01-1.png) no-repeat; padding-left:55px; height:43px;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a.icon02 {background:url(resources/img/visual_icon01-2.png) no-repeat; padding-left:55px; height:43px;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a.icon03 {background:url(resources/img/visual_icon01-3.png) no-repeat; padding-left:55px; height:43px;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a > .tit01 {display:inline-block; padding-right:10px; font-size:15px; color:#222; font-weight:700; line-height:22px; background:url(resources/img/icon_arrow03.png) no-repeat right center;}/*20160831수정*/
		.visual_wrap .bxslider > li > ul.link_menu > li > a > .tit02 {display:block;  font-size:12px; color:#63646b; line-height:20px; letter-spacing:-1px;}/*20160831수정*/
		.visual_wrap .bxslider > li.slider02 {position:relative; width:648px; height:438px; background:url(resources/img/visual_bg02.jpg) no-repeat;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > p > .logo {margin-top:55px;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > p > .tit {margin-top:15px; font-size:16px; color:#222; line-height:24px; font-weight:700;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > p > .cont {margin-top:5px; font-size:13px; color:#63686b; line-height:22px;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a.icon01 {background:url(resources/img/visual_icon02-1.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a.icon02 {background:url(resources/img/visual_icon02-2.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a.icon03 {background:url(resources/img/visual_icon02-3.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a > .tit01 {display:inline-block; padding-right:10px; font-size:15px; color:#222; font-weight:700; line-height:22px; background:url(resources/imgn/icon_arrow03.png) no-repeat right center;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a > .tit02 {display:block;  font-size:12px; color:#63696b; line-height:20px; letter-spacing:-1px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 {position:relative; width:648px; height:438px; background:url(resources/img/visual_bg03.jpg) no-repeat;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > p > .logo {margin-top:95px;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > p > .tit {margin-top:15px; font-size:16px; color:#222; line-height:24px; font-weight:700;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > p > .cont {margin-top:5px; font-size:13px; color:#6b6364; line-height:22px;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a.icon01 {background:url(resources/img/visual_icon03-1.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a.icon02 {background:urlresources/img/visual_icon03-2.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a.icon03 {background:url(resources/img/visual_icon03-3.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a > .tit01 {display:inline-block; padding-right:10px; font-size:15px; color:#222; font-weight:700; line-height:22px; background:url(resources/img/icon_arrow03.png) no-repeat right center;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a > .tit02 {display:block;  font-size:12px; color:#6b6363; line-height:20px; letter-spacing:-1px;}/*20160831추가*/
		
		
		/*main visual slider*/
		#bx-pager {position:absolute; z-index:10; top:0; left:0;}
		#bx-pager > a.visual_tab01 {width:170px; height:146px; background:url(resources/img/visual_tab01_off.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		#bx-pager > a.visual_tab01.active {background:url(resources/img/visual_tab01_on.png) no-repeat;}
		#bx-pager > a.visual_tab02 {width:170px; height:146px; background:url(resources/img/visual_tab02_off.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		#bx-pager > a.visual_tab02.active {background:url(resources/img/visual_tab02_on.png) no-repeat;}
		#bx-pager > a.visual_tab03 {width:170px; height:146px; background:url(resources/img/visual_tab03_off.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		#bx-pager > a.visual_tab03.active {background:url(resources/img/visual_tab03_on.png) no-repeat;}
		
		
		
		
		.visual_wrap .bx-wrapper {position:relative;}
		.visual_wrap .bx-wrapper .bx-controls {position:absolute; top:40px; left:540px;}/*20160831수정*/
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-direction {position:relative;}/*20160831수정*/
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-direction .bx-prev {position:absolute; top:0; left:24px; width:22px; height:22px; background:url(resources/img/btn_prev.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}/*20160831추가*/
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-direction .bx-next {position:absolute; top:0; left:46px; width:22px; height:22px; background:url(resources/img/btn_next.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}/*20160831추가*/
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-auto {position:relative;}
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-auto-item .bx-start {position:absolute; top:0; display:none; width:24px; height:24px; background:url(resources/img/btn_play.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-auto-item .bx-stop {position:absolute; top:0; display:block; width:24px; height:24px; background:url(resources/img/btn_stop.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		
		/*project track*/
		.project_wrap {position:relative; float:left; display:inline-block; width:398px; height:438px; background:white; border-right:1px solid #d2ddf0; border-bottom:1px solid #d2ddf0;} /*20160923수정*/
		.project_wrap > h2 {margin-top:45px; margin-left:35px; font-size: 17px; color: black; font-weight: bold;}
		.project_wrap > ul {margin-top:25px; margin-left:35px; width:333px;}
		.project_wrap > ul > li {overflow:hidden; margin-bottom:9px; .margin-bottom:5px;}    
		.project_wrap > ul > li > a {float:left; width:225px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;}
		.project_wrap > ul > li > a.project01 {float:left; background:url(resources/img/icon_project01.png) no-repeat left center; line-height:30px; padding-left:20px; font-size:13px; color:#222;}
		.project_wrap > ul > li > a.project02 {float:left; background:url(resources/img/icon_project02.png) no-repeat left center; line-height:30px; padding-left:20px; font-size:13px; color:#222;}
		.project_wrap > ul > li > a.project03 {float:left; background:url(resources/img/icon_project03.png) no-repeat left center; line-height:30px; padding-left:20px; font-size:13px; color:#222;}
		.project_wrap > ul > li > a.project04 {float:left; background:url(resources/img/icon_project04.png) no-repeat left center; line-height:30px; padding-left:20px; font-size:13px; color:#222;} /*20161228추가*/
		.project_wrap > ul > li > span.statue01 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue01.png) no-repeat left 55%; padding-left:20px; line-height:30px;}
		/* .project_wrap > ul > li > span.statue02 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue02.png) no-repeat left 55%; padding-left:20px; line-height:30px;} */
		.project_wrap > ul > li > span.statue03 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue03.png) no-repeat left 55%; padding-left:20px; line-height:30px;}
		/* .project_wrap > ul > li > span.statue04 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue04.png) no-repeat left 55%; padding-left:20px; line-height:30px;} */
		/* .project_wrap > ul > li > span.statue05 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue05.png) no-repeat left 55%; padding-left:20px; line-height:30px;} */
		.project_wrap .more {position:absolute; top:40px; right:20px;}
		
		/*hanium award*/
		.award_wrap {position:relative; float:left; width:379px; height:273px; margin-top:33px;}
		.award_wrap > h2 {margin-left:58px; margin-top:2px;}
		.award_wrap .award_box_wrap {display:inline-block; zoom:1; .display:inline; margin-top:13px; width:377px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.award_wrap .award_box_wrap .award_box {width:311px; height:170px; margin:35px auto;}
		.award_wrap .award_box_wrap .award_box .bxslider02 {width:311px; height:180px;}
		.award_wrap .award_box_wrap .award_box .bxslider02 > li {width:311px; height:180px;}
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .photo {float:left; border:1px solid #e0e0e0;} /*20161219수정*/
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .photo > img {width:141px; height:94px;}
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .tit_box {display:inline-block; margin-left:17px; width:148px; zoom:1; .display:inline;}
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .tit_box > .headline {display:inline-block; margin-top:4px;} /*20161229수정*/
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .tit_box > a >.tit {display:inline-block; font-size:16px; font-weight:700; line-height:22px; color:#222; margin-top:10px; letter-spacing:-1px\9;
		    width: 148px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: normal;
		    height: 4em;
		    text-align: left;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;
		    -webkit-box-orient: vertical;} /*20161229수정*/
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > .cont {clear:both; display:block; font-size:13px; color:#666; line-height:20px; padding-top:15px; .padding-top:10px;
			width: 311px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: normal;
		    height: 4.4em;
		    text-align: left;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;
		    -webkit-box-orient: vertical;
		} /*20161229수정*/
		.award_wrap > p.icon {position:absolute; top:0; left:0;}
		.award_wrap > .more {position:absolute; top:0; right:0px;}
		
		.award_box .bx-wrapper .bx-controls .bx-pager {display:none;}
		
		.award_wrap .bx-controls-direction {position:absolute; top:0; left:309px;}
		.award_wrap .bx-controls-direction .bx-prev {width:23px; height:24px; background:url(resources/img/btn_arrow_left.gif) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		.award_wrap .bx-controls-direction .bx-next {width:23px; height:24px; background:url(resources/img/btn_arrow_right.gif) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		
		/*quick menu*/
		.quickMenu_wrap {position:relative; float:left; width:379px; height:273px; margin-top:33px; margin-left:14px;}
		.quickMenu_wrap > h2 {margin-left:10px; margin-top:2px;}
		.quickMenu_wrap .quickMenu_box {display:inline-block; zoom:1; .display:inline; margin-top:9px; .margin-top:10px; width:377px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.quickMenu_wrap .quickMenu_box > ul {width:310px; margin-left:40px; margin-top:40px;}
		.quickMenu_wrap .quickMenu_box > ul > li {float:left; width:155px; margin-bottom:30px;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick01 {height:32px; padding-left:40px; background:url(resources/img/icon_quick01.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick02 {height:32px; padding-left:40px; background:url(resources/img/icon_quick02.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick03 {height:32px; padding-left:40px; background:url(resources/img/icon_quick03.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick04 {height:32px; padding-left:40px; background:url(resources/img/icon_quick04.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick05 {height:32px; padding-left:40px; background:url(resources/img/icon_quick05.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick06 {height:32px; padding-left:40px; background:url(resources/img/icon_quick06.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a > span {padding-right:15px; font-size:14px; color:#222; line-height:32px; letter-spacing:-1px; background:url(resources/img/icon_arrow04.png) no-repeat right center;}
		
		/*popup zone*/
		.popup_wrap {position:relative; float:left; width:396px; height:277px; margin-top:30px; margin-left:20px;}
		.popup_wrap > h2 {margin-left:11px; margin-top:2px; font-size:18px; font-weight:900; color:#2E2E2E;}
		.popup_wrap .popup_box_wrap {display:inline-block; zoom:1; .display:inline; margin-top:9px; width:390px; height:241px; background:white; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.popup_wrap .popup_box_wrap .popup_box {width:390px; height:241px;}
		.popup_wrap .popup_box_wrap .popup_box .bxslider03 {width:390px; height:180px;}
		
		.popup_wrap .bx-wrapper .bx-controls {position:absolute; top:3px; right:30px;} /*20161229추가*/
		.popup_wrap .bx-wrapper .bx-controls .bx-controls-direction {display:none;}
		.popup_wrap .bx-wrapper .bx-controls .bx-pager {float:left; margin-right:5px; margin-top:2px;} /*20161229수정*/
		.popup_wrap .bx-wrapper .bx-controls .bx-pager .bx-pager-item a {width:12px; height:12px; background:url(resources/img/popup_pager_off.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		.popup_wrap .bx-wrapper .bx-controls .bx-pager .bx-pager-item {display:inline-block; margin-right:3px; zoom:1; .display:inline;}
		.popup_wrap .bx-wrapper .bx-controls .bx-pager .bx-pager-item a.active { background:url(resources/img/popup_pager_on.png) no-repeat;}
		
		.popup_wrap .bx-wrapper .bx-controls .bx-controls-auto {float:left;}/*20161229수정*/
		.popup_wrap .bx-wrapper .bx-controls .bx-controls-auto .bx-controls-auto-item a.bx-start {display:none; width:16px; height:16px; background:url(resources/img/popup_play.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		.popup_wrap .bx-wrapper .bx-controls .bx-controls-auto .bx-controls-auto-item a.bx-stop {width:16px; height:16px; background:url(resources/img/popup_stop.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		
		/*notice*/
		.notice_wrap {position:relative; float:left; width:379px; height:273px; margin-top:33px;}
		.notice_wrap > h2 {margin-left:10px; margin-top:2px;}
		.notice_wrap .notice_box {display:inline-block; zoom:1; .display:inline; margin-top:13px; width:377px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.notice_wrap .notice_box > ul {width:300px; margin:25px auto;}
		.notice_wrap .notice_box > ul > li {font-size:13px; color:#222; line-height:31px;}
		.notice_wrap .notice_box > ul > li > a {float:left; width:240px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; padding-left:25px; background:url(resources/img/icon_dot.png) no-repeat 15px center;}
		.notice_wrap .notice_box > ul > li > a.new { padding-left:25px; background:url(resources/img/icon_new.png) no-repeat left center;}
		.notice_wrap > .more {position:absolute; top:0; right:0px;}
		
		/*공지사항*/
		.knowledge_wrap {position:relative; float:left; width:379px; height:273px; margin-top:33px;}
		.knowledge_wrap > h2 {margin-left:10px; margin-top:2px;}
		.knowledge_wrap .knowledge_box {display:inline-block; zoom:1; .display:inline; margin-top:10px; .margin-top:11px;  width:379px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.knowledge_wrap .knowledge_box > ul {width:300px; margin:25px auto;}
		.knowledge_wrap .knowledge_box > ul > li {font-size:13px; color:#222; line-height:31px;}
		.knowledge_wrap .knowledge_box > ul > li > a {float:left; max-width:235px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; padding-left:20px; background:url(resources/img/icon_dot.png) no-repeat 15px center;}
		.knowledge_wrap .knowledge_box > ul > li > .dat {display:inline; color:#353b4f; font-weight:700; margin-left:5px;}
		.knowledge_wrap .knowledge_box > ul > li > .dat > a {text-decoration:none;}
		.knowledge_wrap > .more {position:absolute; top:0; right:0px;}
		
		/*지식Q&A*/
		.knowledge_wrap2 {position:relative; float:left; width:379px; height:273px; margin-top:33px; margin-left:25px;}
		.knowledge_wrap2 > h2 {margin-left:10px; margin-top:2px;}
		.knowledge_wrap2 .knowledge_box {display:inline-block; zoom:1; .display:inline; margin-top:10px; .margin-top:11px;  width:379px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.knowledge_wrap2 .knowledge_box > ul {width:300px; margin:25px auto;}
		.knowledge_wrap2 .knowledge_box > ul > li {font-size:13px; color:#222; line-height:31px;}
		.knowledge_wrap2 .knowledge_box > ul > li > a {float:left; max-width:235px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; padding-left:20px; background:url(resources/img/icon_dot.png) no-repeat 15px center;}
		.knowledge_wrap2 .knowledge_box > ul > li > .dat {display:inline; color:#353b4f; font-weight:700; margin-left:5px;}
		.knowledge_wrap2 .knowledge_box > ul > li > .dat > a {text-decoration:none;}
		.knowledge_wrap2 > .more {position:absolute; top:0; right:0px;}
		
		
		
		/*프로보노 지식강연*/
		.probono_wrap {position:relative; float:left; width:358px; height:273px; margin-top:33px; margin-left:69px;}
		.probono_wrap > h2 {margin-top:2px;}
		.probono_wrap .probono_box {display:inline-block; zoom:1; .display:inline; margin-top:10px; .margin-top:11px;  width:358px; height:241px;}
		.probono_wrap .probono_box > ul {margin-top:15px;}
		.probono_wrap .probono_box > ul > li {font-size:13px; color:#222; line-height:20px;}
		.probono_wrap .probono_box > ul > li > a {float:left; max-width:235px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; color:#333333; padding-left:20px; background:url(resources/img/icon_dot.png) no-repeat 10px center;}
		.probono_wrap .probono_box > ul > li > .date {float:right; color:#888; font-size:12px;}
		.probono_wrap > .more {position:absolute; top:0; right:0px;}
		
		/*하단배너*/
		.simple_banner_wrap{ position:relative; overflow:hidden; width:100%; height:87%; margin-top:16px; }
		.simple_banner_wrap ul{ list-style:none; margin:0; padding:0; display:block; position:absolute; left:0; top:0; width:100%; height:100%; }
		.simple_banner_wrap ul li{ margin:0; padding:0; display:block; position:absolute; top:0; left:0; width:100%; height:100%; }
		.simple_banner_wrap .nav_wrap{ position:absolute; bottom:10px; height:10px; z-index:2; }
		.simple_banner_wrap .nav_wrap ul{ display:block; position:relative; list-style:none; margin:0; padding:0; }
		.simple_banner_wrap .nav_wrap ul li{ display:inline-block; position:relative; width:10px; height:10px; margin:0 1px; cursor:pointer; }
		.simple_banner_wrap .nav_wrap.numeral{ height:14px; line-height:14px; }
		.simple_banner_wrap .nav_wrap.numeral ul li{ font-size:12px; width:14px; height:14px; text-align:center; text-shadow:1px 1px 0px #CCC; }
		.simple_banner_wrap .nav_wrap.numeral ul li.on{ text-decoration:underline; font-weight:bold; }
		.simple_banner_wrap .nav_wrap.bullet{ height:10px; line-height:10px; }
		.simple_banner_wrap .nav_wrap.bullet ul li{ font-size:10px; text-indent:-1000px; margin-left:4px; border-radius:5px; background-color:#F96; box-shadow:inset 0 0 0 1px #FFF; }
		.simple_banner_wrap .nav_wrap.bullet ul li.on{ box-shadow:inset 0 0 0 1px #F96; background-color:#FFF; }
		.simple_banner_wrap .nav_wrap.prev_next{ height:14px; line-height:14px; text-shadow:1px 1px 0px #CCC; }
		.simple_banner_wrap .nav_wrap.prev_next ul li{ font-size:12px; width:14px; height:14px; font-weight:bold; text-align:center; }
		
		
		
		/* footer */
		#main_footer_wrap{position:relative; width:100%;}
		#main_footer_wrap .quick_wrap {position:relative; width:100%; height:54px; border-top:1px solid #4c4e55; border-bottom:1px solid #4c4e55; background-color:#4c4e55;}
		#main_footer_wrap .quick_wrap .quick_box {position:relative; width:1100px; height:54px; margin:0 auto; text-align:center;}
		#main_footer_wrap .quick_wrap .quick_box ul {display:inline-block; margin-top:20px; overflow:hidden; .width:475px;}
		#main_footer_wrap .quick_wrap .quick_box ul li {float:left; padding-right:30px; padding-left:30px; background:url(../images/main/foot_quick_line.png) no-repeat right center;}
		#main_footer_wrap .quick_wrap .quick_box ul li.none {background:none;}
		#main_footer_wrap .quick_wrap .quick_box ul li a {font-size:13px; color:#fff; text-decoration:none;}
		#main_footer_wrap .btn_top {position:absolute; left:50%; margin-left:537px; top:0;}
		#main_footer_wrap .address_wrap {padding:30px 0 40px 0; text-align:center;}
		#main_footer_wrap .address_wrap address {color:#555; font-size:13px; margin-bottom:7px;}
		#main_footer_wrap .address_wrap .copyright {color:#555; font-size:13px;}
		
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
				#div1{
					float: right;
					margin-top: 35px;
					margin-right: 35px;
					background-color:#FFFFFF;
					background-position:left top;
					background-repeat:no-repeat;
					border:1px #AAAAAA solid;
					padding-top:5px;
					font-family:tahoma;
					font-size:12px;
					color:#777777;
					border: white;
					border-bottom:1px solid #AAAAAA;
					border-top:1px solid #AAAAAA;
					font-size: 18px;
					
				}
				#div2{
					background-color:#FFFFFF;
					background-position:left top;
					background-repeat:no-repeat;
					border:1px #AAAAAA solid;
					padding-top:5px;
					font-family:tahoma;
					font-size:12px;
					color:#777777;
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
				<li><a href="./calendar">달력 일정</a></li><form action="logout">
			</ul><div id="div1">반갑습니다. ${sessionScope.Name}님 <input id ="div2" type="submit" value="로그아웃"/></div></form>
    	<section id="containerWrap_main">		
		<div id="contents_area">
		
			<div style="overflow:hidden;">
				<!-- <div id="bx-pager">
				
				  <a class="visual_tab01" href="#"><span></span></a><br>
				  <a class="visual_tab02" href="#"><span></span></a><br>
				  <a class="visual_tab03" href="#"><span></span></a> 
				 
				</div> -->
				
					<div class="visual_wrap">
						<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
						<!-- 프로젝트 총 갯수 -->
						<div style="float:left;width:50%;height:50%;background-Color:#F2FFFF">
							<div style="float:left;width:50%;height:50%;background-Color:#F2FFFF">
								<img src="resources/img/projectcount.jpg" style="width: 400px; height: 109.5px;"/>
								<div style="padding:5px;margin-left: 50%;">
									<input type="text" id="countpro" style="background-color:transparent;border:0 solid black;text-align:center;">
								</div> 
							</div>
						</div>
						
						<!-- 산출물 총 갯수 --> 
						<div style="clear:right;float:right;width:50%;height:50%;background-Color:#FFF2FF">
							<div style="float:left;width:50%;height:50%;background-Color:#FFF2FF">
								<img src="resources/img/outputcount.jpg" style="width: 400px; height: 109.5px;"/>
								<div style="padding:5px;margin-left: 50%;">
									<input type="text" id="sancount" style="background-color:transparent;border:0 solid black;text-align:center;">
								</div> 
							</div>
						</div>
						 <!-- 간략한 달력 -->
						<div style="float:left;width:50%;height:50%;background-Color:#FFFFF2">
							<div style="float:left;width:50%;height:50%;background-Color:#FFFFF2">
								<img src="resources/img/reportcount.jpg" style="width: 400px; height: 109.5px;"/>
								<div style="padding:5px;margin-left: 50%;">
									
								</div> 
							</div>
						</div>
						 
						<div style="clear:right;float:right;width:50%;height:50%;background-Color:#EFEFEF">
							<img src="resources/img/main.jpg" style="width:400px;height: 219px; "/>
							<div style="padding:5px;margin-left: 50%;">
									
								</div> 
							
						</div>
						
						<div>
						</div>
					</div>
				</div>
				
				<div class="project_wrap">
					<h2>프로젝트 목록</h2>
					<table id="my">
						<!-- <tr>
							<td>제목</td>
						</tr> -->
					</table>
				</div>
			</div>
			
			<div class="knowledge_wrap">
				<h2>총 진행률 차트</h2>
				<!-- <div class="knowledge_box"> -->
					
						 <div id="piechart" style="width: 379px; height: 243px;"></div>
					
				<!-- </div> -->
			</div>

			<div class="knowledge_wrap2">
				<h2>산출물 게시판</h2>
				<div class="knowledge_box">
					<table id="qnaZone">
						<tr>
							<td>
								제목
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="knowledge_wrap2">
				<h2>웹 채팅 서버</h2>
				<div class="knowledge_box">
				
					<a href="http://52.78.109.158:7778/" target=_blank><img src="resources/img/chat.jpg" style="width: 381px; height: 243px;"/></a>
				
					<!-- <tbody id="qnaZone">
						
					</tbody> -->
				</div>
			</div>
			
		</div>
	</section>
	
	<footer id="main_footer_wrap">
		<div class="address_wrap">
		<jsp:include page="header.jsp"/>
			<p class="copyright"></p>
		</div>
	</footer>
    </body>
    <script>
  
 
    var url;
    var data={};
    var san={};
    var all;
	var finish;
	var unfinish;
	var countsan;
    $(document).ready(function(){
    	data={};
    	ajaxCall("./rest/san",data);
    	data.id = "${sessionScope.loginId}";
    	ajaxCall("./rest/my",data);
    	data.id = "${sessionScope.loginId}";
    	ajaxCall("./rest/dashchart",data);
    	ajaxCall("./rest/countsan",data);
    	data.id = "${sessionScope.loginId}";
    	ajaxCall("./rest/countpro",data);
    });
    
  
    function ajaxCall(reqUrl,reqData){
		$.ajax({
			url:reqUrl,
			data:reqData,
			dataType:'json',
			success:function(d){
				console.log(d);
				if(reqUrl=="./rest/san"){
					sanDraw(d.san);
				}
				if(reqUrl=="./rest/my"){
					myDraw(d.my);
				}
				if(reqUrl=="./rest/dashchart"){
					all = d.all;//완료
					finish = d.finish;
					unfinish = all-finish;//미완료
					google.charts.setOnLoadCallback(drawChart);
				}
				if(reqUrl=="./rest/countsan"){
					$("#sancount").val(d.countsan);
				}	
				if(reqUrl=="./rest/countpro"){
					$("#countpro").val(d.countpro);
				}	
			
			},
			error:function(e){
				console.log(e)
			}
		});
	}
    
     function sanDraw(san){
		/* $("#qnaZone").empty(); */
		var content="";
		san.forEach(function(item,index){
			content+="<tr>"
			+"<td>"
			+"▶  "
			+"<a href='./outputdetail?idx="+item.seq+"'>"
			+item.subject+"</a>"
			+"</td>"
			+"</tr>"
		});
		$("#qnaZone").append(content);
	} 
     
     function myDraw(my){
 		/* $("#qnaZone").empty(); */
 		var content="";
 		my.forEach(function(item,index){
 			content+="<tr>"
 			+"<td>"
 			+"▶  "
 			+"<a href='./detail?pro_name="+item.pro_name+"'>"
 			+item.pro_name+"</a>"
 			+"</td>"
 			+"</tr>"
 		});
 		$("#my").append(content);
 	} 
     google.charts.load('current', {'packages':['corechart']});
     function drawChart() {

         var data = google.visualization.arrayToDataTable([
           ['Task', 'Hours per Day'],
           ['완료',     finish],
           ['진행중',      unfinish],
         ]);

         var options = {
           title: '전체 프로젝트 진행도'
         };

         var chart = new google.visualization.PieChart(document.getElementById('piechart'));

         chart.draw(data, options);
       }
    </script>
</html>