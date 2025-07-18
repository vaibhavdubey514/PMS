package com.pms.controllers;

import java.io.IOException;

import com.pms.dao.UserDao;
import com.pms.models.User;
import com.pms.utils.PasswordUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		User user = UserDao.findUserByUserId(userId);
		boolean isMatch = user != null && PasswordUtil.verifyPassword(password, user.getPassword(), user.getSalt());
		if (isMatch) {
			session.setAttribute("name", user.getUserId());
		    session.setAttribute("role", user.getRole());
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			request.setAttribute("status", "error");
			dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		}

		if (dispatcher != null)
			dispatcher.forward(request, response);
	}
}
