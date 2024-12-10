package com.example.umaraliyevaemployeesalarycontrol.servlets;

import com.example.umaraliyevaemployeesalarycontrol.entity.EmployeeSalary;
import com.example.umaraliyevaemployeesalarycontrol.repo.EmployeeRepo;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.example.umaraliyevaemployeesalarycontrol.config.MyListener.EMF;

@WebServlet("/add/employee")
public class AddEmployeeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            Double salaryAmount = Double.parseDouble(req.getParameter("salaryAmount"));
            EmployeeSalary employeeSalary = new EmployeeSalary(
                    firstName, lastName, salaryAmount);
            EmployeeRepo employeeRepo= new EmployeeRepo();
            employeeRepo.save(employeeSalary);
            resp.sendRedirect("/employees.jsp");

    }
}
