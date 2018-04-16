package com.foodtruck.notice.service;

import com.foodtruck.notice.dao.BoardDAO;
import com.foodtruck.notice.dto.BoardDTO;

public class BoardUpdateService {
	public void process(BoardDTO boardDTO) {
		System.out.println("BoardUpdateService.process()");
		// 객체 생성하고 호출
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.update(boardDTO);
	}
}
