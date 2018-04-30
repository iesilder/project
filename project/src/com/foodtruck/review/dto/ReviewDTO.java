package com.foodtruck.review.dto;

/*
 * 게시판 데이터를 저장하는 객체
 * 20180410
 * 조현일
 * 번호, 제목, 내용, 작성자, 작성일, 조회수
 */
public class ReviewDTO {

	private int no, score, hit;
	private String  id, fname, maindish, festloc, content, writedate, festdate, starscore;

	
	//리스트
	public ReviewDTO( int no,int score, int hit, String fname, String maindish, String festloc, 	String starscore) {
		this.no =no;
		this.score = score;
		this.hit = hit;
		this.fname = fname;
		this.maindish = maindish;
		this.festloc = festloc;
		this.starscore = starscore;
	}
	
	//\글쓰기
public ReviewDTO(int no,  String content, String starscore, int score) {
		this.no = no;
//		this.id = id;
		this.content = content;
		this.starscore = starscore;
		this.score = score;

	}

////데이터를 넣을 때, 데이터가 다 준비 되어 있는 경우. -> 게시판 글보기 할 때 사용
	public ReviewDTO(int no, int score, int hit, String id, String fname, String maindish, 
			String festloc, String content, String writedate, String festdate, String starscore) {
		super();
		this.no = no;
		this.score = score;		
		this.hit = hit;
		this.id = id;
		this.fname = fname;
		this.maindish = maindish;
		this.festloc = festloc;
		this.content = content;
		this.writedate = writedate;
		this.festdate = festdate;
		this.starscore = starscore;
	}



		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}


		public int getHit() {
			return hit;
		}

		public void setHit(int hit) {
			this.hit = hit;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getFname() {
			return fname;
		}

		public void setFname(String fname) {
			this.fname = fname;
		}

		public String getMaindish() {
			return maindish;
		}

		public void setMaindish(String maindish) {
			this.maindish = maindish;
		}

		public String getFestloc() {
			return festloc;
		}

		public void setFestloc(String festloc) {
			this.festloc = festloc;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getWritedate() {
			return writedate;
		}

		public void setWritedate(String writedate) {
			this.writedate = writedate;
		}

		public String getFestdate() {
			return festdate;
		}

		public void setFestdate(String festdate) {
			this.festdate = festdate;
		}

		public String getStarscore() {
			return starscore;
		}

		public void setStarscore(String starscore) {
			this.starscore = starscore;
		}

		public int getScore() {
			return score;
		}
		public void setScore(int score) {
			this.score = score;
		}
		@Override
		public String toString() {
			return "ReviewDTO [no=" + no + ", score=" + score + ", id=" + id + ", content=" + content + ", writedate="
					+ writedate + ", starscore=" + starscore + "]";
		}
		
		
}
