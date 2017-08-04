package com.spring.main.controller;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.dto.ReplyDto;
import com.spring.main.service.BoardService;

@Controller("AjaxController")
@RequestMapping(value="/rest")
public class AjaxController {
	
	@Autowired BoardService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/*//중복체크
	@RequestMapping(value="/pro_overlay")
	public @ResponseBody Map<String, String> pro_overlay(
			@RequestParam("id") String id){
			logger.info("id : {}",id);
		return service.pro_overlay(id);
	}*/
	//중복체크
		@RequestMapping(value="/overlays")
		public @ResponseBody Map<String, String> overlays(
				@RequestParam("subject") String subject){
				logger.info("subject : {}",subject);
			return service.overlays(subject);
		}
		
	//아이디 중복체크
	@RequestMapping(value="/overlay")
	public @ResponseBody Map<String, String> overlay(
			@RequestParam("id") String id){
			logger.info("id : {}",id);
		return service.overlay(id);
	}
	
	//비밀번호찾기
	@RequestMapping(value="/findpw")
	public @ResponseBody Map<String, Object> findpw(
			@RequestParam Map<String, String> params) throws Exception, URISyntaxException{
			logger.info("pw찾기 요청");
		return service.findpw(params);
	}
	
	//아이디찾기
		@RequestMapping(value="/findid")
		public @ResponseBody Map<String, Object> findid(
				@RequestParam Map<String, String> params){
				logger.info("id찾기");
			return service.findid(params);
		}
			
	//회원가입(암호화)
	@RequestMapping(value="/join")
	public @ResponseBody Map<String, Integer> join(
			@RequestParam Map<String, String> params){
			logger.info("회원가입 요청");
		return service.join(params);
	}
	
	//비밀번호 변경
			@RequestMapping(value="/modify")
			public @ResponseBody Map<String, Integer> pwModify(
					@RequestParam("id") String id,
					@RequestParam("newpw") String newpw, 
					@RequestParam("pw") String pw){
				logger.info(id+"/"+newpw+"/"+pw);
				return service.modify(id,newpw,pw);
			}
	
	//파일 삭제
	@RequestMapping(value="/fileDelete")
	public @ResponseBody Map<String, Integer> fileDelete(
			@RequestParam ("fileName") String fileName){
			logger.info("파일 삭제");
		return service.pro_fileDelete(fileName);
	}
	
	//새 프로젝트 생성
	@RequestMapping(value="/pro_write")
	public @ResponseBody Map<String, Integer> pro_write(
			@RequestParam Map<String, String> params){
			logger.info("프로젝트 생성 요청");
		return service.pro_write(params);
	}
	
	//일일주간보고게시판=====================v==================v==================v==================v
	
	//일일.주간 보고 게시판 리스트
		@RequestMapping(value = "/rptlistCall")
		public @ResponseBody Map<String, Object> rptlistCall(
					@RequestParam("page") int page,
					@RequestParam("pagePerNum") int pagePerNum,
					@RequestParam("pro_name") String proName
					){
				return service.rptlistCall(page, pagePerNum,proName);
		}
		
		//일일 주간 보고 게시글 삭제
		@RequestMapping(value="/rptdel")
		public @ResponseBody Map<String, Integer> rptdel(
				@RequestParam ("report_seq") int report_seq,
				@RequestParam ("id") String id){
			
				logger.info("삭제 report_seq {}, id{} :",report_seq,id);
				
				return service.rptdel(report_seq,id);
			
		}
	
	//산출물관리게시판 및 차트=====================v==================v==================v==================v
			//리스트 보여주기
			@RequestMapping(value="/listCall")
			public @ResponseBody Map<String, Object> listCall(
					@RequestParam("page") int page,
					@RequestParam("pagePerNum") int pagePerNum){		
					logger.info("리스트 보여주기");
				return service.listCall(page, pagePerNum);
			}
			//댓글 리스트
			@RequestMapping(value="/repleList")
			public @ResponseBody Map<String, ArrayList<ReplyDto>> repleList(
					@RequestParam("idx") int idx){		
					logger.info("댓글 리스트 보여주기");
				return service.repleList(idx);
			}
			
			//댓글 등록
			@RequestMapping(value="/repleRegist")
			public @ResponseBody Map<String, Integer> repleRegist(
					@RequestParam Map<String,String> params){		
					logger.info("댓글 등록");
				return service.repleRegist(params);
			}		
			
