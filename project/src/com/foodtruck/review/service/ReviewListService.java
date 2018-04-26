package com.foodtruck.review.service;

import java.util.List;

import com.foodtruck.review.dao.ReviewDAO;
import com.foodtruck.review.dto.ReviewDTO;
import com.foodtruck.util.ServiceInterface;
import com.webjjang.board.dto.BDAO;
import com.webjjang.board.dto.BDTO;
import com.webjjang.util.PageObject2;

public class ReviewListService implements ServiceInterface {

	private ReviewDAO ReviewDAO;

	@Override
	public void setDAO(Object obj) {
		// TODO Auto-generated method stub
		this.ReviewDAO = (ReviewDAO) obj;
	}

	@Override
	public List<ReviewDTO> execute(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName()+".execute()");
		
		// list이므로 obj는 필요 없다.
		
		// list객체 생성
		List<ReviewDTO> list = null;
		
		// DAO에서 list를 받아온다.
		list = ReviewDAO.list((PageObject2) obj);
		
		return list;
	}
	public List<ReviewDTO> process(PageObject2 obj) {
		System.out.println("BList.process()");
		List<ReviewDTO> list = null;
		// list에 데이터를 가져와서 채우는 프로그램 작성.
		// 객체 생성하고 호출
		ReviewDAO bDAO = new ReviewDAO();
		list = bDAO.list((PageObject2)obj);
		return list;
	}
}
