package com.peregrineairlines.services;

import com.peregrineairlines.entities.Flight;
import java.util.Collection;
import java.util.Date;

/**
 *
 * @author Chris
 */
public interface FlightService {
    
    public void scheduleFlight(int from, int to, int planeModelId, Date depart);
    public Collection<Flight> searchFlights(int to, int from, Date depart, int passengers);
    public void insertFlight(Flight flight);
}
