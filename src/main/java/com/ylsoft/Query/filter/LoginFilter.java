package com.ylsoft.Query.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;


/**
 * 过滤器1:主要过滤静态页面，剔除几个登录注册还有首页的页面。
 */
@WebFilter(value = "/pages/*")
public class LoginFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
//        强转
        HttpServletRequest request = (HttpServletRequest) req;
        String uri = request.getRequestURI(); // 获取请求路径

        if (uri.contains("/pages/index.jsp") || uri.contains("/pages/register.jsp") || uri.contains("/pages/login.jsp")) {
            // 放行
            chain.doFilter(req, resp);
//        } else {
//            Object adminUser = request.getSession().getAttribute("user");
//            // 如果session里有这个对象,放行
//            if (adminUser != null) {
//                chain.doFilter(req, resp);
        } else {
            // 如果没有登录跳转到登录界面,给提示
//                request.setAttribute("loginErr", "您尚未登录,请登录");
            request.getRequestDispatcher("/pages/index.jsp").forward(request, resp);
        }
    }


    @Override
    public void destroy() {

    }
}
