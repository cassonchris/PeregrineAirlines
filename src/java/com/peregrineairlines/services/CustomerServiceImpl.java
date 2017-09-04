package com.peregrineairlines.services;

import com.peregrineairlines.entities.Customer;
import com.peregrineairlines.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public Customer getCustomerByFirstAndLast(String first, String last) {
        return customerRepository.getCustomer(first, last);
    }

    @Override
    public void insertCustomer(Customer customer) {
        customerRepository.Save(customer);
    }

}
