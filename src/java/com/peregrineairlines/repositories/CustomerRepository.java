package com.peregrineairlines.repositories;

import com.peregrineairlines.entities.Customer;
import java.util.List;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Chris
 */
@Repository
public class CustomerRepository extends BaseRepository<Customer> {

    public Customer getCustomer(String firstName, String lastName) {
        Query query = em.createQuery(
                        "SELECT c "
                                + "FROM Customer c "
                                + "WHERE c.firstname = :fn "
                                + "AND c.lastname = :ln", 
                        Customer.class);
        query.setParameter("fn", firstName);
        query.setParameter("ln", lastName);
        query.setMaxResults(1);
        List<Customer> results = query.getResultList();
        if (!results.isEmpty()) {
            return results.get(0);
        } else {
            return null;
        }
        
    }
}
