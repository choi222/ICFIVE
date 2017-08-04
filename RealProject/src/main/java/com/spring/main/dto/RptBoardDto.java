package com.spring.main.dto;

import java.sql.Date;

public class RptBoardDto {
	
	private int report_seq;
	private String subject;
	private String content;
	private Date reg_date;
	private int seq;
	private String user_id;
	private String pro_name;
	private int fileidx;
	private String oldfile;
	private String newfile;
	
	public int getReport_seq() {
		return report_seq;
	}
	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getFileidx() {
		return fileidx;
	}
	public void setFileidx(int fileidx) {
		this.fileidx = fileidx;
	}
	public String getOldfile() {
		return oldfile;
	}
	public void setOldfile(String oldfile) {
		this.oldfile = oldfile;
	}
	public String getNewfile() {
		return newfile;
	}
	public void setNewfile(String newfile) {
		this.newfile = newfile;
	}
	
	
	

}
