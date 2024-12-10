package com.example.umaraliyevaemployeesalarycontrol.auth;


import com.example.umaraliyevaemployeesalarycontrol.entity.Users;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class Filter extends HttpFilter {
    List<String> openPaths = new ArrayList<>(
            List.of(
                    "/login.jsp",
                    "/auth/login",
                    "/enter-code.jsp",
                    "/auth/verify/code"
            ));

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        String requestURI = req.getRequestURI();
        if (openPaths.contains(requestURI)) {
            chain.doFilter(req, res);
            return;
        }
        Users currentUser = session != null ? (Users) session.getAttribute("user") : null;
        Boolean rememberMe = session != null && session.getAttribute("rememberMe") != null
                ? (Boolean) session.getAttribute("rememberMe")
                : false;

        if (currentUser == null && Boolean.TRUE.equals(rememberMe)) {
            String savedUserEmail = (String) session.getAttribute("userEmail");
            if (savedUserEmail != null) {
                Users rememberedUser = new Users(savedUserEmail, "");
                session.setAttribute("user", rememberedUser);
                res.sendRedirect("/employees.jsp");
                return;
            }
        }

        String verificationCode = session != null ? (String) session.getAttribute("verificationCode") : null;
        if (verificationCode != null && currentUser == null) {
            res.sendRedirect("/enter-code.jsp");
            return;
        }
        if (currentUser == null) {
            res.sendRedirect("/login.jsp");
            return;
        }
        chain.doFilter(req, res);
    }
}
