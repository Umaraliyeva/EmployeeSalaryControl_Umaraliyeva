package com.example.umaraliyevaemployeesalarycontrol.repo;

import com.example.umaraliyevaemployeesalarycontrol.entity.EmployeeSalary;
import com.example.umaraliyevaemployeesalarycontrol.entity.SalaryPayment;
import com.example.umaraliyevaemployeesalarycontrol.entity.abs.BaseRepo;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.example.umaraliyevaemployeesalarycontrol.config.MyListener.EMF;

public class EmployeeRepo extends BaseRepo<EmployeeSalary> {

    @SuppressWarnings("all")
    public static List<EmployeeSalary> allEmployees() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("from EmployeeSalary ", EmployeeSalary.class)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static EmployeeSalary findEmployeeById(int employeeId) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(EmployeeSalary.class, employeeId);
        }
    }

    public static List<SalaryPayment> findPaymentsByEmployeeId(int employeeId) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("SELECT s FROM SalaryPayment s WHERE s.employeeSalary.id = :employeeId",
                            SalaryPayment.class)
                    .setParameter("employeeId", employeeId)
                    .getResultList();
        }
    }
@SuppressWarnings("all")
    public static List<EmployeeSalary> findFullyPaidEmployees() {

        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createNativeQuery("""
            SELECT
                em.id,
                em.firstname,
                em.lastname,
                em.salary
            FROM
                employeesalary em
            JOIN
                public.salarypayment s
                ON em.id = s.employeesalary_id
            GROUP BY
                em.id, em.firstname, em.lastname, em.salary
            HAVING
                em.salary = SUM(s.amount)
                AND em.salary - SUM(s.amount) = 0;
            """, EmployeeSalary.class).getResultList();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
