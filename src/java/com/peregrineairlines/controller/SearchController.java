package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Flight;
import com.peregrineairlines.model.PAModel;
import java.util.ArrayList;
import java.util.Collection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.peregrineairlines.formmodel.FlightSearch;

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
}
