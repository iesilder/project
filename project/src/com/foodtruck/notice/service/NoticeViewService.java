/*
 * NoticeViewService
 * 20180416 유태선
 */
package com.foodtruck.notice.service;

import com.foodtruck.notice.dao.NoticeDAO;
import com.foodtruck.notice.dto.NoticeDTO;
import com.foodtruck.util.ServiceInterface;

public class NoticeViewService implements ServiceInterface {

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
		NoticeDTO noticeDTO = (NoticeDTO) obj;

		// 숫자를 하나 올린다.
		noticeDAO.increase(noticeDTO);

		// dao에서 담아온다.
		noticeDTO = noticeDAO.view(noticeDTO);

		return noticeDTO;
	}
}
