package com.webjjang.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoIterable;
import com.webjjang.util.MongoDBUtil;

/**
 * Servlet implementation class DataController
 */
//@WebServlet("/DataController")
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static String pre = "/WEB-INF/data/";
	public static String suf = ".jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Servlet 접속 확인
//		System.out.println("BoardController.service()");
		
		// 데이터 처리 및 request에 담기 - 미완
		MongoDatabase mongoDatabase = MongoDBUtil.getConnection("seoulpopulation");
		MongoCollection<Document> mongoCollection = mongoDatabase.getCollection("earn");
		MongoIterable<Document> iterable = mongoCollection.find();
		MongoCursor<Document> mongoCursor = iterable.iterator();
		List<Document> list = new ArrayList<Document>();
//		System.out.println("객체 생성");
		while(mongoCursor.hasNext()) {
			Document document = mongoCursor.next();
			list.add(document);
		}
//		System.out.println("리스트 담기");
		request.setAttribute("list", list);
//		System.out.println("리퀘스트에 담기");
		
		// uri만들기
//		System.out.println(request.getMethod());
//		System.out.println(request.getServletPath());
		String uri = request.getRequestURI();
//		System.out.println(uri);
		String res = uri.substring(uri.indexOf(request.getServletPath()));
//		System.out.println(res);
//		String test = res.substring(1);
//		System.out.println(test);
		String jsp = pre+res.substring(1)+suf;
//		System.out.println(jsp);
		RequestDispatcher dispatcher = request.getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}

}
