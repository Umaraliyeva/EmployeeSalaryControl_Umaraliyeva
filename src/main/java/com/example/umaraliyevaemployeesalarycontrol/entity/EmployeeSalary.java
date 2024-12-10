package com.example.umaraliyevaemployeesalarycontrol.entity;

import com.example.umaraliyevaemployeesalarycontrol.entity.abs.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Objects;

import static com.example.umaraliyevaemployeesalarycontrol.config.MyListener.EMF;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class EmployeeSalary  extends BaseEntity {
    @Column(nullable = false)
    private String firstName;
    @Column(nullable = false)
    private String lastName;
    @Column(nullable = false)
    @Min(0)
    @Max(100000000)
    private double salary;

    public double getPaidSalary(Integer id) {
        try(EntityManager entityManager = EMF.createEntityManager()){
            return (double)entityManager.createQuery("SELECT COALESCE(SUM(s.amount), 0) " +
                    "FROM SalaryPayment s " +
                    "WHERE s.employeeSalary.id = :id")
                    .setParameter("id", id)
                    .getSingleResult();

        }
    }

    public double getLeftSalary(Integer id) {
        try(EntityManager entityManager = EMF.createEntityManager()){
           double salary= (double)entityManager.createQuery("SELECT em.salary " +
                    "FROM EmployeeSalary em WHERE em.id = :id")
                    .setParameter("id", id)
                    .getSingleResult();
            double paidSalary = getPaidSalary(id);
            return salary - paidSalary;
        }
    }
}
