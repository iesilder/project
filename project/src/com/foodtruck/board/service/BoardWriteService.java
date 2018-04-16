package com.foodtruck.board.service;

import com.foodtruck.board.dao.BoardDAO;
import com.foodtruck.board.dto.BoardDTO;

public class BoardWriteService {
	public void process(BoardDTO boardDTO) {
		System.out.println("BoardWriteService.process()");
		// 객체 생성하고 호출
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.write(boardDTO);
	}
}
