package com.foodtruck.review.service;

import com.foodtruck.util.ServiceInterface;
import com.foodtruck.review.dao.ReviewDAO;
import com.foodtruck.review.dto.ReviewDTO;


public class ReviewUpdateService implements ServiceInterface {

	private ReviewDAO ReviewDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.ReviewDAO = (ReviewDAO) obj;
	}

	@Override
	public Object execute(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName() + ".execute()");
		// obj 캐스팅
		ReviewDTO ReviewDTO = (ReviewDTO) obj;
		// DAO로 넘겨준다
		ReviewDAO.update(ReviewDTO);
		return null;
	}
}
