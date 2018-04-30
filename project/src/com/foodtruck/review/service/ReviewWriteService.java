package com.foodtruck.review.service;

import com.foodtruck.util.ServiceInterface;


import com.foodtruck.review.dao.ReviewDAO;
import com.foodtruck.review.dto.ReviewDTO;

public class ReviewWriteService implements ServiceInterface{
	
	// NullPointException이 나지 않도록 선언
	private ReviewDAO ReviewDAO;
	
	
	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.ReviewDAO = (ReviewDAO) obj;
	}

	
	@Override
	public Object execute(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName()+".execute()");
		System.out.println("우왕여기까지와버렸넹? 여기는 writeservices");
		System.out.println(obj);
		//캐스팅을 하여 사용 가능하게 바꾼다.
		ReviewDTO ReviewDTO = (ReviewDTO) obj;
		System.out.println(ReviewDTO);
		//DAO로 넘겨준다.
		ReviewDAO.write(ReviewDTO);
		
		return obj;
	}
}
