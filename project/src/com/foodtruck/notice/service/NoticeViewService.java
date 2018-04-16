/*
 * NoticeViewService
 * 20180416 유태선
 */
package com.foodtruck.notice.service;

import com.foodtruck.notice.dao.NoticeDAO;
import com.foodtruck.notice.dto.NoticeDTO;
import com.foodtruck.util.ServiceInterface;

public class NoticeViewService implements ServiceInterface {
	// 1. 글번호에 맞는 글의 조회수를 1증가시킨다.
	// 2.글번호를 받아서 알맞는 데이터를 가져온다.
	public NoticeDTO process(int no) {
		System.out.println("BoardViewService.process()");
		NoticeDTO boardDTO = null;
		NoticeDAO boardDAO = new NoticeDAO();
		// 글 번호에 맞는 boardDTO에 데이터를 가져와서 채우는 프로그램 작성.
		// 객체 생성하고 호출
		// 1. 1증가시킨다.
		boardDAO.increase(no);
		// 2. 글을 가져온다.
		boardDTO = boardDAO.view(no);
		return boardDTO;

	}

	private NoticeDAO noticeDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.noticeDAO = (NoticeDAO) obj;
	}

	@Override
	public Object execute(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName() + ".execute()");

		// obj를 캐스팅하여 넘긴다.
		int no = (int) obj;
		// 담을 객체 생성
		NoticeDTO noticeDTO = null;

		// 숫자를 하나 올린다.
		noticeDAO.increase(no);

		// dao에서 담아온다.
		noticeDTO = noticeDAO.view(no);

		return noticeDTO;
	}
}
