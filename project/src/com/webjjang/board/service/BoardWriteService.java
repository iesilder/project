package com.webjjang.board.service;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.dto.BoardDTO;

public class BoardWriteService {
	public void process(BoardDTO boardDTO) {
		System.out.println("BoardWriteService.process()");
		// 객체 생성하고 호출
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.write(boardDTO);
	}
}
