package com.peregrineairlines.services;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import java.util.Collection;

/**
 *
 * @author Chris
 */
public class OrderServiceLegacyAdapter implements OrderService {

    @Override
    public Collection<Ticket> submitOrder(Collection<Ticket> placeHolderTickets, String customerFirstName, String customerLastName) {
        return PAModel.submitOrder(placeHolderTickets, customerFirstName, customerLastName);
    }

}
