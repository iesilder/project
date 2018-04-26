package com.foodtruck.fest.service;

import java.util.List;

import javax.servlet.ServletException;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.dto.BoardDTO;
import com.webjjang.util.PageObject2;
import com.webjjang.util.ServInt;

public class FestListService implements ServInt {

	private BoardDAO boardDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.boardDAO = (BoardDAO) obj;
	}

	@Override
	// 리스트에 페이징 및 검색 기능 추후 추가 예정
	public List<BoardDTO> excute(Object obj) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("BoardListService.excute()");
		List<BoardDTO> list = null;
		// list에 데이터를 가져와서 채우는 프로그램 작성
		// 호출만
		list = boardDAO.list((PageObject2) obj);
		return list;
	}
}
