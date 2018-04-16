package com.foodtruck.data.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodtruck.util.Beans;

/**
 * Servlet implementation class DataController
 */
@WebServlet("/DataController")
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DataController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName() + ".doGet()");
		String command = Beans.getURI(request);
		String jsp = "";
		System.out.println(command);

		switch (command) {

		case "/data/admin.do":
			jsp = Beans.getJsp(command);
			System.out.println(jsp);
			break;
		default:
			System.out.println("존재하지 않는 자원을 요청");
			jsp = "/WEB-INF/views/error/404.jsp";
			break;
		}
		// jsp쪽으로 이동한다.
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(getClass().getName() + ".doPost()");
		String command = Beans.getURI(request);
		String jsp = "";
		System.out.println(command);

		switch (command) {

		case "/data/admin.do":
			jsp = Beans.getJsp(command);
			System.out.println(jsp);
			break;
		default:
			System.out.println("존재하지 않는 자원을 요청");
			jsp = "/WEB-INF/views/error/404.jsp";
			break;
		}
		// jsp쪽으로 이동한다.
		response.sendRedirect(jsp);
	}

}
