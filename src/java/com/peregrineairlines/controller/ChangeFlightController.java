package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.entities.Flight;
import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.services.AirportService;
import com.peregrineairlines.services.FlightService;
import com.peregrineairlines.services.TicketService;
import com.peregrineairlines.viewmodel.FlightSearch;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
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
    
    @Autowired
    private AirportService airportService;
    
    @Autowired
    private TicketService ticketService;
    
    @Autowired
    private FlightService flightService;
    
    @RequestMapping(value = {"/changeFlight", "/ChangeFlight"}, method = RequestMethod.GET)
    public String getView(Model model) {
        Collection<Airport> airports = airportService.getAirports();
        model.addAttribute("airports", airports);
        
        model.addAttribute("flightSearch", new FlightSearch());
        
        return "changeFlight";
    }
    
    @RequestMapping(value = {"/cancelFlight", "/CancelFlight"}, method = RequestMethod.POST)
    public String cancelFlight(@ModelAttribute("flightSearch") FlightSearch flightSearch, Model model, RedirectAttributes redirectAttributes) {
        Ticket ticket = ticketService.getTicketByIdAndPassengerLastname(flightSearch.getTicket().getTicketId(), flightSearch.getTicket().getPassengerLastname());
        if (ticket != null && ticket.getTicketOrder() != null) {
            ticketService.returnTicket(ticket.getTicketId());
            redirectAttributes.addFlashAttribute("purchasedTickets", null);
            redirectAttributes.addFlashAttribute("returnedTicket", ticket);
            return "redirect:/confirmation";
        } else {
            return "redirect:/changeFlight";
        }
    }
    
    @RequestMapping(value = {"/changeFlight", "/ChangeFlight"}, method = RequestMethod.POST)
    public String changeFlight(@ModelAttribute("flightSearch") FlightSearch flightSearch, Model model) {
        Ticket exchangeTicket = ticketService.getTicketByIdAndPassengerLastname(flightSearch.getTicket().getTicketId(), flightSearch.getTicket().getPassengerLastname());
        model.addAttribute("exchangeTicketId", exchangeTicket.getTicketId());
        
        if (flightSearch.getDepartDate() != null) {
            Collection<Flight> flights = flightService.searchFlights(flightSearch.getArrivingAirport(), flightSearch.getDepartingAirport(), flightSearch.getDepartDate(), flightSearch.getPassengers());
            model.addAttribute("flights", flights);
        }
        
        if (flightSearch.getReturnDate() != null) {
            Collection<Flight> returnFlights = flightService.searchFlights(flightSearch.getDepartingAirport(), flightSearch.getArrivingAirport(), flightSearch.getReturnDate(), flightSearch.getPassengers());
            model.addAttribute("returnFlights", returnFlights);
        }
        
        return "searchResults";
    }
}
