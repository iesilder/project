package com.webjjang.board.dto;

/*
 * 게시판 데이터를 저장하는 객체
 * 20180213
 * 유태선
 * 번호, 제목, 내용, 작성자, 작성일, 조회수
 */
public class BoardDTO {

	private int no;
	private String title;
	private String content;
	private String writer;
	private String writeDate;
	private int hit;

	{
		// 초기화 블럭- 생성될 때 자동으로 한 번 실행된다.
		// 주로 기본값을 셋팅할 때 사용.
		// System.out.println("기본 초기화 블럭");
		no = 100;
	}
	static {
		// System.out.println("static 초기화 블럭");
		// no=50;
	}

	// 생성자 선언
	// case1:생성을 먼저 하고 값은 나중에 넣겠다.
	public BoardDTO() {
		// System.out.println("기본 생성자 실행");
		no = 50;
	} // 기본생성자를 직접 만들었다. new BoardDTO()로 호출.

	// case2:데이터를 넣을 때, 데이터가 다 준비 되어 있는 경우. -> 게시판 글보기 할 때 사용
	public BoardDTO(int no, String title, String content, String writer, String writeDate, int hit) {
		super(); // 부모 클래스를 생성한다. Object를 뜻함. 빼도 자동으로 들어간다. 무조건 제일 위에 있어야한다.
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
		this.hit = hit;
	}

	// case3:게시판 글쓰기 - 제목, 내용, 작성자, 데이터가 다 준비 되어 있는 경우.
	public BoardDTO(String title, String content, String writer) {
		// 위에 있는 this.가 붙은 변수를 불러오는 this()
		// 일종의 프로그램 재활용.
		this(0, title, content, writer, null, 0);

		// 위에 모든 데이터를 받아서 처리하는 부분에서 중복이 된다.
		// this.title = title;
		// this.content = content;
		// this.writer = writer;
	}

	// 데이터를 꺼내고 넣는 getter, setter를 작성
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", writeDate=" + writeDate + ", hit=" + hit + "]";
	}

}
