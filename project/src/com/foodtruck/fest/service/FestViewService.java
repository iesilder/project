package com.foodtruck.fest.service;

import java.util.ArrayList;

import com.foodtruck.fest.dao.FestDAO;
import com.foodtruck.fest.dto.FestDTO;
import com.foodtruck.util.ServiceInterface;

public class FestViewService implements ServiceInterface {

	private FestDAO festDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.festDAO = (FestDAO) obj;
	}

	@Override
	public FestDTO execute(Object objs) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("FestViewService.excute()");
		// 원래는 excute()에 타입을 선언하였으나, ServInt에는 하나만 받을 수 있게 하였다
		// 따라서 두개인 타입을 ArrayList<>에 넣어서 꺼내 사용한다.
		@SuppressWarnings("unchecked")
		ArrayList<Object> excuteObj = (ArrayList<Object>) objs;
		int festno = (int) excuteObj.get(0);
		boolean isView = (boolean) excuteObj.get(1);

		FestDTO festDTO = null;
		// list에 데이터를 가져와서 채우는 프로그램 작성
		// 객체 생성하고 호출
		if (isView)
			festDAO.increase(festno); // 글보기일 때만 조회수 1증가
		festDTO = festDAO.view(festno);
		return festDTO;
	}
}
