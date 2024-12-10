package com.example.umaraliyevaemployeesalarycontrol.entity.abs;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import static com.example.umaraliyevaemployeesalarycontrol.config.MyListener.EMF;

public   class BaseRepo<T> {
    private final Class<T> persistentClass;
    public BaseRepo() {
        Class<T> clazz=(Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        this.persistentClass=clazz;
    }

    public void save(T entity){

        try( EntityManager entityManager = EMF.createEntityManager()){
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public  Long count(String search) {
        try(EntityManager entityManager = EMF.createEntityManager();){
            Query nativeQuery = entityManager.createNativeQuery("select count(*) from "+persistentClass.getSimpleName().toLowerCase()+" where firstname ilike :search", Long.class)
                    .setParameter("search", "%" + search + "%");
            return (Long) nativeQuery.getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
