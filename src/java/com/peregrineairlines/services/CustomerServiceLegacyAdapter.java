package com.peregrineairlines.services;

import com.peregrineairlines.entities.Customer;
import com.peregrineairlines.model.PAModel;

/**
 *
 * @author Chris
 */
public class CustomerServiceLegacyAdapter implements CustomerService {

    @Override
    public Customer getCustomerByFirstAndLast(String first, String last) {
        return PAModel.getCustomerByFirstAndLast(first, last);
    }

    @Override
    public void insertCustomer(Customer customer) {
        PAModel.insertCustomer(customer);
    }

}
