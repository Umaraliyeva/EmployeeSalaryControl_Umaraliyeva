package com.example.umaraliyevaemployeesalarycontrol.servlets;

import com.example.umaraliyevaemployeesalarycontrol.entity.EmployeeSalary;
import com.example.umaraliyevaemployeesalarycontrol.entity.SalaryPayment;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

import static com.example.umaraliyevaemployeesalarycontrol.config.MyListener.EMF;

@WebServlet("/add/payment")
public class AddPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            int employeeId = Integer.parseInt(req.getParameter("id"));
            double amount = Double.parseDouble(req.getParameter("amount"));
            String payType = req.getParameter("payType");
            entityManager.getTransaction().begin();
            EmployeeSalary employeeSalary = entityManager.find(EmployeeSalary.class, employeeId);
            SalaryPayment salaryPayment= new SalaryPayment(
                    payType,
                    LocalDateTime.now(),
                    amount,
                    employeeSalary
            );
            entityManager.persist(salaryPayment);
            entityManager.getTransaction().commit();
            resp.sendRedirect("/employees.jsp");
        }
    }
}
