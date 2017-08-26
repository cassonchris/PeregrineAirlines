package com.peregrineairlines.services;

import com.peregrineairlines.entities.Customer;

/**
 *
 * @author Chris
 */
public interface CustomerService {

    public Customer getCustomerByFirstAndLast(String first, String last);
    public void insertCustomer(Customer customer);
}
