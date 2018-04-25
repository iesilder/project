package com.foodtruck.review.service;

import com.foodtruck.review.dao.ReviewDAO;
import com.foodtruck.review.dto.ReviewDTO;
import com.foodtruck.util.ServiceInterface;

public class ReviewDeleteService implements ServiceInterface {

	private ReviewDAO ReviewDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.ReviewDAO = (ReviewDAO) obj;
	}

	@Override
	public Object execute(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName() + "execute()");

		// 전달 받은 데이터를 DAO로 넘겨주기 위해서 Object를 캐스팅
		ReviewDTO ReviewDTO = (ReviewDTO) obj;
		// DAO로 넘겨 삭제를 진행한다.
		ReviewDAO.delete(ReviewDTO);

		return null;
	}
}
