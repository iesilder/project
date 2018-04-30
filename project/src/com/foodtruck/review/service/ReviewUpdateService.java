package com.foodtruck.review.service;

import com.foodtruck.util.ServiceInterface;

import java.util.ArrayList;

import com.foodtruck.review.dao.ReviewDAO;
import com.foodtruck.review.dto.ReviewDTO;


public class ReviewUpdateService implements ServiceInterface {

	private ReviewDAO ReviewDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.ReviewDAO = (ReviewDAO) obj;
	}

	public Object execute(Object obj,int no) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName() + ".execute()");
		// obj 캐스팅
		System.out.println(no);
//		@SuppressWarnings("unchecked")
//		ArrayList<Object> list = (ArrayList<Object>) obj;
//		int no =(int) list.get(0);
//		boolean isView = (boolean) list.get(1);
		ReviewDTO reviewDTO = (ReviewDTO) obj;
//		if(!isView) ReviewDAO.increase(no);
		
		// dao에서 담아온다.
		reviewDTO = ReviewDAO.update(reviewDTO, no);
		// DAO로 넘겨준다
//		ReviewDAO.update((ReviewDTO) obj);
		System.out.println(reviewDTO);
		return reviewDTO;
	}

	@Override
	public Object execute(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
