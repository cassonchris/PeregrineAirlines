package com.peregrineairlines.repositories;

import com.peregrineairlines.entities.Ticket;
import java.util.Collection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Chris
 */
@Repository
public class TicketRepository extends BaseRepository<Ticket> {

    public Collection<Ticket> getAvailableTicketsByFlightId(int flightId, int numberOfTickets) {
        Query query = em.createNamedQuery("Ticket.findAvailableTicketByFlight");
        query.setParameter("flightId", flightId);
        query.setMaxResults(numberOfTickets);
        List<Ticket> results = query.getResultList();
        return results;
    }
    
    public Ticket getTicketByIdAndPassengerLastname(int ticketId, String passengerLastname) {
        Query query = em.createNamedQuery("Ticket.findByTicketIdPassengerLastname");
        query.setParameter("ticketId", ticketId);
        query.setParameter("passengerLastname", passengerLastname);
        query.setMaxResults(1);
        List<Ticket> results = query.getResultList();
        if (!results.isEmpty()) {
            return results.get(0);
        } else {
            return null;
        }
    }
}
