package com.example.umaraliyevaemployeesalarycontrol.auth;

import com.example.umaraliyevaemployeesalarycontrol.entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth/verify/code")
public class VerifyEmailCode extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        String sessionCode = (String) req.getSession().getAttribute("verificationCode");
        if (sessionCode != null && sessionCode.equals(code)) {
            req.getSession().removeAttribute("verificationCode");
            req.getSession().setAttribute("user", new Users((String) req.getSession().getAttribute("userEmail"), ""));
            resp.sendRedirect("/employees.jsp");
        } else {
            req.setAttribute("error", "Kiritilgan kod noto‘g‘ri. Iltimos, qayta urinib ko‘ring.");
            req.getRequestDispatcher("/enter-code.jsp").forward(req, resp);
        }
    }
}
