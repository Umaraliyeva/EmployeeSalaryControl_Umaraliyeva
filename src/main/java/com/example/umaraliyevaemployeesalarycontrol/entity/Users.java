package com.example.umaraliyevaemployeesalarycontrol.entity;


import com.example.umaraliyevaemployeesalarycontrol.entity.abs.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;



@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Users extends BaseEntity {
    @Column(unique = true,nullable = false)
    @Email(message = "email xato")
    private String email;
    @Column(nullable = false)
    @Size(min = 8, max = 16,message = "parol minimum 8 character maximum 16 ")
    private String password;


}
