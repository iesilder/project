package com.foodtruck.festboard.dto;

public class FestBoardDTO {

	private int festno;
	private String festname, festcomp, festdate, festloc, festtime;
	private int hit;

	// 초기화 블럭
	public FestBoardDTO() {

	}

	// 행사일정 리스트용
	public FestBoardDTO(int festno, String festname, String festdate, String festloc, int hit) {
		this.festno = festno;
		this.festname = festname;
		this.festdate = festdate;
		this.festloc = festloc;
		this.hit = hit;
	}

	// 행사일정 글보기용
	public FestBoardDTO(int festno, String festname, String festcomp, String festdate, String festloc, String festtime,
			int hit) {
		this.festno = festno;
		this.festname = festname;
		this.festcomp = festcomp;
		this.festdate = festdate;
		this.festloc = festloc;
		this.festtime = festtime;
		this.hit = hit;
	}

	// 행사일정 글등록 및 수정용
	public FestBoardDTO(String festname, String festcomp, String festdate, String festloc, String festtime) {
		this.festname = festname;
		this.festcomp = festcomp;
		this.festdate = festdate;
		this.festloc = festloc;
		this.festtime = festtime;
	}

	public int getNo() {
		return festno;
	}

	public void setNo(int festno) {
		this.festno = festno;
	}

	public String getFestname() {
		return festname;
	}

	public void setFestname(String festname) {
		this.festname = festname;
	}

	public String getFestcomp() {
		return festcomp;
	}

	public void setFestcomp(String festcomp) {
		this.festcomp = festcomp;
	}

	public String getFestdate() {
		return festdate;
	}

	public void setFestdate(String festdate) {
		this.festdate = festdate;
	}

	public String getFestloc() {
		return festloc;
	}

	public void setFestloc(String festloc) {
		this.festloc = festloc;
	}

	public String getFesttime() {
		return festtime;
	}

	public void setFesttime(String festtime) {
		this.festtime = festtime;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "FestBoardDTO [no=" + festno + ", festname=" + festname + ", festcomp=" + festcomp + ", festdate="
				+ festdate + ", festloc=" + festloc + ", festtime=" + festtime + ", hit=" + hit + "]";
	}
}
