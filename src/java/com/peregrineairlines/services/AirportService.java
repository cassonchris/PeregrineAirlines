package com.peregrineairlines.services;

import com.peregrineairlines.entities.Airport;
import java.util.Collection;

/**
 *
 * @author Chris
 */
public interface AirportService {

    public Collection<Airport> getAirports();
    public Airport getAirportById(int airportId);
}
