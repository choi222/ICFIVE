package com.spring.main.dto;

import java.sql.Date;

public class BoardBean {
	
	private int idx;
	private int seq;
	private String user_id;
	private String user_name;
	private String subject;
	private String content;
	private Date reg_date;
	private int hit;
	private int reple;
	private String fileName;
	private String newFile;
	private String teamname;
	private String startday;
	private String endday;
	private String daystart;
	private String dayend;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public int getReple() {
		return reple;
	}
	public void setReple(int reple) {
		this.reple = reple;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getNewFile() {
		return newFile;
	}
	public void setNewFile(String newFile) {
		this.newFile = newFile;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getDaystart() {
		return daystart;
	}
	public void setDaystart(String daystart) {
		this.daystart = daystart;
	}
	public String getDayend() {
		return dayend;
	}
	public void setDayend(String dayend) {
		this.dayend = dayend;
	}
	

}
