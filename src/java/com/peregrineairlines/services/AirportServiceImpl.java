package com.peregrineairlines.services;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.repositories.AirportRepository;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris
 */
@Service
public class AirportServiceImpl implements AirportService {
    
    @Autowired
    private AirportRepository airportRepository;

    @Override
    public Collection<Airport> getAirports() {
        return airportRepository.findAll();
    }

    @Override
    public Airport getAirportById(int airportId) {
        return airportRepository.findById(airportId);
    }

}
