package com.ylsoft.Query.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 过滤器2：过滤controller的请求，如果没有获取到登录里的session,无法访问
 */
@WebFilter(value = "/list/*")
public class LoginFilter2 implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
//        强转
        HttpServletRequest request = (HttpServletRequest) req;
//        String uri = request.getRequestURI(); // 获取请求路径
        Object adminUser = request.getSession().getAttribute("user");
        // 如果session里有这个对象,放行
        if (adminUser != null) {
            chain.doFilter(req, resp);
        } else {
            request.getRequestDispatcher("/pages/index.jsp").forward(request, resp);
        }
    }

    @Override
    public void destroy() {

    }
}
