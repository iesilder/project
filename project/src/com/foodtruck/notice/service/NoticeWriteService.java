package com.foodtruck.notice.service;

import com.foodtruck.notice.dao.NoticeDAO;
import com.foodtruck.notice.dto.NoticeDTO;

public class NoticeWriteService {
	public void process(NoticeDTO boardDTO) {
		System.out.println("BoardWriteService.process()");
		// 객체 생성하고 호출
		NoticeDAO boardDAO = new NoticeDAO();
		boardDAO.write(boardDTO);
	}
}
