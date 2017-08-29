package com.peregrineairlines.repositories;

import com.peregrineairlines.entities.Flight;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Chris
 */
@Repository
public class FlightRepository extends BaseRepository<Flight> {

    public Collection<Flight> searchFlights(int arrivingAirportId, int departingAirportId, Date depart, int passengers) {
        Calendar toDate = Calendar.getInstance();
        toDate.setTime(depart);
        toDate.add(Calendar.DATE, 1);
        Query query = em.createNamedQuery("Flight.findByFlightDetails")
                .setParameter("departingAirport", departingAirportId)
                .setParameter("arrivingAirport", arrivingAirportId)
                .setParameter("from", depart)
                .setParameter("to", toDate.getTime())
                .setParameter("passengers", passengers);
        Collection<Flight> results = query.getResultList();
        return results;
    }
}
