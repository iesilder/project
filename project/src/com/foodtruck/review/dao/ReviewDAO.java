package com.foodtruck.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodtruck.review.dto.ReviewDTO;
import com.foodtruck.util.DBUtil;
import com.webjjang.util.PageObject2;

public class ReviewDAO {
	// 오라클에 접속 할 때 필요한 정보들
	// DBUtil에 다 선언.

	// 글 리스트를 가져오는 메서드
	public List<ReviewDTO> list(PageObject2 pageObject) {
		System.out.println("ReviewDAO.list()");
		List<ReviewDTO> list = null;

		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		ResultSet rs = null; // 결과 객체
		System.out.println("다오둥가둥가");

		try {
			// 1. 드라이버 확인 //2. 연결
			con = DBUtil.getConnection();
			// 3. sql
			// 1) 원래 데이터를 순서에 맞게 가져온다.
			String sql = "select rno,festloc,festdate,content,fname,fmemberboard.maindish,starscore,score,reviewboard.hit from fest,fmemberboard,REVIEWBOARD order by rno desc" ;
			sql = " select rownum rnum,rno,festloc,content,festdate,fname,maindish,starscore,score,hit from (" + sql + ")";
			sql = " select * from (" + sql + ")" + "where rnum between ? and ? ";

			// 2) 순서에 맞게 가져온 데이터에 rownum rnum을 붙인다.
			// 4. 처리문 객체 생성.
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageObject.getStartRow());
			pstmt.setInt(2, pageObject.getEndRow());
			// 5. 처리문 객체 실행 --> rs가 나온다.
			rs = pstmt.executeQuery();
			// 6. 표시 --> 데이터 담기
			while (rs.next()) {
				// 데이터가 있는데 list가 null이면 생성한다.
				if (list == null)
					list = new ArrayList<>();
				// 데이터 하나를 담을 수 있는 BoardDTO객체를 생성한다.
				ReviewDTO reviewDTO = new ReviewDTO(rs.getInt("rno"), rs.getInt("score"), rs.getInt("hit"),
						rs.getString("content"),rs.getString("fname"),rs.getString("festdate"),
						rs.getString("maindish"), rs.getString("festloc"),rs.getString("starscore"));
						

				// list에 boardDTO를 담는다.
				list.add(reviewDTO);
				System.out.println(reviewDTO);

			}
			System.out.println("다오둥가둥가");
			

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
		System.out.println(list);
		return list;
	}

	// 글번호에 맞는 글보기 데이터를 가져오는 메서드.
	public ReviewDTO view(int rno) {
		System.out.println("ReviewDAO.view()");
		ReviewDTO ReviewDTO = null;
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		ResultSet rs = null; // 결과 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "select rno,score,re.hit hit,re.id id,fname,fm.maindish maindish,festloc,content,"
					+ "writedate,festdate,starscore"
					+ " from fest,reviewboard re,fmemberboard fm where rno = ? ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno); // 첫번재 ?에 no를 int로 세팅
			// 5. 처리 객체 실행
			rs = pstmt.executeQuery();
			// 6. 표시 rs에서 꺼내서 boardDTO에 담는다.
			if (rs.next()) {
				// 생성자가 만들어져 있어야 한다.
				ReviewDTO = new ReviewDTO(rs.getInt("rno"), rs.getInt("score"), rs.getInt("hit"), rs.getString("id"),
						rs.getString("fname"), rs.getString("maindish"), rs.getString("festloc"),
						rs.getString("content"), rs.getString("writedate"), rs.getString("festdate"),
						rs.getString("starscore"));
			}
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
			System.out.println(ReviewDTO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 종료
				System.out.println(ReviewDTO);
				DBUtil.close(con, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ReviewDTO;
	}

	// 조회수를 1 증가시키는 메서드. -> 글번호를 받아서 글번호에 맞는 조회수 증가.
	public void increase(int no) {
		System.out.println("ReviewDAO.increase()");
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "update reviewboard set hit = hit + 1 where no = ? ";
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
	public void write(ReviewDTO ReviewDTO) {
		System.out.println("ReviewDAO.write()");
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "insert into reviewboard(rno,starscore, content,score) "
					+ "values(reviewboard_seq.nextval, ?,?,?) ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
			// pstmt.setInt(1, ReviewDTO.getScore()); // 첫번재 ?에 no 세팅
			pstmt.setString(1, ReviewDTO.getStarscore()); // 첫번재 ?에 no 세팅
			pstmt.setString(2, ReviewDTO.getContent()); // 첫번재 ?에 no 세팅
			pstmt.setInt(3, ReviewDTO.getScore());

			
			System.out.println(ReviewDTO.getStarscore());
			// pstmt.setInt(3, ReviewDTO.getScore()); // 첫번재 ?에 no 세팅
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
	public ReviewDTO update(ReviewDTO ReviewDTO) {
		System.out.println("ReviewDAO.update()");
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "update reviewboard set content=?,starscore=?,score=? where rno = ? ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, ReviewDTO.getId()); // 첫번재 ?에 title 세팅
			
			pstmt.setString(1, ReviewDTO.getContent()); // 두번재 ?에 content 세팅
			pstmt.setString(2, ReviewDTO.getStarscore()); // 네번재 ?에 no 세팅
			pstmt.setInt(3, ReviewDTO.getScore()); // 네번재 ?에 no 세팅
			pstmt.setInt(4,  ReviewDTO.getRno());
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
		return ReviewDTO;
	}

	// 게시판 글삭제 처리
	public void delete(int no) {
		System.out.println("ReviewDAO.delete()");
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성.
		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1.드라이버 확인 //2.연결
			con = DBUtil.getConnection();
			// 3. sql 작성 - 변하는 데이터 대신 ?를 사용한다.
			String sql = "delete from reviewboard where rno = ? ";
			// 4. 처리 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no); // 첫번재 ?에 no 세팅
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
