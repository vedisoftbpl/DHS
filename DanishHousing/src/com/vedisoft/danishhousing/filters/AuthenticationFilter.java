package com.vedisoft.danishhousing.filters;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vedisoft.danishhousing.daos.UsersDao;
import com.vedisoft.danishhousing.pojos.Users;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		System.out.println("URI :" + uri);
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
						if (userId == user.getUserId()) {
							ArrayList<String> pages = (ArrayList<String>) session.getAttribute("userRights");
							if (pages.contains(uri)){
								System.out.println("URI found");
								chain.doFilter(request, response);
							}else
								res.sendRedirect("../../index.jsp");

						}

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
