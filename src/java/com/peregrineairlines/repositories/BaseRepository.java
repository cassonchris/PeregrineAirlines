package com.peregrineairlines.repositories;

import com.peregrineairlines.entities.BaseModel;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Chris
 * @param <T>
 */
@Repository
public class BaseRepository<T extends BaseModel> {
    
    private final Class<T> type;

    @PersistenceContext
    protected EntityManager em;
    
    public BaseRepository() {
        this.type = (Class<T>) 
                ((ParameterizedType) getClass().getGenericSuperclass())
                        .getActualTypeArguments()[0];
    }
    
    public T findById(int id) {
        return em.find(type, id);
    }
    
    public List<T> findAll() {
            return em.createQuery("Select t from " + type.getSimpleName() + " t").getResultList();
    }
    
    public void Save(T t) {
        em.persist(t);
    }
}
