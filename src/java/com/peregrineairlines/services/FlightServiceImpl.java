package com.peregrineairlines.services;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.entities.Flight;
import com.peregrineairlines.entities.PlaneModel;
import com.peregrineairlines.repositories.AirportRepository;
import com.peregrineairlines.repositories.FlightRepository;
import com.peregrineairlines.repositories.PlaneModelRepository;
import java.util.Collection;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris
 */
@Service
public class FlightServiceImpl implements FlightService {
    
    @Autowired
    private FlightRepository flightRepository;
    
    @Autowired
    private AirportRepository airportRepository; 
    
    @Autowired
    private PlaneModelRepository planeModelRepository;

    @Override
    public void scheduleFlight(int from, int to, int planeModelId, Date depart) {
        Airport fromAirport = airportRepository.findById(from);
        Airport toAirport = airportRepository.findById(to);
        PlaneModel planeModel = planeModelRepository.findById(planeModelId);
        
        Flight newFlight = Flight.createFlight(depart, planeModel, fromAirport, toAirport);
        insertFlight(newFlight);
    }

    @Override
    public Collection<Flight> searchFlights(int to, int from, Date depart, int passengers) {
        return flightRepository.searchFlights(to, from, depart, passengers);
    }

    @Override
    public void insertFlight(Flight flight) {
        flightRepository.Save(flight);
    }

}
