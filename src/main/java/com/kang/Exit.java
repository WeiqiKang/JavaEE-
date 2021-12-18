package com.kang;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class Exit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        Cookie[] cookies = req.getCookies();

        for(int i = 0 ; i < cookies.length; i ++ )
        {
            cookies[i].setMaxAge(0);
            cookies[i].setPath("/");
            resp.addCookie(cookies[i]);
            cookies[i].setPath("/javaweb_war");
            resp.addCookie(cookies[i]);
        }

        resp.getWriter().write("注销成功！3秒后为你跳转到主页");

        resp.setHeader("refresh", "3;url=index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
