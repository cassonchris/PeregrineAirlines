package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Flight;
import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import java.util.ArrayList;
import java.util.Collection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.peregrineairlines.formmodel.FlightSearch;
import java.math.BigDecimal;

/**
 *
 * @author Chris
 */
@Controller
public class SearchController {
        
    /**
     * Flight search result page
     * 
     * @param flightSearch
     * @param model
     * @return 
     */
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchFlights(@ModelAttribute("flightSearch") FlightSearch flightSearch, Model model) {
        Collection<Flight> flights = new ArrayList<>();
        Collection<Flight> returnFlights = new ArrayList<>();
        
        if (flightSearch.getDepartDate() != null) {
            flights.addAll(
                PAModel.searchFlights(
                    flightSearch.getArrivingAirport(), 
                    flightSearch.getDepartingAirport(), 
                    flightSearch.getDepartDate(), 
                    flightSearch.getPassengers()
                )
            );
        }
            
        if (flightSearch.getReturnDate() != null) {
            returnFlights.addAll(
                PAModel.searchFlights(
                    flightSearch.getDepartingAirport(), 
                    flightSearch.getArrivingAirport(), 
                    flightSearch.getReturnDate(), 
                    flightSearch.getPassengers()
                )
            );
        }    
                
        model.addAttribute("flightSearch", flightSearch);
        model.addAttribute("flights", flights);
        model.addAttribute("returnFlights", returnFlights);
        
        return "searchResults";
    }
    
    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public String orderTickets(@ModelAttribute("flightSearch") FlightSearch flightSearch, Model model) {
        Collection<Ticket> tickets = new ArrayList<>();
        if (flightSearch.getFlightId() != null) {
            tickets.addAll(PAModel.getAvailableTicketsByFlightId(flightSearch.getFlightId(), flightSearch.getPassengers()));
        }
        
        if (flightSearch.getReturnFlightId() != null) {
            tickets.addAll(PAModel.getAvailableTicketsByFlightId(flightSearch.getReturnFlightId(), flightSearch.getPassengers()));
        }
        
        BigDecimal orderTotal = BigDecimal.ZERO;
        for (Ticket t : tickets) {
            orderTotal = orderTotal.add(t.getPrice());
        }
        
        model.addAttribute("tickets", tickets);
        model.addAttribute("orderTotal", orderTotal);
        
        return "order";
    }
}
