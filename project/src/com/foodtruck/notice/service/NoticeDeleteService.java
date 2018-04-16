package com.foodtruck.notice.service;

import com.foodtruck.notice.dao.NoticeDAO;

public class NoticeDeleteService {
	public void process(int no) {
		System.out.println("BoardDeleteService.process()");
		// 객체 생성하고 호출
		NoticeDAO boardDAO = new NoticeDAO();
		boardDAO.delete(no);
	}
}
