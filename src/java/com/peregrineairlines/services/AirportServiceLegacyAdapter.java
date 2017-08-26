package com.peregrineairlines.services;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.model.PAModel;
import java.util.Collection;

/**
 *
 * @author Chris
 */
public class AirportServiceLegacyAdapter implements AirportService {

    @Override
    public Collection<Airport> getAirports() {
        return PAModel.getAirports();
    }

    @Override
    public Airport getAirportById(int airportId) {
        return PAModel.getAirportById(airportId);
    }

}
