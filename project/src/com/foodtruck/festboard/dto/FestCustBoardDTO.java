package com.foodtruck.festboard.dto;

import java.util.Date;

public class FestCustBoardDTO {

	private int custno;
	private String applyname, applytel;
	private int applyno;
	private String applyloc;
	private Date applytime;
	private int hit;

	// 초기화 블럭
	public FestCustBoardDTO() {

	}

	// 행사일정 리스트용
	public FestCustBoardDTO(int custno, String applyname, String applytel, int hit) {
		this.custno = custno;
		this.applyname = applyname;
		this.applytel = applytel;
		this.hit = hit;
	}

	// 행사일정 글보기용
	public FestCustBoardDTO(int custno, String applyname, String applytel, int applyno, String applyloc, Date applytime,
			int hit) {
		this.custno = custno;
		this.applyname = applyname;
		this.applytel = applytel;
		this.applyno = applyno;
		this.applyloc = applyloc;
		this.applytime = applytime;
		this.hit = hit;
	}

	// 행사일정 글등록 및 수정용
	public FestCustBoardDTO(String applyname, String applytel, int applyno, String applyloc, Date applytime) {
		this.applyname = applyname;
		this.applytel = applytel;
		this.applyno = applyno;
		this.applyloc = applyloc;
		this.applytime = applytime;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public String getApplyname() {
		return applyname;
	}

	public void setApplyname(String applyname) {
		this.applyname = applyname;
	}

	public String getApplytel() {
		return applytel;
	}

	public void setApplytel(String applytel) {
		this.applytel = applytel;
	}

	public int getApplyno() {
		return applyno;
	}

	public void setApplyno(int applyno) {
		this.applyno = applyno;
	}

	public String getApplyloc() {
		return applyloc;
	}

	public void setApplyloc(String applyloc) {
		this.applyloc = applyloc;
	}

	public Date getApplytime() {
		return applytime;
	}

	public void setApplytime(Date applytime) {
		this.applytime = applytime;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "FestCustBoardDTO [custno=" + custno + ", applyname=" + applyname + ", applytel=" + applytel
				+ ", applyno=" + applyno + ", applyloc=" + applyloc + ", applytime=" + applytime + ", hit=" + hit + "]";
	}

}
