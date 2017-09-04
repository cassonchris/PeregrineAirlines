package com.peregrineairlines.services;

import com.peregrineairlines.entities.Customer;
import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.entities.TicketOrder;
import com.peregrineairlines.repositories.CustomerRepository;
import com.peregrineairlines.repositories.TicketOrderRepository;
import com.peregrineairlines.repositories.TicketRepository;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Chris
 */
public class OrderServiceImpl implements OrderService {
    
    @Autowired
    private TicketOrderRepository ticketOrderRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private TicketRepository ticketRepository;

    @Override
    public Collection<Ticket> submitOrder(Collection<Ticket> placeHolderTickets, String customerFirstName, String customerLastName) {
        Customer customer = customerRepository.getCustomer(customerFirstName, customerLastName);
        // create a customer if one wasn't found
        if (customer == null) {
            customer = new Customer();
            customer.setFirstname(customerFirstName);
            customer.setLastname(customerLastName);
            customerRepository.Save(customer);
        }

        // create an order
        TicketOrder ticketOrder = new TicketOrder();
        customer.addTicketOrder(ticketOrder);
        ticketOrderRepository.Save(ticketOrder);

        List<Ticket> purchasedTickets = new ArrayList<>();

        for (Ticket placeholderTicket : placeHolderTickets) {
            Ticket ticket = ticketRepository.findById(placeholderTicket.getTicketId());
            if (ticket != null) {
                // set passenger information and update the ticket
                ticket.setPassengerFirstname(placeholderTicket.getPassengerFirstname());
                ticket.setPassengerLastname(placeholderTicket.getPassengerLastname());
                ticketOrder.addTicket(ticket);
                ticketRepository.Save(ticket);
            }
            purchasedTickets.add(ticket);
        }

        return purchasedTickets;
    }

}
