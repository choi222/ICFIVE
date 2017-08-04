package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardBean;
import com.spring.main.dto.FilesBean;
import com.spring.main.dto.MemberDto;
import com.spring.main.dto.ProjectDto;
import com.spring.main.dto.ReplyDto;
import com.spring.main.dto.RptBoardDto;
import com.spring.main.dto.TeamDto;

public interface BoardInterface {
	// 중복 체크
	String overlay(String id);

	/*
	 * //닉네임 중복 체크 String overlays(String nickname);
	 */

	// 임시비밀번호
	String mailSending(String id, String name, String birth, String tomail);

	// 회원정보
	MemberDto detailForm(String id);

	// 수정페이지
	MemberDto alterForm(String id);

	// 회원탈퇴 페이지 이동
	MemberDto memberdelete(String id);

	// 회원탈퇴
	void delete(String id);

	/*
	 * //수정 닉네임 중복 체크 String overnickname(String nickname);
	 */

	/*// 수정하기
	int alter(MemberDto dto);*/

	// 비밀번호 변경페이지 이동
	MemberDto pwmodify(String id);

	// 비밀번호 수정
	int modify(String id, String newpass);

	// 비밀번호 찾기
	String findpw(String id, String name, String email, String birth);

	// 메일로 받기
	void changepw(String pass, String id);

	// 아이디 찾기
	String findid(String name, String email, String birth);

	/*
	 * //중복 체크 String pro_overlay(String id);
	 */

	// 프로젝트 명 중복체크
	String overlays(String subject);

	// 회원가입
	int join(MemberDto bean);

	// 로그인(암호화)
	String securityLogin(String id);

	// 프로젝트 이름 리스트 불러오기
	public ArrayList<ProjectDto> list(String userId);

	// 상세보기
	public ArrayList<ProjectDto> detail(String userId);

	// 새프로젝트 만들기
	int pro_write(BoardBean bean);

	// 파일 삭제 내용 DB 반영
	void pro_fileUpdate(String fileName);

	// 파일 등록
	void pro_writeFile(String oldFile, String newFile, int idx);

	// 프로젝트 파일리스트 불러오기
	ArrayList<FilesBean> pro_fileList(int idx);

	// 삭제할 파일 리스트
	String[] pro_delFileName(int idx);

	// 글 삭제
	int pro_del(int idx);

	// 다운받으려는 원래 파일 명
	String pro_downloadName(String file);

	// 상세보기
	BoardBean pro_detail(int idx);

	// 프로젝트 seq뽑아내기
	ProjectDto list2(String proName);

	// 팀원이름보기
	ArrayList<TeamDto> team_detail(int idx);

	// 프로젝트 수정하기
	int pro_update(String subject, String content, int idx);

	// 초대하기(아이디찾기)
	ArrayList<MemberDto> pro_invite(String invite);

	// 초대하기2(검색하기)
	ProjectDto pro_invite2(String invite);

	// 초대하기3(데이터넣기)
	int pro_invite3(String name, String userId, String seq, String subject);

	// 초대하기4(멤버보여주기)
	ArrayList<MemberDto> pro_invite4();

	// 검색했을 때 중복확인
	ArrayList<TeamDto> enter(String id, String subject);

	// 이름달고프로젝트만들기폼으로이동
	MemberDto pro_writeForm(String userId);

	// 글작성시 팀네임넣기
	int pro_writeInvite(String user_name, String user_id, String subject);

	// 프로젝트 탈퇴
	int pro_teamdel(String userId, int idx);

	// =========================================================
	// 일일,주간 보고 게시판 전체 게시물 수
	int allCount();

	// 일일,주간 보고 게시판 리스트 불러오기
	ArrayList<RptBoardDto> rptlistCall(int start, int end, String proName);

	// 일일,주간 보고 글쓰기
	int rptWrite(RptBoardDto dto);

	// 일일,주간 보고 파일 올리기
	void rptWriteFile(String string, String key, int report_seq);

	// 프로네임뽑아내기
	ProjectDto detail2(int idx);

	// 일일.주간 보고 게시글 삭제할 파일
	String[] rptdelFileName(int report_seq);

	// 일일,주간 보고 게시글 삭제
	int rptdel(int report_seq, String id);

	// 일일,주간 보고 게시판 상세보기
	RptBoardDto rptdetail(int report_seq);

	// 일일,주간 보고 게시판 파일리스트 불러오기
	ArrayList<FilesBean> fileList(int report_seq);

	// 일일,주간 보고 게시판 수정
	int rptupdate(String subject, String content, int report_seq);

	// 산출물 및 차트====================================================
	ArrayList<BoardBean> listCall(int start, int end);

	ArrayList<ReplyDto> replyList(int idx);

	Integer repleRegist(String replyer, String reple, String idx);

	void replyUp(String idx);

	int repleDel(int idx);

	void replyDown(int seq);

	String[] delFileName(int idx);

	ArrayList<BoardBean> keyword(String string);

	public ArrayList<ProjectDto> prolist(String proname);

	int save(String col, String val, String pro_idx);

	int delpro(String pro_idx);

	int all(int seq);

	int finish(int seq);

	void con(String name, String pronames);

	public ArrayList<ProjectDto> conchart(String pronames);

	int add(String workname, String teamname, String seq, String pronames);

	int write(String user_name, String subject, String content, String fileName, String newFileName);

	BoardBean outputdetail(int idx);

	String downloadName(String file);

	int updateFile(String subject, String content, String fileName, String newFileName, String idx);

	int update(String subject, String content, String idx);

	public ArrayList<ProjectDto> prodetail(String proName);

	void upHit(int idx);

	int del(int idx);

	int outputallCount();

	void fileUpdate(String fileName);

	void projectbasic(BoardBean bean);

	int alter(String id, String name, String birth, String remail, String phone, String address, String fileName,
			String newFileName);

	String rpt_downloadName(String file);
	
	//상세보기 일정차트
	public ArrayList<ProjectDto> gant(String proname);

	ArrayList<RptBoardDto> monday(String day,String day1, String proname);
	
	//일일주간 한줄달기
    int comment(int idx, String userId, String pro_name, String content);

    //일일주간 한줄단거 보기
    ArrayList<ProjectDto> commentdetail(int idx);
    
    //일일주간 한줄단거 삭제하기
    void commentdel(int idx);
	/*
	 * ArrayList<FilesBean> outputfileList(int report_seq);
	 */ // =========================================================
    //dash산출물리스트
    ArrayList<BoardBean> san();

    public ArrayList<TeamDto> my(String id);

	int finishpro(String idx);

	int dashall(String id);

	int dashfinish(String id);
	
	//이름 세션
	String nameFind(String id);

	int countsan();

	int countpro(String id);

}