			//댓글 삭제
			@RequestMapping(value="/repleDel")
			public @ResponseBody Map<String, Integer> repleDel(
					@RequestParam("idx") int idx,
					@RequestParam("seq") int seq
					){		
					logger.info("댓글 삭제");
				return service.repleDel(seq, idx);
			}	
			
			//글 삭제
			@RequestMapping(value="/del")
			public @ResponseBody Map<String, Integer> delete(
					@RequestParam("idx") int idx){
				logger.info("글 삭제");
				return service.del(idx);
			}
			//산출물게시판 검색
			@RequestMapping(value="/keyword")
			public @ResponseBody Map<String, Object> keyword(
					@RequestParam("keyword") String keyword){		
					logger.info("리스트 검색");
				return service.keyword(keyword);
			}
			
			//리스트호출
			@RequestMapping(value = "/prolist")
			public @ResponseBody Map<String,Object> prolist(
					@RequestParam("proname") String proname) {
				
				System.out.println("list Call="+proname);
				
				return service.prolist(proname);
			}
			
			//자동저장
			@RequestMapping(value = "/save")
			public @ResponseBody Map<String,Integer> save(@RequestParam Map<String,String>params) {
				logger.info("저장하기");
				return service.save(params);
			}
			
			
			//항목추가
			@RequestMapping(value = "/add")
			public @ResponseBody Map<String,Object> add(
					@RequestParam("workname") String workname,
					@RequestParam("teamname") String teamname,
					@RequestParam("seq") String seq,
					@RequestParam("pronames") String pronames) {
				
				logger.info("add"+workname+"//"+seq+"/"+teamname);
				
				return service.add(workname,teamname,seq,pronames);
			}
				//삭제 프로젝트항목
				@RequestMapping(value = "/delpro")
				public @ResponseBody Map<String,Integer> del(
						@RequestParam("pro_idx") String pro_idx) {
					
					logger.info("del"+pro_idx);
					
					return service.delwork(pro_idx);
				}
				
				//차트 
				@RequestMapping(value = "/chart")
				public @ResponseBody Map<String,Object> chart(
						@RequestParam("seq") int seq) {
					
					return service.chart(seq);
				}
				//기여도 증가
				@RequestMapping(value = "/con")
				public @ResponseBody Map<String,Object> con(
						@RequestParam("name") String name,
						@RequestParam("pronames") String pronames) {
					
					logger.info("con"+name+"//"+pronames);
					
					return service.con(name,pronames);
				}
				//기여도 차트
				@RequestMapping(value = "conchart")
				public @ResponseBody Map<String,Object> conchart(
						@RequestParam("pronames") String pronames) {
					return service.conchart(pronames);
				}
				
				//간트차트(프로젝트상세보기)
				@RequestMapping(value = "/gant")
				public @ResponseBody Map<String,Object> gant(
						@RequestParam("proname") String proname) {
					
					return service.gant(proname);
				}
				
				//일일주간 검색
				@RequestMapping(value="/monday")
				public @ResponseBody Map<String, Object> monday(
						@RequestParam("day") String day,
						@RequestParam("day1") String day1,
						@RequestParam("proname") String proname){
					
						logger.info("날짜검색"+day+"/"+day1);
					return service.monday(day,day1,proname);
				}
				
				@RequestMapping(value="/getProjectList")
				@ResponseBody
				public Map<String,?> getProjectList(HttpServletRequest req, HttpServletResponse resp) throws Exception{
					logger.info("getProjectList");
					HttpSession session = req.getSession();
					String id = session.getAttribute("loginId").toString();
					return service.getProjectList(id);
				}
				
				//dash  산출물 게시판
				@RequestMapping(value = "/san")
				public @ResponseBody Map<String, Object> san(){
						return service.san();
				}
				
				//dash 내프로젝트
				@RequestMapping(value = "/my")
				public @ResponseBody Map<String, Object> my(
						@RequestParam("id") String id){
						return service.my(id);
				}
				
				@RequestMapping(value = "/dashchart")
				public @ResponseBody Map<String,Object> dashchart(
						@RequestParam("id") String id) {
					
					return service.dashchart(id);
				}
				
				@RequestMapping(value = "/countsan")
				public @ResponseBody Map<String, Object> countsan(){
						return service.countsan();
				}
				
				@RequestMapping(value = "/countpro")
				public @ResponseBody Map<String, Object> countpro(
						@RequestParam("id") String id){
						return service.countpro(id);
				}
}
