package com.jhta.allchwi.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;



public class LoginCheckFilter implements Filter {
	private List<String> excludedUrls;
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String excludePattern = filterConfig.getInitParameter("excludedUrls");
	    excludedUrls = Arrays.asList(excludePattern.split(","));
	    System.out.println(excludedUrls);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		boolean isRedirect = false;
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		String path = req.getRequestURI();
		System.out.println(path);
		int count = StringUtils.countOccurrencesOf(path, "/");
		System.out.println(count);
		if(count > 2) {
			path = path.split("/")[2];
			System.out.println(path);
		}
		
		System.out.println(excludedUrls.contains(path));
		if(!excludedUrls.contains(path) && !path.equals("/allchwi/"))
		{
			System.out.println("go : " + path);
			Integer ml_num = (Integer)req.getSession().getAttribute("ml_num");
			if(ml_num==null) {
				isRedirect = true;
			}
		}
		
		if(isRedirect == true){
			req.getRequestDispatcher("/login/main").forward(req, resp);
		}else {
			chain.doFilter(req, resp);
		}		 
	}

	@Override
	public void destroy() {
		
	}

}
