package com.example.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.util.Enumeration;

public class ContextListener implements ServletContextListener {
    //웹 애플리케이션 시작이베튼를 감지
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        Enumeration<String> apps = sce.getServletContext().getInitParameterNames();

        while (apps.hasMoreElements()) {
            
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContextListener.super.contextDestroyed(sce);
    }
}
