package com.example.umaraliyevaemployeesalarycontrol.auth;

import com.example.umaraliyevaemployeesalarycontrol.entity.Users;
import com.example.umaraliyevaemployeesalarycontrol.mail.GmailService;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> errors = new HashMap<>();
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String rememberMe = req.getParameter("rememberMe");

        Users user = new Users(email, password);
        Set<ConstraintViolation<Users>> validate = validator.validate(user);

        for (ConstraintViolation<Users> validation : validate) {
            errors.put(validation.getPropertyPath().toString(), validation.getMessage());
        }

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        String randomCode = String.valueOf((int) (Math.random() * 9000) + 1000);
        req.getSession().setAttribute("verificationCode", randomCode);

        try {
            GmailService.send(randomCode, email);
        } catch (MessagingException e) {
            errors.put("email", "Kod yuborishda muammo yuz berdi.");
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        if ("on".equals(rememberMe)) {
            req.getSession().setAttribute("rememberMe", true);
            req.getSession().setAttribute("userEmail", email);
            req.getSession().setAttribute("user", user);
        }

        resp.sendRedirect("/enter-code.jsp");

    }
}
