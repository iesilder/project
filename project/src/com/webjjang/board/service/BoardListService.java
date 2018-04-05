package com.webjjang.board.service;

import java.util.List;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.dto.BoardDTO;

public class BoardListService {
	
	public List<BoardDTO> process() {
		System.out.println("BoardListService.process()");
		List<BoardDTO> list = null;
		// list에 데이터를 가져와서 채우는 프로그램 작성.
		// 객체 생성하고 호출
		BoardDAO boardDAO = new BoardDAO();
		list = boardDAO.list();
		return list;
	}
}
