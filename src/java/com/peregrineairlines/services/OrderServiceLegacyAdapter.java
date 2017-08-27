package com.peregrineairlines.services;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import java.util.Collection;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris
 */
@Service
public class OrderServiceLegacyAdapter implements OrderService {

    @Override
    public Collection<Ticket> submitOrder(Collection<Ticket> placeHolderTickets, String customerFirstName, String customerLastName) {
        return PAModel.submitOrder(placeHolderTickets, customerFirstName, customerLastName);
    }

}
