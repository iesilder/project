package com.webjjang.board.service;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.dto.BoardDTO;

public class BoardUpdateService {
	public void process(BoardDTO boardDTO) {
		System.out.println("BoardUpdateService.process()");
		// 객체 생성하고 호출
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.update(boardDTO);
	}
}
