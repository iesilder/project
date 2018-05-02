package com.foodtruck.review.service;

import java.util.ArrayList;

import com.foodtruck.review.dao.ReviewDAO;
import com.foodtruck.review.dto.ReviewDTO;
import com.foodtruck.util.ServiceInterface;

public class ReviewUpdateService implements ServiceInterface {

	private ReviewDAO reviewDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.reviewDAO = (ReviewDAO) obj;
	}

	public Integer execute(Object obj, int rno) throws Exception {
		System.out.println("ReviewUpdateService.excute()");
		// 객체 생성하고 호출
		
		@SuppressWarnings("unchecked")
		ArrayList<Object> list = (ArrayList<Object>) obj;
		
		rno =(int) list.get(0);
		boolean isView = (boolean) list.get(1);
		ReviewDTO reviewDTO = null; 
		
		
		reviewDTO = reviewDAO.update(reviewDTO,rno);
		System.out.println(reviewDTO);
		return rno;
		
	}

	@Override
	public Object execute(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
