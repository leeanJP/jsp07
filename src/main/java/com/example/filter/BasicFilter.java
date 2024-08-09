package com.example.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public class BasicFilter implements Filter {
    FilterConfig config;

    //필터를 초기화 할 때 호출
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
        String filterName = filterConfig.getFilterName();
        System.out.println("Basic Filter : init() 호출됨 :: " + filterName);

    }
    //필터를 리소스에 적용할 때 마다 호출
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        String initParam = config.getInitParameter("FILTER_INIT_PARAM");

        System.out.println("BasicFilter 초기화 매개변수 : " + initParam);

        String method = ((HttpServletRequest)request).getMethod();

        System.out.println("BasicFilter 전송 방식 : " + method);

        chain.doFilter(request,response);
    }
    //필터가 소멸될 때 호출
    @Override
    public void destroy() {
        System.out.println("BasicFilter destroy() 호출됨");
    }

}
