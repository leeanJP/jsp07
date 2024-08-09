package com.example.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter(filterName = "AnnoFilter" , urlPatterns = "/15/AnnoFilter.jsp")
public class AnnoFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String filterName = filterConfig.getFilterName();
        System.out.println("AnnoFilter : init() 호출됨 :: " + filterName);
    }


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String searchFiled = request.getParameter("searchFiled");
        String searchWord = request.getParameter("searchWord");

        System.out.println("검색 필드 " + searchFiled);
        System.out.println("검색어 " + searchWord);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("AnnoFilter destroy() 호출됨");
    }
}
