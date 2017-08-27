package com.peregrineairlines.services;

import com.peregrineairlines.entities.Flight;
import com.peregrineairlines.model.PAModel;
import java.util.Collection;
import java.util.Date;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris
 */
@Service
public class FlightServiceLegacyAdapter implements FlightService {

    @Override
    public void scheduleFlight(int from, int to, int planeModelId, Date depart) {
        PAModel.scheduleFlight(from, to, planeModelId, depart);
    }

    @Override
    public Collection<Flight> searchFlights(int to, int from, Date depart, int passengers) {
        return PAModel.searchFlights(to, from, depart, passengers);
    }

    @Override
    public void insertFlight(Flight flight) {
        PAModel.insertFlight(flight);
    }

}
