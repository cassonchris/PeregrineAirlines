package com.peregrineairlines.services;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.entities.TicketOrder;
import com.peregrineairlines.entities.TicketReturn;
import com.peregrineairlines.repositories.TicketOrderRepository;
import com.peregrineairlines.repositories.TicketRepository;
import com.peregrineairlines.repositories.TicketReturnRepository;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Chris
 */
public class TicketServiceImpl implements TicketService {
    
    @Autowired
    private TicketRepository ticketRepository;
    
    @Autowired
    private TicketReturnRepository ticketReturnRepository;
    
    @Autowired
    private TicketOrderRepository ticketOrderRepository;

    @Override
    public Collection<Ticket> getAvailableTicketsByFlightId(int flightId, int numberOfTickets) {
        return ticketRepository.getAvailableTicketsByFlightId(flightId, numberOfTickets);
    }

    @Override
    public Ticket getTicketById(int ticketId) {
        return ticketRepository.findById(ticketId);
    }

    @Override
    public Ticket getTicketByIdAndPassengerLastname(int ticketId, String passengerLastname) {
        return ticketRepository.getTicketByIdAndPassengerLastname(ticketId, passengerLastname);
    }

    @Override
    public void returnTicket(int ticketId) {
        Ticket ticket = getTicketById(ticketId);
        if (ticket != null) {
            TicketReturn ticketReturn = new TicketReturn();
            ticketReturn.setTicketOrder(ticket.getTicketOrder());
            ticketReturn.setTicket(ticket);
            insertTicketReturn(ticketReturn);
            
            ticket.setTicketOrder(null);
            ticket.setPassengerFirstname(null);
            ticket.setPassengerLastname(null);
            updateTicket(ticket);
        }
    }

    @Override
    public void updateTicket(Ticket ticket) {
        ticketRepository.Save(ticket);
    }

    @Override
    public Ticket checkIn(int ticketNumber) {
        Ticket ticket = getTicketById(ticketNumber);
        if (ticket != null) {
            ticket.setCheckedIn(Boolean.TRUE);
            updateTicket(ticket);
        }
        return ticket;
    }

    @Override
    public void insertTicketReturn(TicketReturn ticketReturn) {
        ticketReturnRepository.Save(ticketReturn);
    }

    @Override
    public void insertTicketOrder(TicketOrder ticketOrder) {
        ticketOrderRepository.Save(ticketOrder);
    }

}
