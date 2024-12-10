package com.example.umaraliyevaemployeesalarycontrol.entity;

import com.example.umaraliyevaemployeesalarycontrol.entity.abs.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class SalaryPayment extends BaseEntity {
    private String payType;
    @CreationTimestamp
    private LocalDateTime payDate;
    @Min(1)
    private double amount;
    @ManyToOne
    EmployeeSalary employeeSalary;

}
