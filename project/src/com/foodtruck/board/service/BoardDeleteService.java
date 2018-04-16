package com.foodtruck.board.service;

import com.foodtruck.board.dao.BoardDAO;

public class BoardDeleteService {
	public void process(int no) {
		System.out.println("BoardDeleteService.process()");
		// 객체 생성하고 호출
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.delete(no);
	}
}
