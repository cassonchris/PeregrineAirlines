package com.peregrineairlines.services;

import com.peregrineairlines.entities.Ticket;
import java.util.Collection;

/**
 *
 * @author Chris
 */
public interface OrderService {

    public Collection<Ticket> submitOrder(Collection<Ticket> placeHolderTickets, String customerFirstName, String customerLastName);
}
