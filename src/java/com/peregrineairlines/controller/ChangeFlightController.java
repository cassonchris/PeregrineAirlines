package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.entities.Flight;
import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import com.peregrineairlines.viewmodel.FlightSearch;
import java.util.Collection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Chris
 */
@Controller
public class ChangeFlightController {
    
    @RequestMapping(value = {"/changeFlight", "/ChangeFlight"}, method = RequestMethod.GET)
    public String getView(Model model) {
        Collection<Airport> airports = PAModel.getAirports();
        model.addAttribute("airports", airports);
        
        model.addAttribute("flightSearch", new FlightSearch());
        
        return "changeFlight";
    }
    
    @RequestMapping(value = {"/cancelFlight", "/CancelFlight"}, method = RequestMethod.POST)
    public String cancelFlight(@ModelAttribute("flightSearch") FlightSearch flightSearch, Model model, RedirectAttributes redirectAttributes) {
        Ticket ticket = PAModel.getTicketByIdAndPassengerLastname(flightSearch.getTicket().getTicketId(), flightSearch.getTicket().getPassengerLastname());
        if (ticket != null && ticket.getTicketOrder() != null) {
            PAModel.returnTicket(ticket.getTicketId());
            redirectAttributes.addFlashAttribute("purchasedTickets", null);
            redirectAttributes.addFlashAttribute("returnedTicket", ticket);
            return "redirect:/confirmation";
        } else {
            return "redirect:/changeFlight";
        }
    }
    
    @RequestMapping(value = {"/changeFlight", "/ChangeFlight"}, method = RequestMethod.POST)
    public String changeFlight(@ModelAttribute("flightSearch") FlightSearch flightSearch, Model model) {
        Ticket exchangeTicket = PAModel.getTicketByIdAndPassengerLastname(flightSearch.getTicket().getTicketId(), flightSearch.getTicket().getPassengerLastname());
        model.addAttribute("exchangeTicketId", exchangeTicket.getTicketId());
        
        if (flightSearch.getDepartDate() != null) {
            Collection<Flight> flights = PAModel.searchFlights(flightSearch.getArrivingAirport(), flightSearch.getDepartingAirport(), flightSearch.getDepartDate(), flightSearch.getPassengers());
            model.addAttribute("flights", flights);
        }
        
        if (flightSearch.getReturnDate() != null) {
            Collection<Flight> returnFlights = PAModel.searchFlights(flightSearch.getDepartingAirport(), flightSearch.getArrivingAirport(), flightSearch.getReturnDate(), flightSearch.getPassengers());
            model.addAttribute("returnFlights", returnFlights);
        }
        
        return "searchResults";
    }
}
