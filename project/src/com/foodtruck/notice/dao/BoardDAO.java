package com.foodtruck.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodtruck.notice.dto.BoardDTO;
import com.foodtruck.util.DBUtil;

public class BoardDAO {
	// 오라클에 접속 할 때 필요한 정보들
	// DBUtil에 다 선언.

	// 글 리스트를 가져오는 메서드
	public List<BoardDTO> list() {
		System.out.println("BoardDAO.list()");
		List<BoardDTO> list = null;

		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		ResultSet rs = null; // 결과 객체

		try {
			// 1. 드라이버 확인 //2. 연결
			con = DBUtil.getConnection();
			// 3. sql
			String sql = "select no, title, writer, writedate, hit from board order by no desc ";
			// 4. 처리문 객체 생성.
			pstmt = con.prepareStatement(sql);
			// 5. 처리문 객체 실행 --> rs가 나온다.
			rs = pstmt.executeQuery();
			// 6. 표시 --> 데이터 담기
			while (rs.next()) {
				// 데이터가 있는데 list가 null이면 생성한다.
				if (list == null)
					list = new ArrayList<>();
				// 데이터 하나를 담을 수 있는 BoardDTO객체를 생성한다.
				BoardDTO boardDTO = new BoardDTO();
				// 데이터를 rs에서 꺼내서 boardDTO에 담는다.
				boardDTO.setNo(rs.getInt("no"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setWriter(rs.getString("writer"));
				boardDTO.setWriteDate(rs.getString("writedate"));
				boardDTO.setHit(rs.getInt("hit"));
				// list에 boardDTO를 담는다.
				list.add(boardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 객체 닫기
				DBUtil.close(con, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	// 글번호에 맞는 글보기 데이터를 가져오는 메서드.
	public BoardDTO view(int no) {
		System.out.println("BoardDAO.view()");
		BoardDTO boardDTO = null;
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		ResultSet rs = null; // 결과 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "select no, title, content, writer, writedate, hit from board where no = ? ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no); // 첫번재 ?에 no를 int로 세팅
			// 5. 처리 객체 실행
			rs = pstmt.executeQuery();
			// 6. 표시 rs에서 꺼내서 boardDTO에 담는다.
			if (rs.next()) {
				// 생성자가 만들어져 있어야 한다.
				boardDTO = new BoardDTO(rs.getInt("no"), rs.getString("title"), rs.getString("content"),
						rs.getString("writer"), rs.getString("writeDate"), rs.getInt("hit"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 종료
				DBUtil.close(con, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return boardDTO;
	}

	// 조회수를 1 증가시키는 메서드. -> 글번호를 받아서 글번호에 맞는 조회수 증가.
	public void increase(int no) {
		System.out.println("BoardDAO.increase()");
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "update board set hit = hit + 1 where no = ? ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no); // 첫번재 ?에 no를 int로 세팅
			// 5. 처리 객체 실행 -> select: executeQuery(), 그 외: executeUpdate()
			pstmt.executeUpdate();
			// 6. 표시 -> 오류가 없으면 정상처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 종료
				DBUtil.close(con, pstmt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판 글쓰기 처리
	public void write(BoardDTO boardDTO) {
		System.out.println("BoardDAO.write()");
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "insert into board(no, title, content, writer) values(board_seq.nextval, ?, ?, ?) ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getTitle()); // 첫번재 ?에 no 세팅
			pstmt.setString(2, boardDTO.getContent()); // 첫번재 ?에 no 세팅
			pstmt.setString(3, boardDTO.getWriter()); // 첫번재 ?에 no 세팅
			// 5. 처리 객체 실행 -> select: executeQuery(), 그 외: executeUpdate()
			pstmt.executeUpdate();
			// 6. 표시 -> 오류가 없으면 정상처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 종료
				DBUtil.close(con, pstmt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판 글수정 처리
	public void update(BoardDTO boardDTO) {
		System.out.println("BoardDAO.update()");
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "update board set title=?, content=?, writer=? where no = ? ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getTitle()); // 첫번재 ?에 title 세팅
			pstmt.setString(2, boardDTO.getContent()); // 두번재 ?에 content 세팅
			pstmt.setString(3, boardDTO.getWriter()); // 세번재 ?에 writer 세팅
			pstmt.setInt(4, boardDTO.getNo()); // 네번재 ?에 no 세팅
			// 5. 처리 객체 실행 -> select: executeQuery(), 그 외: executeUpdate()
			pstmt.executeUpdate();
			// 6. 표시 -> 오류가 없으면 정상처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 종료
				DBUtil.close(con, pstmt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판 글삭제 처리
	public void delete(int no) {
		System.out.println("BoardDAO.delete()");
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "delete from board where no = ? ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(4, no); // 첫번재 ?에 no 세팅
			// 5. 처리 객체 실행 -> select: executeQuery(), 그 외: executeUpdate()
			pstmt.executeUpdate();
			// 6. 표시 -> 오류가 없으면 정상처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 종료
				DBUtil.close(con, pstmt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
