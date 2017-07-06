package com.vedisoft.danishhousing.filters;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import com.vedisoft.danishhousing.daos.UsersDao;
import com.vedisoft.danishhousing.pojos.Users;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();

		if (uri.endsWith("UserVerification") || uri.endsWith("index.jsp")) {
			chain.doFilter(request, response);
		} else {
			if (uri.endsWith(".jsp") || uri.indexOf(".") == -1) {
				HttpSession session = req.getSession();
				Users user = null;
				if (session != null) {
					user = (Users) session.getAttribute("userLogin");
					if (user != null) {
						int userId = UsersDao.verify(user.getEmail(), user.getPassword(), user.getUserType());
						if (userId == user.getUserId())
							chain.doFilter(request, response);
						else
							res.sendRedirect("../../index.jsp");
					} else
						res.sendRedirect("../../index.jsp");
				} else
					res.sendRedirect("../../index.jsp");
			} else
				chain.doFilter(request, response);
		}
	}
	public void destroy() {
	}

}
