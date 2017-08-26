package com.peregrineairlines.services;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.entities.TicketOrder;
import com.peregrineairlines.entities.TicketReturn;
import com.peregrineairlines.model.PAModel;
import java.util.Collection;

/**
 *
 * @author Chris
 */
public class TicketServiceLegacyAdapter implements TicketService {

    @Override
    public Collection<Ticket> getAvailableTicketsByFlightId(int flightId, int numberOfTickets) {
        return PAModel.getAvailableTicketsByFlightId(flightId, numberOfTickets);
    }

    @Override
    public Ticket getTicketById(int ticketId) {
        return PAModel.getTicketById(ticketId);
    }

    @Override
    public Ticket getTicketByIdAndPassengerLastname(int ticketId, String passengerLastname) {
        return PAModel.getTicketByIdAndPassengerLastname(ticketId, passengerLastname);
    }

    @Override
    public void returnTicket(int ticketId) {
        PAModel.returnTicket(ticketId);
    }

    @Override
    public void updateTicket(Ticket ticket) {
        PAModel.updateTicket(ticket);
    }

    @Override
    public Ticket checkIn(int ticketNumber) {
        return PAModel.checkIn(ticketNumber);
    }

    @Override
    public void insertTicketReturn(TicketReturn ticketReturn) {
        PAModel.insertTicketReturn(ticketReturn);
    }

    @Override
    public void insertTicketOrder(TicketOrder ticketOrder) {
        PAModel.insertTicketOrder(ticketOrder);
    }

}
