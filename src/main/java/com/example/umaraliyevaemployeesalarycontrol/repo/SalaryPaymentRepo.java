package com.example.umaraliyevaemployeesalarycontrol.repo;

import com.example.umaraliyevaemployeesalarycontrol.entity.SalaryPayment;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.example.umaraliyevaemployeesalarycontrol.config.MyListener.EMF;

public class SalaryPaymentRepo {

    public static List<SalaryPayment> getPaymentsForEmployee(Integer employeeId){
        try(EntityManager entityManager = EMF.createEntityManager()){
            return entityManager.createQuery("SELECT s FROM SalaryPayment s WHERE s.employeeSalary.id = :employeeId", SalaryPayment.class)
                    .setParameter("employeeId", employeeId)
                    .getResultList();
        }
    }
}
