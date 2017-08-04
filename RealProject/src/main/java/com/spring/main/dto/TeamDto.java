package com.spring.main.dto;

public class TeamDto {
	
	private String pro_name;
	private String name;
	private String user_id;
	private int seq;
	
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int idx) {
		this.seq = idx;
	}
	
}
