/*
 * NoticeListService
 * 20180416 유태선
 */
package com.foodtruck.notice.service;

import java.util.List;

import com.foodtruck.notice.dao.NoticeDAO;
import com.foodtruck.notice.dto.NoticeDTO;
import com.foodtruck.util.ServiceInterface;

public class NoticeListService implements ServiceInterface {

	public List<NoticeDTO> process() {
		System.out.println("BoardListService.process()");
		List<NoticeDTO> list = null;
		// list에 데이터를 가져와서 채우는 프로그램 작성.
		// 객체 생성하고 호출
		NoticeDAO boardDAO = new NoticeDAO();
		list = boardDAO.list();
		return list;
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
		System.out.println(getClass().getName()+".execute()");
		
		// list이므로 obj는 필요 없다.
		
		// list객체 생성
		List<NoticeDTO> list = null;
		
		// DAO에서 list를 받아온다.
		list = noticeDAO.list();
		
		return list;
	}
}
