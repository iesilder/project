package com.foodtruck.review.service;

import com.foodtruck.util.ServiceInterface;

import java.util.ArrayList;

import com.foodtruck.review.dao.ReviewDAO;


public abstract class ReviewUpdateService implements ServiceInterface {

	@SuppressWarnings("unused")
	private ReviewDAO ReviewDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.ReviewDAO = (ReviewDAO) obj;
	}

	public Object execute(ArrayList<Object> list) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName() + ".execute()");
		// obj 캐스팅
//		if(!isView) ReviewDAO.increase(no);
		Object[] obj =list.toArray();
		System.out.println(obj[0]);
		
		
		
		// dao에서 담아온다.
//		ReviewDAO.update((ReviewDTO) boardDTO);
		// DAO로 넘겨준다
//		ReviewDAO.update((ReviewDTO) obj);
		return 1;
	}

}
