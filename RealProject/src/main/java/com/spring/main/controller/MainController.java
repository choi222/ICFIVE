package com.spring.main.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardInterface;
import com.spring.main.service.BoardService;

@Controller("MainController")
public class MainController {
	
	@Autowired BoardService service;
	@Autowired private JavaMailSender mailSender;
	@Autowired SqlSession sqlSession;
	BoardInterface inter;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//회원가입 폼으로 이동
	@RequestMapping(value = "/joinForm")
	public String joinForm() {
		logger.info("회원가입 폼");		
		return "joinForm";
	}
	//회원가입 동의폼으로 이동
	@RequestMapping(value = "/agree")
	public String agree() {
		logger.info("회원가입 동의 폼");		
		return "agree";
	}
	//로그인
	@RequestMapping(value = "/login")
	public ModelAndView login(
			@RequestParam Map<String,Object> params,
			HttpSession  session) {
		logger.info("로그인");	
		params.put("session", session);		
		return service.login(params);
	}	
	
	//인덱스 페이지 이동
	@RequestMapping(value = "/index")
	public String index() {
		logger.info("인덱스 페이지 이동");		
		return "index";
	}
	
	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");		
		session.removeAttribute("loginId");
		return "redirect:/";
	}
	//비밀번호찾기 폼으로 이동
		@RequestMapping(value = "/mailForm")
			public String mailForm() {
				logger.info("메일보내기 폼");		
				return "mailForm";
		}
		
		//아이디찾기 폼으로 이동
		@RequestMapping(value = "/IdFind")
			public String IdFind() {
				logger.info("아이디찾기 폼");		
				return "IdFind";
		}
		
		// mailSending 코드
		@RequestMapping(value = "/mailSending")
			 public String mailSending(HttpServletRequest request){

			    String setfrom = "victorehko123@gmail.com";         
			    String id   = request.getParameter("userId");      // 아이디
			    String name = request.getParameter("userName");   // 이름
			    String birth = request.getParameter("birth");    // 생일
			    String tomail  = request.getParameter("tomail");// 받는 사람 이메일
			    int pw = 123456;
			    System.out.println(id+"/"+name+"/"+birth+"/"+tomail+"/"+pw);
			    try {
			      MimeMessage message = mailSender.createMimeMessage();
			      MimeMessageHelper messageHelper 
			                        = new MimeMessageHelper(message, true, "UTF-8");
			 
			      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			      messageHelper.setTo(tomail);     // 받는사람 이메일
			      messageHelper.setSubject(id+"님 비밀번호 찾기 메일입니다."); // 메일제목은 생략이 가능하다
			      messageHelper.setText("임시비밀번호는 입니다.");  // 메일 내용
			     
			      mailSender.send(message);
			    } catch(Exception e){
			      System.out.println(e);
			    }
			   
			    return inter.mailSending(id, name, birth, tomail);
			  }
		
			//회원 정보 상세보기 폼 이동
			@RequestMapping(value = "/detailForm")
			public ModelAndView detailForm(@RequestParam("id")String id) {
				logger.info("회원정보 폼으로 이동");		
				return service.detailForm(id);
			}
			
			//회원정보 수정페이지 이동
			@RequestMapping(value="/alterForm")
			public ModelAndView alterForm(@RequestParam("id")String id){
				logger.info("수정보기");
				return service.alterForm(id);
			}
			
			//프로필 수정
			@RequestMapping(value="/alter")
			public ModelAndView alter(MultipartHttpServletRequest multi){
				logger.info("프로필 수정 실행");
				return service.alter(multi);
			}
			
			//탈퇴 페이지 이동
			@RequestMapping(value = "/memberdelete")
			public ModelAndView memberdelete(@RequestParam("id") String id){
				logger.info("회원 탈퇴 페이지 이동");		
				return service.memberdelete(id);
			}
			
			//회원 탈퇴
			@RequestMapping(value = "/delete")
			public ModelAndView delete(
					@RequestParam Map<String,Object> params,
					HttpSession  session) {
				logger.info("회원탈퇴");
				params.put("session", session);		
				return service.delete(params);
			}
			
			//닫기 페이지 이동
			@RequestMapping(value = "/close")
			public String close() {
				logger.info("닫기 폼이동");		
				return "close";
			}
			//비밀번호 변경 페이지 이동
			@RequestMapping(value = "/pwmodify")
			public ModelAndView pwmodify(@RequestParam("id") String id){
				logger.info("비밀번호 변경페이지 이동");		
				return service.pwmodify(id);
			}
			
			/*//비밀번호 수정하기
			@RequestMapping(value = "/modify")
			public ModelAndView modify(
					@RequestParam Map<String,Object> params,
					HttpSession  session) {
				logger.info("비밀번호 수정");
				params.put("session", session);		
				return service.modify(params);
			}*/
			
				
			//주소 업로드 폼으로 이동
				@RequestMapping(value = "/address")
				public String address() {
					logger.info("주소 업로드 페이지 이동");		
					return "address";
				}
	//상세보기
	@RequestMapping(value="/detail")
	public ModelAndView detail(@RequestParam("pro_name") String proName){
		logger.info("상세보기 요청");
		return service.detail(proName);		
	}	
	
	//리스트 폼으로 가기
	@RequestMapping(value="/list")
	public ModelAndView list(@RequestParam("userId") String userId){
		
		logger.info("리스트호출");
		
		return service.list(userId);
	}
	
	//새프로젝트 만들기 폼 으로 이동
	@RequestMapping(value = "/pro_writeForm")
	public ModelAndView pro_writeForm(@RequestParam ("userId") String userId) {
		logger.info("새프로젝트 만들기 폼 으로 이동");		
		return service.pro_writeForm(userId);
	}
	
	/*//새로프젝트 만들기
	@RequestMapping(value = "/pro_write")
	public ModelAndView pro_write(@RequestParam Map<String, String> params){
		logger.info("글쓰기 요청");	
		
		return service.pro_write(params);
	}*/
	
	//파일 업로드폼 으로 이동
	@RequestMapping(value = "/uploadForm")
	public String uploadForm(){
		logger.info("파일 업로드 페이지 이동");	
		
		return "uploadForm";
	}
	
	//프로젝트 파일 업로드
	@RequestMapping(value = "/fileUpload")
	public ModelAndView fileUpload(MultipartHttpServletRequest multi){
		logger.info("파일 업로드 요청");	
		
		return service.pro_fileUpload(multi);
	}
	
	//프로젝트 삭제
	@RequestMapping(value="pro_del")
	public @ResponseBody ModelAndView pro_del(
			@RequestParam("seq") int idx,
			@RequestParam("userId") String userId){
			logger.info("삭제 idx : {}",idx);
			
		return service.pro_del(idx, userId);
	}
	
	//프로젝트 상세보기
	@RequestMapping(value ="/pro_detail")
	public ModelAndView pro_detail(@RequestParam ("idx") int idx){
		logger.info("상세보기 요청");	
		return service.pro_detail(idx);
	}
	
	//수정폼 이동
	@RequestMapping(value = "/pro_updateForm")
	public ModelAndView pro_updateForm(@RequestParam("idx") int idx){
		logger.info("수정폼 으로 이동 ");	
		
		return service.pro_updateForm(idx);
	}
	
	//수정하기
	@RequestMapping(value = "/pro_update")
	public ModelAndView pro_update(@RequestParam Map<String, String> params){
		logger.info("수정 요청");	
		
		return service.pro_update(params);
	}
	
	//프로젝트 파일 다운로드
	@RequestMapping(value="/pro_download")
	public void pro_download(@RequestParam("file") String file
			, HttpServletResponse resp ) {
		try {
			service.pro_download(file, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//초대하기 페이지 이동
	@RequestMapping(value = "/pro_inviteForm")
	public ModelAndView pro_inviteForm(@RequestParam("subject") String subject) {
		logger.info("초대하기 페이지로 이동");	
		
		return service.pro_inviteForm(subject);
	}
	
	//초대하기
	@RequestMapping(value = "/pro_invite")
	public ModelAndView pro_invite(@RequestParam("invite") String invite,
			@RequestParam("subject") String subject){
		logger.info("초대하기");
		System.out.println(invite+subject);
		
		return service.pro_invite(invite,subject);
	}
	
	//초대하기
	@RequestMapping(value = "/pro_invite2")
	public ModelAndView pro_invite2(@RequestParam("name") String name,
			@RequestParam("userId") String userId,
			@RequestParam("seq") String seq,
			@RequestParam("subject") String subject){
		
		logger.info("초대하기2:"+name+userId+seq+subject);	
		
		return service.pro_invite2(name,userId,seq,subject);
	}
	
	//프로젝트 탈퇴
	@RequestMapping(value="pro_teamdel")
	public @ResponseBody ModelAndView pro_teamdel(
			@RequestParam("seq") int idx,
			@RequestParam("userId") String userId){
			logger.info("삭제 idx : {}",idx);
			
		return service.pro_teamdel(idx, userId);
	}
	//일일주간 보고 게시판=======================================================
	
		//일일,주간 보고 게시판 페이지 이동
		@RequestMapping(value = "/reportboard")
		public ModelAndView reportboard(@RequestParam("idx") int idx) {
			logger.info("일일,주간 보고 게시판 페이지 이동");
			return service.reportboard(idx);
		}
		
		//일일,주간 보고 글쓰기 페이지 이동
		@RequestMapping(value = "/rptWriteForm")
		public ModelAndView rptWriteForm(@RequestParam("pro_name") String proName
				,@RequestParam("idx") int idx) {
			
			logger.info("일일,주간 보고 글쓰기 페이지 이동");
			
			return service.rptWriteForm(proName,idx);
		}
		
		//일일,주간 보고 글쓰기
		@RequestMapping(value = "/rptWrite")
		public ModelAndView rptWrite(@RequestParam Map<String, String> params, 
				@RequestParam("pro_name") String proName){
			logger.info("일일,주간 보고 글쓰기 요청");
			return service.rptWrite(params,proName);
		}
		
		
		
		//일일,주간 보고 게시판 상세보기
		@RequestMapping(value="/rptdetail")
		public ModelAndView rptdetail(@RequestParam("report_seq") int report_seq){
			logger.info("일일,주간 보고 게시판 상세보기 요청");
			return service.rptdetail(report_seq);
		}
		
		
		
		//일일,주간 보고 게시판 파일 업로드
		@RequestMapping(value = "/rptfileUpload")
		public ModelAndView rptfileUpload(MultipartHttpServletRequest multi){
			logger.info("파일 업로드 요청");	
			
			return service.rptfileUpload(multi);
		}
		
		
		//일일,주간 보고 게시판 수정폼으로 이동
		@RequestMapping(value="/rptupdateForm")
		public ModelAndView rptupdateForm(
				@RequestParam("report_seq") int report_seq){
			logger.info("수정폼으로 이동");
			
			return service.rptupdateForm(report_seq);
		}
		
		//일일,주간 보고 게시판 수정
		@RequestMapping(value="/rptupdate")
		public ModelAndView rptupdate(
				@RequestParam Map<String, String> params){
			logger.info("일일,주간 보고 게시판 수정 요청");
				
			return service.rptupdate(params);
		}
		//프로젝트 파일 다운로드
		@RequestMapping(value="/rpt_download")
		public void rpt_download(@RequestParam("file") String file
				, HttpServletResponse resp ) {
			try {
				service.rpt_download(file, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//일일주간한줄달기
        @RequestMapping(value = "/comment")
        public ModelAndView comment(@RequestParam("idx") int idx,
                @RequestParam("user_id") String userId,
                @RequestParam("pro_name") String pro_name,
                @RequestParam("content") String content) {
            
            logger.info(content);
            return service.comment(idx,userId,pro_name,content);
        }
        
        //일일주간한줄단거 삭제하기
        @RequestMapping(value = "/commentdel")
        public ModelAndView commentdel(@RequestParam("idx") int idx,
                @RequestParam("seq") int seq) {
            
            return service.commentdel(idx,seq);
        }
		//산출물 및 차트=======================================================
		
		//산출물 게시판 페이지 이동
		@RequestMapping(value = "/outputboard")
		public String outputboard() {
			logger.info("산출물 페이지 이동");		
			return "outputboard";
		}
		//글쓰기 폼 이동
		@RequestMapping(value = "/writeForm")
		public String writeForm() {
			logger.info("글쓰기 페이지 이동");		
			return "writeForm";
		}
		
		//글쓰기
		@RequestMapping(value="/write")
		public ModelAndView write(MultipartHttpServletRequest multi){
			logger.info("글쓰기실행");
			return service.write(multi);
		}
		//상세보기
		@RequestMapping(value="/outputdetail")
		public ModelAndView outputdetail(@RequestParam("idx") int idx){
			logger.info("상세보기 요청");
			return service.outputdetail(idx);		
		}
		//다운로드
		@RequestMapping(value="/download")
		public void download(@RequestParam("file") String file
				, HttpServletResponse resp ) {
			try {
				System.out.println("파일="+file);
				service.download(file, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//산출물 수정폼 이동
		@RequestMapping(value="/outputupdateForm")
		public ModelAndView outputupdateForm(
				@RequestParam("idx") int idx){
			logger.info("outputupdateForm 으로 이동");
			return service.outputupdateForm(idx);
		}
		//산출물 수정
		@RequestMapping(value="/outputupdate")
		public ModelAndView outputupdate(MultipartHttpServletRequest multi){
			logger.info("수정하기");
			return service.outputupdate(multi);
		}
		//상세보기
		@RequestMapping(value="/prodetail")
		public ModelAndView prodetail(@RequestParam("pro_name") String proName){
			logger.info("상세보기 요청"+proName);
			return service.prodetail(proName);		
		}
		//리스트 폼으로 가기
		@RequestMapping(value="/outputlist")
		public ModelAndView outputlist(@RequestParam("userId") String userId){
			
			logger.info("리스트호출");
			
			return service.outputlist(userId);
		}
		
		//인덱스 페이지 이동
		@RequestMapping(value = "/dash")
		public String dash() {
			logger.info("dash 페이지 이동");		
			return "dash";
		}
		
		//캘린더 이동
		@RequestMapping(value="/calendar")
		public String calendar(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			logger.info("캘린더 이동");
			return "calendar";
		}
		
		//프로젝트 종료
		@RequestMapping(value="/finish")
		public ModelAndView finish(@RequestParam("idx") String idx,
				@RequestParam("id") String id){
			logger.info("프로젝트종료");
			return service.finish(idx,id);
		}
		
}
