package com.foodtruck.notice.service;

import java.util.List;

import com.foodtruck.notice.dao.NoticeDAO;
import com.foodtruck.notice.dto.NoticeDTO;

public class NoticeListService {
	
	public List<NoticeDTO> process() {
		System.out.println("BoardListService.process()");
		List<NoticeDTO> list = null;
		// list에 데이터를 가져와서 채우는 프로그램 작성.
		// 객체 생성하고 호출
		NoticeDAO boardDAO = new NoticeDAO();
		list = boardDAO.list();
		return list;
	}
}
