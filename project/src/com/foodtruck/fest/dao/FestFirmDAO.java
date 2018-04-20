package com.foodtruck.fest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodtruck.fest.dto.FestFirmDTO;
import com.foodtruck.util.DBUtil;
import com.webjjang.util.PageObject2;

public class FestFirmDAO {

	// 오라클에 접속할때 필요한 정보들
	// DBUtil에 다 선언함.

	// 글리스트를 가져오는 메서드
	public List<FestFirmDTO> list(PageObject2 pgObj) {
		System.out.println(getClass().getName() + ".list()");
		List<FestFirmDTO> list = null;
		// RDBMS에서 데이터를 가져 오는 프로그램 작성

		// 필요한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		ResultSet rs = null; // 결과 객체

		try {
			// 1. 드라이버 확인 //2. 연결
			con = DBUtil.getConnection();
			// 3. sql
			// 3-1. 원래 데이터를 순서에 맞게 가져온다.
			String sql = "select truckno, country, maindish, mngrname, mngrtel, hit from festfirmboard order by truckno desc ";
			// 3-2. 순서에 맞게 가져온 데이터에 rowNum을 붙인다.
			sql = "select rownum rnum, truckno, country, maindish, mngrname, mngrtel, hit from (" + sql + ")";
			// 3-3. 페이지에 맞는 startRow, endRow를 설정한다.
			sql = "select * from (" + sql + ") where rnum between ? and ?";
			// 4. 처리문 객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pgObj.getStartRow());
			pstmt.setInt(2, pgObj.getEndRow());
			// 5. 실행 -- select ->rs이 나온다.
			rs = pstmt.executeQuery();
			// 6. 표시 --> 데이터 담기
			while (rs.next()) {
				// 데이터가 있는데 list가 null이면 생성한다.
				if (list == null)
					list = new ArrayList<>();
				// 데이터 하나를 담을 수 있는 FestDTO 객체를 생성한다.
				FestFirmDTO festFirmDTO = new FestFirmDTO();
				// 데이터를 rs에서 꺼내서 festFirmDTO에 담는다.
				festFirmDTO.setTruckno(rs.getInt("truckno"));
				festFirmDTO.setCountry(rs.getString("country"));
				festFirmDTO.setMaindish(rs.getString("maindish"));
				festFirmDTO.setMngrname(rs.getString("mngrname"));
				festFirmDTO.setMngrtel(rs.getString("mngrtel"));
				festFirmDTO.setHit(rs.getInt("hit"));
				// list에 festFirmDTO를 담는다.
				list.add(festFirmDTO);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 객체 닫기
				DBUtil.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return list;

	}

	// 글번호에 맞는 글보기 데이터를 가져오는 메서드
	public FestFirmDTO view(int festno) {
		System.out.println(getClass().getName() + ".view()");
		FestFirmDTO festFirmDTO = null;
		// 오라클에서 데이터를 가져와서 채우는 프로그램 작성(생략)
		// 사용한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		ResultSet rs = null; // 결과 객체
		try {
			// 1. 드라이버 확인 //2. 연결
			con = DBUtil.getConnection();
			// 3. sql문 작성
			String sql = "select truckno, country, maindish, predppl, applyppl, readyfood, mngrname, mngrtel, hit from festfirmboard "
					+ " where truckno = ? "; // 변하는
			// 사용
			// 4. 처리문 객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, festno); // 첫번째 ?에 no를 int로 셋팅
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 rs에서 꺼내서 FestDTO에 담는다.
			if (rs.next()) {
				// 생성자가 만들어져 있어야 한다.
				festFirmDTO = new FestFirmDTO(rs.getInt("truckno"), rs.getString("country"), rs.getString("maindish"),
						rs.getInt("predppl"), rs.getInt("applyppl"), rs.getInt("readyfood"), rs.getString("mngrname"),
						rs.getString("mngrtel"), rs.getInt("hit"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				DBUtil.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return festFirmDTO;
	}

	// 게시판 글쓰기 처리.
	public void write(FestFirmDTO festFirmDTO) {
		System.out.println(getClass().getName() + ".write()");
		// 사용한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1. 드라이버 확인 //2. 연결
			con = DBUtil.getConnection();
			// 3. sql문 작성
			String sql = "insert into festfirmboard(truckno, country, maindish, predppl, applyppl, readyfood, mngrname, mngrtel) "
					+ " values(festfirmboard_seq.nextval, ?, ?, ?, ? ,?, ?, ?) "; // 변하는 데이터 대신 ? 사용
			// 4. 처리문 객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, festFirmDTO.getCountry());
			pstmt.setString(2, festFirmDTO.getMaindish());
			pstmt.setInt(3, festFirmDTO.getPredppl());
			pstmt.setInt(4, festFirmDTO.getApplyppl());
			pstmt.setInt(5, festFirmDTO.getReadyfood());
			pstmt.setString(6, festFirmDTO.getMngrname());
			pstmt.setString(7, festFirmDTO.getMngrtel());
			// 5. 실행 -> select: executeQuery()
			// insert, update, delete:executeUpdate()
			pstmt.executeUpdate();
			// 6. 표시 -> 오류가 없으면 정상처리
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				DBUtil.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	// 조회수를 1증가 시키는 메서드 -> 글번호를 받아서 글번호에 맞는 조회수 증가.
	public void increase(int festno) {
		System.out.println(getClass().getName() + ".increase()");
		// 사용한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1. 드라이버 확인 //2. 연결
			con = DBUtil.getConnection();
			// 3. sql문 작성
			String sql = "update festfirmboard set hit = hit + 1 where truckno = ? "; // 변하는 데이터 대신 ? 사용
			// 4. 처리문 객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, festno); // 첫번째 ?에 no를 int로 셋팅
			// 5. 실행 -> select: executeQuery()
			// insert, update, delete:executeUpdate()
			pstmt.executeUpdate();
			// 6. 표시 -> 오류가 없으면 정상처리
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				DBUtil.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	// 게시판 글수정 처리.
	public void update(FestFirmDTO festFirmDTO) {
		System.out.println(getClass().getName() + ".update()");
		// 사용한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1. 드라이버 확인 //2. 연결
			con = DBUtil.getConnection();
			// 3. sql문 작성
			String sql = "update festfirmboard set country = ?, maindish = ?, predppl = ?, applyppl=?, readyfood=?, mngrname= ?, mngrtel=? "
					+ " where truckno = ? "; // 변하는 데이터 대신
			// ? 사용
			// 4. 처리문 객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, festFirmDTO.getCountry());
			pstmt.setString(2, festFirmDTO.getMaindish());
			pstmt.setInt(3, festFirmDTO.getPredppl());
			pstmt.setInt(4, festFirmDTO.getApplyppl());
			pstmt.setInt(5, festFirmDTO.getReadyfood());
			pstmt.setString(6, festFirmDTO.getMngrname());
			pstmt.setString(7, festFirmDTO.getMngrtel());
			// 5. 실행 -> select: executeQuery()
			// insert, update, delete:executeUpdate()
			pstmt.executeUpdate();
			// 6. 표시 -> 오류가 없으면 정상처리
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				DBUtil.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	// 게시판 글삭제 처리
	public void delete(int festno) {
		System.out.println(getClass().getName() + ".delete()");
		// 사용한 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 처리문 객체
		try {
			// 1. 드라이버 확인 //2. 연결
			con = DBUtil.getConnection();
			// 3. sql문 작성
			String sql = "delete from festfirmboard " + " where truckno = ?"; // 변하는 데이터 대신 ? 사용
			// 4. 처리문 객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, festno);
			// 5. 실행 -> select: executeQuery()
			// insert, update, delete:executeUpdate()
			pstmt.executeUpdate();
			// 6. 표시 -> 오류가 없으면 정상처리
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				DBUtil.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

}
