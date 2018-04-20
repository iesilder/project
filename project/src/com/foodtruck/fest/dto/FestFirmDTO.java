package com.foodtruck.fest.dto;

public class FestFirmDTO {

	private int truckno;
	private String country, maindish;
	private int predppl, applyppl, readyfood;
	private String mngrname, mngrtel;
	private int hit;

	// 초기화 블럭
	public FestFirmDTO() {

	}

	// 행사일정 리스트용
	public FestFirmDTO(int truckno, String country, String maindish, String mngrname, String mngrtel, int hit) {
		this.truckno = truckno;
		this.country = country;
		this.maindish = maindish;
		this.mngrname = mngrname;
		this.mngrtel = mngrtel;
		this.hit = hit;
	}

	// 행사일정 글보기용
	public FestFirmDTO(int truckno, String country, String maindish, int predppl, int applyppl, int readyfood,
			String mngrname, String mngrtel, int hit) {
		this.truckno = truckno;
		this.country = country;
		this.maindish = maindish;
		this.predppl = predppl;
		this.applyppl = applyppl;
		this.readyfood = readyfood;
		this.mngrname = mngrname;
		this.mngrtel = mngrtel;
		this.hit = hit;
	}

	// 행사일정 글등록 및 수정용
	public FestFirmDTO(String country, String maindish, int predppl, int applyppl, int readyfood, String mngrname,
			String mngrtel) {
		this.country = country;
		this.maindish = maindish;
		this.predppl = predppl;
		this.applyppl = applyppl;
		this.readyfood = readyfood;
		this.mngrname = mngrname;
		this.mngrtel = mngrtel;
	}

	public int getTruckno() {
		return truckno;
	}

	public void setTruckno(int truckno) {
		this.truckno = truckno;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getMaindish() {
		return maindish;
	}

	public void setMaindish(String maindish) {
		this.maindish = maindish;
	}

	public int getPredppl() {
		return predppl;
	}

	public void setPredppl(int predppl) {
		this.predppl = predppl;
	}

	public int getApplyppl() {
		return applyppl;
	}

	public void setApplyppl(int applyppl) {
		this.applyppl = applyppl;
	}

	public int getReadyfood() {
		return readyfood;
	}

	public void setReadyfood(int readyfood) {
		this.readyfood = readyfood;
	}

	public String getMngrname() {
		return mngrname;
	}

	public void setMngrname(String mngrname) {
		this.mngrname = mngrname;
	}

	public String getMngrtel() {
		return mngrtel;
	}

	public void setMngrtel(String mngrtel) {
		this.mngrtel = mngrtel;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "FestFirmBoardDTO [truckno=" + truckno + ", country=" + country + ", maindish=" + maindish + ", predppl="
				+ predppl + ", applyppl=" + applyppl + ", readyfood=" + readyfood + ", mngrname=" + mngrname
				+ ", mngrtel=" + mngrtel + ", hit=" + hit + "]";
	}

}
