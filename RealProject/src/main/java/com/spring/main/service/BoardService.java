package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardInterface;
import com.spring.main.dto.BoardBean;
import com.spring.main.dto.FilesBean;
import com.spring.main.dto.MemberDto;
import com.spring.main.dto.ReplyDto;
import com.spring.main.dto.RptBoardDto;
import com.spring.main.util.FileUtil;

@Service
public class BoardService {

	@Autowired
	SqlSession sqlSession;
	BoardInterface inter;

	@Autowired
	private JavaMailSenderImpl mailSender;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// 중복 체크
	public Map<String, String> overlays(String subject) {
		Map<String, String> json = new HashMap<String, String>();
		inter = sqlSession.getMapper(BoardInterface.class);
		String use = "N";

		if (inter.overlays(subject) == null) {
			use = "Y";
		}

		json.put("use", use);
		return json;
	}

	// 회원가입
	public Map<String, Integer> join(Map<String, String> params) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);
		MemberDto bean = new MemberDto();

		// 암호화
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String pass = passEncoder.encode(params.get("pw"));
		logger.info("pass : {}", pass);
		bean.setUser_id(params.get("id"));
		bean.setUser_pw(pass);
		bean.setUser_name(params.get("name"));
		bean.setUser_nickname(params.get("nickname"));
		bean.setGender(params.get("gender"));
		bean.setBirth(params.get("birth"));
		bean.setEmail(params.get("email"));
		bean.setPhone(params.get("phone"));
		bean.setAddress(params.get("address"));
		bean.setCon(params.get("con"));
		bean.setReg(params.get("reg"));
		json.put("success", inter.join(bean));

		return json;
	}

	// 로그인(퀵서치 ctrl+shift+L)
	public ModelAndView login(Map<String, Object> params) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();

		String id = (String) params.get("userId");
		String pw = (String) params.get("userPw");
		String name = inter.nameFind(id);
		HttpSession session = (HttpSession) params.get("session");

		String pass = inter.securityLogin(id);
		String page = "main";
		logger.info("암호화된 비번 : {}", pass);
		// 원본 == 암호화 -> true | false
		if (passEncoder.matches(pw, pass)) {
			page = "index";
			session.setAttribute("loginId", id);
			session.setAttribute("Name", name);
		} else {
			mav.addObject("msg", "아이디 또는 비밀번호를 확인 하세요!");
		}
		mav.setViewName(page);

		return mav;
	}

	// 마이페이지
	public ModelAndView detailForm(String id) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		mav.addObject("list", inter.detailForm(id));
		logger.info(id);
		mav.setViewName("detailForm");

		return mav;
	}

	// 수정페이지
	public ModelAndView alterForm(String id) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		mav.addObject("up", inter.alterForm(id));
		mav.setViewName("alterForm");
		return mav;
	}

	// 회원탈퇴 페이지
	public ModelAndView memberdelete(String id) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		mav.addObject("de", inter.memberdelete(id));
		mav.setViewName("memberdelete");
		return mav;
	}

	// 회원탈퇴
	public ModelAndView delete(Map<String, Object> params) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();

		String id = (String) params.get("userId");
		String pw = (String) params.get("userPw");
		logger.info(id);
		HttpSession session = (HttpSession) params.get("session");
		String pass = inter.securityLogin(id);
		String page = "./memberdelete";
		logger.info("암호화된 비번 : {}", pass);
		if (passEncoder.matches(pw, pass)) {
			inter.delete(id);
			page = "./main";
			session.setAttribute("loginId", id);
			mav.addObject("msg", "회원탈퇴가 완료됐습니다!");
		} else {
			mav.addObject("msg", "비밀번호를 확인해 주세요!");
		}
		mav.setViewName(page);

		return mav;
	}

	// 리스트보기
	public ModelAndView list(String userId) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		mav.addObject("list", inter.list(userId));
		mav.setViewName("list");

		return mav;
	}

	// 비밀번호 변경페이지 이동
	public ModelAndView pwmodify(String id) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		mav.addObject("pw", inter.pwmodify(id));
		mav.setViewName("pwmodify");
		return mav;
	}
	
	//비밀번호 수정
			public Map<String, Integer> modify(String id, String newpw, String pw) {
				Map<String, Integer> json = new HashMap<String, Integer>();
				BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
				String pass = inter.securityLogin(id);
				logger.info("암호화된 비번 : {}", pass);
				int success;
				if (!passEncoder.matches(pw, pass)){
					success=0;
				}else{
					String newpass = passEncoder.encode(newpw);
					inter.modify(id,newpass);
					success=1;
				}
				json.put("success", success);
				return json;
			}

	// 상세보기
	public ModelAndView detail(String proName) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		mav.addObject("list", inter.detail(proName));
		mav.addObject("detail", inter.list2(proName));
		mav.setViewName("listDetail");

		return mav;

	}

	// 저장할 파일 임시저장
	Map<String, String> fileList = new HashMap<String, String>();

	// 프로젝트 파일 업로드
	public ModelAndView pro_fileUpload(MultipartHttpServletRequest multi) {
		ModelAndView mav = new ModelAndView();

		String fileName = multi.getParameter("fileName");
		String newFileName = null;

		FileUtil futil = new FileUtil();
		newFileName = futil.upload(multi, fileName);

		fileList.put(newFileName, fileName);
		logger.info("저장할 파일 갯수 : {}", fileList.size());
		mav.addObject("path", "resources/upload/" + newFileName);
		mav.setViewName("uploadForm");
		return mav;
	}

	// 프로젝트 파일 삭제
	public Map<String, Integer> pro_fileDelete(String fileName) {

		Map<String, Integer> json = new HashMap<String, Integer>();
		int success = 0;

		FileUtil futil = new FileUtil();
		success = futil.delete(fileName);

		// 해당 파일 명이 있음 지워라!
		if (fileList.get(fileName) != null && success == 1) {
			inter = sqlSession.getMapper(BoardInterface.class);
			inter.pro_fileUpdate(fileName);
			fileList.remove(fileName);
		}

		json.put("success", success);

		return json;
	}

	/*
	 * //새로프젝트 만들기 public ModelAndView pro_write(Map<String, String> params) {
	 * 
	 * ModelAndView mav = new ModelAndView(); inter =
	 * sqlSession.getMapper(BoardInterface.class);
	 * 
	 * BoardBean bean = new BoardBean();
	 * 
	 * // 작성자/제목/내용 String user_id = params.get("user_id"); String user_name =
	 * params.get("user_name"); String subject = params.get("subject"); String
	 * teamname = params.get("teamname"); String content =
	 * params.get("content");
	 * 
	 * logger.info("user_name : {}", user_name); logger.info("user_id : {}",
	 * user_id); logger.info("teamname : {}", teamname);
	 * logger.info("subject : {}", subject); logger.info("content : {}",
	 * content);
	 * 
	 * bean.setUser_id(user_id); bean.setSubject(subject);
	 * bean.setContent(content); bean.setTeamname(teamname);
	 * 
	 * String page="pro_writeForm"; String msg="프로젝트등록에 성공하셨습니다..";
	 * logger.info("dd2"); //빈을 사용해야 키를 반환 받을 수 있다.
	 * if(inter.pro_write(bean)==1){ logger.info("dd"); page="index"; int size =
	 * fileList.size(); logger.info("업로드 된 파일 갯수 : {}",size); if(size>0){ //맵에
	 * 있는 키를 전부 가져와 하나씩 꺼낸다. for(String key:fileList.keySet()){ //oldFile,
	 * newFile, idx(빈즈를 사용할 수도 있다.)
	 * inter.pro_writeFile(fileList.get(key),key,bean.getSeq()); }
	 * fileList.clear(); } inter.pro_writeInvite(user_name, user_id, subject);
	 * inter.projectbasic(bean); }
	 * 
	 * mav.addObject("msg", msg); mav.setViewName(page);
	 * 
	 * return mav; }
	 */
	// 프로젝트 등록
	public Map<String, Integer> pro_write(Map<String, String> params) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);
		BoardBean bean = new BoardBean();

		String user_id = params.get("id");
		String user_name = params.get("name");
		String subject = params.get("subject");
		
		// 작성자/제목/내용
		bean.setUser_id(params.get("id"));
		bean.setSubject(params.get("subject"));
		bean.setTeamname(params.get("teamname"));
		bean.setContent(params.get("content"));
		bean.setStartday(params.get("startday"));
		bean.setEndday(params.get("endday"));

		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@");
		logger.info(bean.getSubject());
		logger.info(bean.getContent());
		int success = inter.pro_write(bean);
		System.out.println(success);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@");
		// 빈을 사용해야 키를 반환 받을 수 있다.
		if (success == 1) {
			inter.projectbasic(bean);
			int size = fileList.size();
			logger.info("업로드 된 파일 갯수 : {}", size);
			if (size > 0) {
				// 맵에 있는 키를 전부 가져와 하나씩 꺼낸다.
				for (String key : fileList.keySet()) {
					// oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
					inter.pro_writeFile(fileList.get(key), key, bean.getSeq());
				}
				fileList.clear();
			}
			inter.pro_writeInvite(user_name, user_id, subject);
		}
		json.put("success", success);
		return json;
	}

	// 프로젝트삭제
	public ModelAndView pro_del(int idx, String userId) {

		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();

		// 글에 해당하는 파일명 추출
		logger.info("삭제할 파일의 idx : " + idx);
		String[] delFileName = inter.pro_delFileName(idx);

		logger.info("삭제할 파일 수 : " + delFileName.length);
		String page = "redirect:/outputlist?userId=" + userId;

		// 글 삭제
		int success = inter.pro_del(idx);
		logger.info("글 삭제 성공 : " + success);

		if (success == 1) {

			if (delFileName.length > 0) {

				// 글삭제가 성공하면 파일 삭제
				for (int i = 0; i < delFileName.length; i++) {

					logger.info("지운다 : " + delFileName[i]);
					FileUtil futil = new FileUtil();
					success = futil.delete(delFileName[i]);
				}
			}
		}

		mav.setViewName(page);

		return mav;
	}

	// 프로젝트 상세보기
	public ModelAndView pro_detail(int idx) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		// 상세보기 정보
		mav.addObject("detail", inter.pro_detail(idx));

		// 팀원이름
		mav.addObject("team", inter.team_detail(idx));

		// 파일목록 정보
		mav.addObject("files", inter.pro_fileList(idx));
		mav.setViewName("pro_detail");

		return mav;
	}

	// 프로젝트 수정 폼으로 이동
	public ModelAndView pro_updateForm(int idx) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		// 상세보기 정보
		mav.addObject("detail", inter.pro_detail(idx));

		// 팀원이름 정보
		mav.addObject("team", inter.team_detail(idx));

		// 파일목록 정보
		ArrayList<FilesBean> files = inter.pro_fileList(idx);

		// 가져온 정보를 fileList에 등록
		for (int i = 0; i < files.size(); i++) {
			fileList.put(files.get(i).getNewfile(), files.get(i).getOldfile());
		}

		mav.addObject("files", files);
		mav.setViewName("pro_updateForm");
		return mav;
	}

	// 프로젝트 수정
	public ModelAndView pro_update(Map<String, String> params) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		// 작성자/제목/내용
		String subject = params.get("subject");
		String content = params.get("content");
		int idx = Integer.parseInt(params.get("idx"));

		String page = "redirect:/pro_updateForm?idx=" + idx;

		int success = inter.pro_update(subject, content, idx);

		// 빈을 사용해야 키를 반환 받을 수 있다.
		if (success == 1) {

			page = "redirect:/pro_detail?idx=" + idx;
			int size = fileList.size();

			logger.info("업로드 된 파일 갯수 : {}", size);

			if (size > 0) {

				// 맵에 있는 키를 전부 가져와 하나씩 꺼낸다.
				for (String key : fileList.keySet()) {

					// oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
					logger.info("fileDelName : {}", key);
					inter.pro_fileUpdate(key);// 기존에 있는 내용 하나씩 지우고
					inter.pro_writeFile(fileList.get(key), key, idx);// 다시 하나씩
					// 등록
				}
				fileList.clear();
			}
		}
		System.out.println(subject);
		mav.setViewName(page);

		return mav;
	}

	// 프로젝트 파일 다운로드
	public void pro_download(String file, HttpServletResponse resp) {

		inter = sqlSession.getMapper(BoardInterface.class);
		String oriFile = inter.pro_downloadName(file);

		logger.info(file + "=>" + oriFile);
		FileUtil futil = new FileUtil();

		try {
			futil.download(file, oriFile, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 초대하기 페이지로 이동
	public ModelAndView pro_inviteForm(String subject) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		mav.addObject("subject", inter.pro_invite2(subject));

		return mav;
	}

	// 초대하기
	public ModelAndView pro_invite(String invite, String subject) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		mav.addObject("list", inter.pro_invite('%' + invite + '%'));

		System.out.println("초대받은사람:" + '%' + invite + '%');

		if (invite.equals("")) {
			mav.addObject("list", inter.pro_invite4());
		}

		mav.addObject("subject", inter.pro_invite2(subject));

		mav.setViewName("pro_inviteForm");

		return mav;
	}

	// 초대하기
	public ModelAndView pro_invite2(String name, String userId, String seq, String subject) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		String msg = "이미 초대가 완료되었습니다.";
		System.out.println(userId + "제목=" + subject);

		if (inter.enter(userId, subject).size() < 1) {
			System.out.println("구분실행");
			inter.pro_invite3(name, userId, seq, subject);
			msg = "초대가 완료되었습니다.";
		} else {
			System.out.println("구분실행안함.");
		}

		System.out.println("메시지:" + inter.enter(userId, subject));

		mav.addObject("msg", msg);
		mav.addObject("subject", inter.pro_invite2(subject));
		mav.setViewName("pro_inviteForm");

		return mav;
	}

	// 이름달고 프로젝트만들기 페이지로 이동
	public ModelAndView pro_writeForm(String userId) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		mav.addObject("subject", inter.pro_writeForm(userId));
		mav.setViewName("pro_writeForm");

		return mav;
	}

	// 프로젝트 탈퇴
	public ModelAndView pro_teamdel(int idx, String userId) {

		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();

		String page = "redirect:/outputlist?userId=" + userId;

		// 글 삭제
		int success = inter.pro_teamdel(userId, idx);
		logger.info("글 삭제 성공 : " + success);

		if (success == 1) {

		}

		System.out.println("아이디:" + userId);

		mav.setViewName(page);

		return mav;
	}

	// 일일.주간 보고 게시판 리스트
	public Map<String, Object> rptlistCall(int currPage, int pagePerNum, String proName) {

		inter = sqlSession.getMapper(BoardInterface.class);
		// 리스트,, 현재 페이지,, 최대 만들 수 있는 페이지
		Map<String, Object> json = new HashMap<String, Object>();

		logger.info("현재 페이지 : {}", currPage);
		logger.info("페이지당 보여줄 수 : {}", pagePerNum);
		System.out.println(proName);

		int end = currPage * pagePerNum;
		int start = end - pagePerNum + 1;
		int allCnt = inter.allCount(); // 전체 게시물 수

		// 만들 수 있는 최대 페이지
		int range = allCnt % pagePerNum > 0 ? Math.round(allCnt / pagePerNum) + 1 : Math.round(allCnt / pagePerNum);

		json.put("currPage", currPage);
		json.put("range", range);
		json.put("list", inter.rptlistCall(start, end, proName));

		return json;
	}

	// 일일,주간 보고 글쓰기
	@Transactional
	public ModelAndView rptWrite(Map<String, String> params, String proName) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		RptBoardDto dto = new RptBoardDto();

		// 작성자, 프로젝트이름, 제목, 내용
		String user_id = params.get("user_id");
		String pro_name = params.get("pro_name");
		String subject = params.get("subject");
		String content = params.get("content");
		int seq = Integer.parseInt(params.get("idx"));

		logger.info("user_id : {}", user_id);
		logger.info("pro_name : {}", pro_name);
		logger.info("subject : {}", subject);
		logger.info("content : {}", content);

		dto.setUser_id(user_id);
		dto.setPro_name(pro_name);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setSeq(seq);

		String page = "redirect:/rptWriteForm";
		String msg = "보고서 생성에 성공하셨습니다.";

		// 빈을 사용해야 키를 반환 받을 수 있다.
		if (inter.rptWrite(dto) == 1) {
			page = "redirect:/reportboard?pro_name="+pro_name+"&idx="+seq;
			int size = fileList.size();
			logger.info("업로드 된 파일 갯수 : {}", size);
			if (size > 0) {
				// 맵에 있는 키를 전부 가져와 하나씩 꺼낸다.
				for (String key : fileList.keySet()) {
					// oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
					inter.rptWriteFile(fileList.get(key), key, dto.getReport_seq());
				}
				fileList.clear();
			}
		}

		/* mav.addObject("msg", msg); */
		mav.setViewName(page);

		return mav;
	}

	// 일일주간보고 게시판 이동
	public ModelAndView reportboard(int idx) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		mav.addObject("subject", inter.detail2(idx));
		 mav.addObject("list",inter.commentdetail(idx));
		mav.setViewName("./reportboard");

		return mav;
	}

	// 일일주간보고 게시판 글쓰기에 이름뽑아오기
	public ModelAndView rptWriteForm(String proName, int idx) {
		ModelAndView mav = new ModelAndView();
		System.out.println("proName=" + proName);
		mav.addObject("prname", proName);
		mav.addObject("idx", idx);
		mav.setViewName("./rptWriteForm");

		return mav;
	}

	// 일일,주간 보고 게시판 파일올리기
	public ModelAndView rptfileUpload(MultipartHttpServletRequest multi) {
		ModelAndView mav = new ModelAndView();
		

		String fileName = multi.getParameter("fileName");
		String newFileName = null;

		FileUtil futil = new FileUtil();
		newFileName = futil.upload(multi, fileName);

		fileList.put(newFileName, fileName);
		logger.info("저장할 파일 갯수 : {}", fileList.size());
		mav.addObject("path", "resources/upload/" + newFileName);
		mav.setViewName("uploadForm");
		return mav;
	}

	// 일일.주간 보고 게시글 삭제
		public Map<String, Integer> rptdel(int report_seq, String id) {

			Map<String, Integer> json = new HashMap<String, Integer>();
			inter = sqlSession.getMapper(BoardInterface.class);

			// 글에 해당하는 파일명 추출
			String[] delFileName = inter.rptdelFileName(report_seq);
			logger.info("삭제할 파일 : " + delFileName);
			String msg = "삭제 권한이 없습니다.";

			int success = inter.rptdel(report_seq,id);

			if (success == 1) {

				if (delFileName.length > 0) {

					// 글삭제가 성공하면 파일 삭제
					for (int i = 0; i < delFileName.length; i++) {

						logger.info("지운다 : " + delFileName[i]);
						FileUtil futil = new FileUtil();
						success = futil.delete(delFileName[i]);
					}
				}
			}

			json.put("success", success);

			return json;

		}


	// 일일, 주간 보고 게시판 상세보기
	public ModelAndView rptdetail(int report_seq) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		logger.info("@@@@@@@@@@@@@@@@@@@@");
		mav.addObject("list", inter.rptdetail(report_seq));
		mav.addObject("files", inter.fileList(report_seq));
		mav.setViewName("rptdetail");

		return mav;
	}

	// 일일,주간 보고 게시판 수정폼 이동
	public ModelAndView rptupdateForm(int report_seq) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		mav.addObject("list", inter.rptdetail(report_seq));
		mav.addObject("files", inter.fileList(report_seq));
		// 도착해야 할 곳은
		mav.setViewName("rptupdateForm");

		return mav;
	}

	// 일일,주간 보고 게시판 수정
	public ModelAndView rptupdate(Map<String, String> params) {

		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		RptBoardDto dto = new RptBoardDto();

		String subject = params.get("subject");
		String content = params.get("content");
		int report_seq = Integer.parseInt(params.get("report_seq"));

		// redirect로 보내야 인터셉터를 제대로 걸 수 있다.
		String page = "redirect:/rptupdateForm?report_seq=" + report_seq;

		int success = inter.rptupdate(subject, content, report_seq);

		// 성공하면 1을 반환할 것임
		// 빈을 등록해야 키를 반환받을 수 있다.
		if (success == 1) {
			page = "redirect:/rptdetail?report_seq=" + report_seq;

			int size = fileList.size();
			logger.info("업로드 된 파일 갯수 : {}", size);
			if (size > 0) {
				// 맵에 있는 키를 전부 가져와 하나씩 꺼낸다.
				for (String key : fileList.keySet()) {
					inter.rptWriteFile(fileList.get(key), key, report_seq);
				}
				// 등록이 다 끝났으면
				fileList.clear();
			}
		}

		mav.setViewName(page);

		return mav;
	}

	// 일일,주간 파일 다운로드
	public void rpt_download(String file, HttpServletResponse resp) {
		inter = sqlSession.getMapper(BoardInterface.class);
		String oriFile = inter.rpt_downloadName(file);

		logger.info(file + "=>" + oriFile);
		FileUtil futil = new FileUtil();

		try {
			futil.download(file, oriFile, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//일일주간 한줄달기
    public ModelAndView comment(int idx, String userId, String pro_name, String content) {
        
        ModelAndView mav = new ModelAndView();
        inter = sqlSession.getMapper(BoardInterface.class);
        
        inter.comment(idx,userId,pro_name,content);
        
        String page = "redirect:/reportboard?idx="+idx;
        
        mav.addObject("list",inter.commentdetail(idx));
        mav.setViewName(page);
        
        return mav;
    }
    
    //일일주간 한줄달기 삭제하기
    public ModelAndView commentdel(int idx, int seq) {
        
        ModelAndView mav = new ModelAndView();
        inter = sqlSession.getMapper(BoardInterface.class);

        inter.commentdel(idx);
        
        String page = "redirect:/reportboard?idx="+seq;
        
        mav.addObject("list",inter.commentdetail(seq));
        mav.setViewName(page);
        return mav;
    }
	// 산출물 및 차트===================================================

	public Map<String, Object> listCall(int currPage, int pagePerNum) {
		inter = sqlSession.getMapper(BoardInterface.class);
		// 리스트/현재페이지/최대 만들수 있는 페이지수
		Map<String, Object> json = new HashMap<String, Object>();

		logger.info("현재 페이지 : {}", currPage);
		logger.info("페이지당 보여줄 수  : {}", pagePerNum);

		int end = currPage * pagePerNum;
		int start = end - pagePerNum + 1;
		int allCnt = inter.outputallCount();// 전체 게시물 수
		// 만들 수 있는 최대 페이지
		int range = allCnt % pagePerNum > 0 ? Math.round(allCnt / pagePerNum) + 1 : Math.round(allCnt / pagePerNum);

		json.put("currPage", currPage);
		json.put("range", range);
		json.put("list", inter.listCall(start, end));

		return json;
	}

	// 파일 업로드
	public ModelAndView fileUpload(MultipartHttpServletRequest multi) {
		ModelAndView mav = new ModelAndView();

		String fileName = multi.getParameter("fileName");
		String newFileName = null;

		FileUtil futil = new FileUtil();
		newFileName = futil.upload(multi, fileName);

		fileList.put(newFileName, fileName);
		logger.info("저장할 파일 갯수 : {}", fileList.size());
		mav.addObject("path", "resources/upload/" + newFileName);
		mav.setViewName("outputuploadForm");
		return mav;
	}

	// 파일 삭제
	public Map<String, Integer> fileDelete(String fileName) {

		Map<String, Integer> json = new HashMap<String, Integer>();
		int success = 0;

		FileUtil futil = new FileUtil();
		success = futil.delete(fileName);
		// 해당 파일 명이 있음 지워라!
		if (fileList.get(fileName) != null && success == 1) {
			inter = sqlSession.getMapper(BoardInterface.class);
			inter.fileUpdate(fileName);
			fileList.remove(fileName);
		}
		json.put("success", success);

		return json;
	}

	public Map<String, ArrayList<ReplyDto>> repleList(int idx) {
		Map<String, ArrayList<ReplyDto>> json = new HashMap<String, ArrayList<ReplyDto>>();

		inter = sqlSession.getMapper(BoardInterface.class);
		json.put("list", inter.replyList(idx));

		return json;
	}

	public Map<String, Integer> repleRegist(Map<String, String> params) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);

		String replyer = params.get("user");
		String reple = params.get("content");
		String idx = params.get("idx");

		json.put("success", inter.repleRegist(replyer, reple, idx));
		inter.replyUp(idx);
		return json;
	}

	public Map<String, Integer> repleDel(int seq, int idx) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);

		json.put("success", inter.repleDel(idx));
		inter.replyDown(seq);

		return json;
	}

	public Map<String, Integer> del(int idx) {
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, Integer> json = new HashMap<String, Integer>();
		// 글에 해당하는 파일명 추출
		logger.info("삭제할 파일의 idx : " + idx);
		String[] delFileName = inter.delFileName(idx);
		logger.info("삭제할 파일 수 : " + delFileName.length);
		String msg = "삭제에 실패 했습니다.";
		// 글 삭제
		int success = inter.del(idx);
		logger.info("글 삭제 성공 : " + success);
		if (success == 1) {
			if (delFileName.length > 0) {
				// 글삭제가 성공하면 파일 삭제
				for (int i = 0; i < delFileName.length; i++) {
					logger.info("지운다 : " + delFileName[i]);
					FileUtil futil = new FileUtil();
					success = futil.delete(delFileName[i]);
				}
			}
		}
		json.put("success", success);

		return json;
	}

	public Map<String, Object> keyword(String keyword) {
		inter = sqlSession.getMapper(BoardInterface.class);

		Map<String, Object> json = new HashMap<String, Object>();
		json.put("list", inter.keyword('%' + keyword + '%'));
		return json;
	}

	public Map<String, Object> prolist(String proname) {
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("list", inter.prolist(proname));
		return json;
	}

	public Map<String, Integer> save(Map<String, String> params) {
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, Integer> json = new HashMap<String, Integer>();

		String col = params.get("col");
		String val = params.get("val");
		String pro_idx = params.get("pro_idx");
		logger.info(col + "/" + val + "/" + pro_idx);
		json.put("success", inter.save(col, val, pro_idx));
		return json;
	}

	public Map<String, Integer> delwork(String pro_idx) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);

		json.put("del", inter.delpro(pro_idx));
		return json;
	}

	public Map<String, Object> chart(int seq) {
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();

		int all = inter.all(seq);
		int finish = inter.finish(seq);

		json.put("all", all);
		json.put("finish", finish);
		return json;
	}

	public Map<String, Object> con(String name, String pronames) {
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();

		inter.con(name, pronames);

		return json;
	}

	public Map<String, Object> conchart(String pronames) {
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("con", inter.conchart(pronames));
		return json;
	}

	public Map<String, Object> add(String workname, String teamname, String seq, String pronames) {
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		logger.info("add" + workname + "//" + seq + "/");
		json.put("add", inter.add(workname, teamname, seq, pronames));

		return json;
	}

	public ModelAndView write(MultipartHttpServletRequest multi) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		// 파라메터 추출
		String subject = multi.getParameter("subject");
		String user_name = multi.getParameter("user_name");
		String content = multi.getParameter("content");
		String fileName = multi.getParameter("fileName");
		String newFileName = null;
		logger.info(subject + "/" + content + "/" + user_name + "/" + fileName);

		// 파일업로드
		if (fileName != null) {
			FileUtil upload = new FileUtil();
			newFileName = upload.upload(multi, fileName);
		}
		// 데이터베이스에 저장
		int success = inter.write(user_name, subject, content, fileName, newFileName);
		String msg = "등록에 실패 했습니다";
		String page = "writeForm";
		if (success == 1) {
			msg = "등록에 성공했습니다.";
			page = "redirect:/outputboard";
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView outputdetail(int idx) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		// 조회수
		inter.upHit(idx);
		// 상세보기 정보
		mav.addObject("detail", inter.outputdetail(idx));
		// 파일목록 정보
		// mav.addObject("files", inter.fileList(idx));
		mav.setViewName("outputdetail");
		return mav;
	}

	public void download(String file, HttpServletResponse resp) {
		inter = sqlSession.getMapper(BoardInterface.class);
		String oriFile = inter.downloadName(file);
		logger.info(file + "=>" + oriFile);
		FileUtil futil = new FileUtil();
		try {
			futil.download(file, oriFile, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ModelAndView outputupdateForm(int idx) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("detail", inter.outputdetail(idx));
		mav.setViewName("outputupdateForm");
		return mav;
	}

	public ModelAndView outputupdate(MultipartHttpServletRequest multi) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();

		// 파라메터 추출
		String idx = multi.getParameter("idx");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String fileName = multi.getParameter("fileName");
		String delFileName = multi.getParameter("delFileName");
		String newFileName = null;
		int success = 0;
		logger.info(idx + "/" + subject + " / " + content + " / " + fileName + " / " + delFileName);

		// 파일업로드
		if (!fileName.equals("nofile")) {
			logger.info("파일 업로드");
			FileUtil upload = new FileUtil();
			newFileName = upload.upload(multi, fileName);

			// 파일 삭제
			if (delFileName != null) {
				logger.info("기존 파일 삭제");
				FileUtil del = new FileUtil();
				del.delete(delFileName);
			}
			// 수정할 파일이 있을 경우
			success = inter.updateFile(subject, content, fileName, newFileName, idx);
		} else {
			// 수정할 파일이 없을 경우
			success = inter.update(subject, content, idx);
		}

		String page = "redirect:/outputupdateForm?idx=" + idx;
		if (success == 1) {
			page = "redirect:/outputdetail?idx=" + idx;
		}
		mav.setViewName(page);

		return mav;
	}

	public ModelAndView prodetail(String proName) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		mav.addObject("list", inter.prodetail(proName));
		mav.setViewName("listDetail");

		return mav;
	}

	public ModelAndView outputlist(String userId) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);

		mav.addObject("list", inter.list(userId));
		mav.setViewName("outputlist");
		return mav;
	}

	public Map<String, String> overlay(String id) {
		Map<String, String> json = new HashMap<String, String>();
		inter = sqlSession.getMapper(BoardInterface.class);
		String use = "N";

		if (inter.overlay(id) == null) {
			use = "Y";
		}

		json.put("use", use);
		return json;
	}

	public Map<String, Object> findpw(Map<String, String> params) {
		Map<String, Object> json = new HashMap<String, Object>();
		inter = sqlSession.getMapper(BoardInterface.class);

		String id = params.get("id");
		String name = params.get("Name");
		String birth = params.get("Birth");
		String email = params.get("Email");
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@");
		logger.info("{}", id);
		logger.info("{}", name);
		logger.info("{}", birth);
		logger.info("{}", email);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@");

		int success = 0;
		String msg = "입력 정보를 확인해 주세요.";

		if (inter.findpw(id, name, email, birth) != null) {
			/* int randomNum = 100000 + (int)(Math.random()*899999); */
			String password = "";
			for (int i = 0; i < 8; i++) {
				// char upperStr = (char)(Math.random() * 26 + 65);
				char lowerStr = (char) (Math.random() * 26 + 97);
				if (i % 2 == 0) {
					password += (int) (Math.random() * 10);
				} else {
					password += lowerStr;
				}
			}
			System.out.println(password);

			/* String pw = String.valueOf(randomNum); */
			logger.info("임시 비밀번호 : {}", password);
			String setfrom = "victorhko123@gmail.com";
			String tomail = email; // 받는 사람 이메일
			String title = "ICFIVE 임시 비밀번호 전송입니다."; // 제목
			String content = id + "님의 임시 비밀번호는 " + password + " 입니다."; // 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}

			BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
			String pass = passEncoder.encode(password);
			inter.changepw(pass, id);
			msg = "등록하신 메일로 임시 비밀번호가 전송되었습니다.";
			success = 1;
		}
		json.put("success", success);
		json.put("msg", msg);
		return json;
	}

	public Map<String, Object> findid(Map<String, String> params) {
		Map<String, Object> json = new HashMap<String, Object>();
		inter = sqlSession.getMapper(BoardInterface.class);
		String name = params.get("name");
		String birth = params.get("birth");
		String email = params.get("email");
		logger.info(name + "/" + birth + "/" + email);
		String msg = "정보에 일치하는 ID가 존재하지 않습니다.";
		String fi = "";
		logger.info(fi);
		if (inter.findid(name, email, birth) != null) {
			msg = "";
			fi = inter.findid(name, email, birth);
		}
		json.put("fi", fi);
		json.put("msg", msg);
		return json;
	}

	// 프로필 수정
	public ModelAndView alter(MultipartHttpServletRequest multi) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		// 파라메터 추출
		String id = multi.getParameter("userId");
		String name = multi.getParameter("userName");
		String birth = multi.getParameter("birth");
		String email = multi.getParameter("email");
		String dotcom = multi.getParameter("dotcom");
		String remail = email + "@" + dotcom;
		String number = multi.getParameter("number");
		String fowNum = multi.getParameter("fowNum");
		String backNum = multi.getParameter("backNum");
		String phone = number + "-" + fowNum + "-" + backNum;
		String zipNo = multi.getParameter("zipNo");
		String roadAddrPart1 = multi.getParameter("roadAddrPart1");
		String addrDetail = multi.getParameter("addrDetail");
		String roadAddrPart2 = multi.getParameter("roadAddrPart2");
		String address = zipNo + "/" + roadAddrPart1 + "/" + roadAddrPart2 + "/" + addrDetail;
		String fileName = multi.getParameter("fileName");
		String newFileName = null;

		logger.info(remail + "?" + phone + "??" + address);

		// 파일업로드
		if (fileName != null) {
			FileService upload = new FileService();
			newFileName = upload.fileUpload(multi, fileName);
		}

		// 데이터베이스에 저장
		int success = inter.alter(id, name, birth, remail, phone, address, fileName, newFileName);
		String msg = "수정에 실패 했습니다.";
		String page = "main";
		if (success == 1) {
			msg = "수정에 성공 했습니다.";
			mav.addObject("list",inter.detailForm(id));
			page = "/detailForm";
			System.out.println(success);
		}
		/* mav.addObject("msg", msg); */
		mav.setViewName(page);
		mav.addObject("ms", msg);
		System.out.println(msg);
		return mav;
	}
	
	//일정차트(프로젝트 상세보기)
		public Map<String, Object> gant(String proname) {
			Map<String, Object> json = new HashMap<String, Object>();
			inter = sqlSession.getMapper(BoardInterface.class);
			
			json.put("gant", inter.gant(proname));
			
			return json;
		}

		public Map<String, Object> monday(String day, String day1, String proname) {
			
			Map<String, Object> json = new HashMap<String, Object>();
			inter = sqlSession.getMapper(BoardInterface.class);
			json.put("list", inter.monday(day,day1,proname));
			return json;
		}

		public Map<String, Object> getProjectList(String id) {
			Map<String, Object> result = new HashMap<String, Object>();
			inter = sqlSession.getMapper(BoardInterface.class);
			result.put("resultList", inter.list(id));
			return result;
		}
		//dash산출물
		public Map<String, Object> san() {
			Map<String, Object> json = new HashMap<String, Object>();
			inter = sqlSession.getMapper(BoardInterface.class);
			json.put("san", inter.san());
			return json;
		}

		public Map<String, Object> my(String id) {
			Map<String, Object> json = new HashMap<String, Object>();
			inter = sqlSession.getMapper(BoardInterface.class);
			json.put("my", inter.my(id));
			return json;
		}

		public ModelAndView finish(String idx, String id) {
			inter = sqlSession.getMapper(BoardInterface.class);
			ModelAndView mav = new ModelAndView();
			int success = inter.finishpro(idx);
			String page="";
			if (success == 1) {
				page = "redirect:/outputlist?userId=" + id;
			}
			mav.setViewName(page);
			return mav;
		}

		public Map<String, Object> dashchart(String id) {
			inter = sqlSession.getMapper(BoardInterface.class);
			Map<String, Object> json = new HashMap<String, Object>();

			int all = inter.dashall(id);
			int finish = inter.dashfinish(id);

			json.put("all", all);
			json.put("finish", finish);
			return json;
		}

		public Map<String, Object> countsan() {
			Map<String, Object> json = new HashMap<String, Object>();
			inter = sqlSession.getMapper(BoardInterface.class);
			json.put("countsan", inter.countsan());
			return json;
		}

		public Map<String, Object> countpro(String id) {
			Map<String, Object> json = new HashMap<String, Object>();
			inter = sqlSession.getMapper(BoardInterface.class);
			json.put("countpro", inter.countpro(id));
			return json;
		}

}
