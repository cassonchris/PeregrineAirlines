package com.peregrineairlines.services;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.entities.TicketOrder;
import com.peregrineairlines.entities.TicketReturn;
import java.util.Collection;

/**
 *
 * @author Chris
 */
public interface TicketService {

    public Collection<Ticket> getAvailableTicketsByFlightId(int flightId, int numberOfTickets);
    public Ticket getTicketById(int ticketId);
    public Ticket getTicketByIdAndPassengerLastname(int ticketId, String passengerLastname);
    public void returnTicket(int ticketId);
    public void updateTicket(Ticket ticket);
    public Ticket checkIn(int ticketNumber);
    public void insertTicketReturn(TicketReturn ticketReturn);
    public void insertTicketOrder(TicketOrder ticketOrder);
}
