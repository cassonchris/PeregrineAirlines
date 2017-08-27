package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.services.OrderService;
import com.peregrineairlines.services.TicketService;
import com.peregrineairlines.viewmodel.FlightSearch;
import com.peregrineairlines.viewmodel.OrderSummary;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
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
public class OrderController {
    
    @Autowired
    private TicketService ticketService;
    
    @Autowired
    private OrderService orderService;
    
    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public String orderTickets(@ModelAttribute("flightSearch") FlightSearch flightSearch, Model model) {
        List<Ticket> tickets = new ArrayList<>();
        if (flightSearch.getFlightId() != null) {
            tickets.addAll(ticketService.getAvailableTicketsByFlightId(flightSearch.getFlightId(), flightSearch.getPassengers()));
        }
        
        if (flightSearch.getReturnFlightId() != null) {
            tickets.addAll(ticketService.getAvailableTicketsByFlightId(flightSearch.getReturnFlightId(), flightSearch.getPassengers()));
        }
        
        BigDecimal orderTotal = BigDecimal.ZERO;
        for (Ticket t : tickets) {
            orderTotal = orderTotal.add(t.getPrice());
        }
        
        OrderSummary orderSummary = new OrderSummary();
        orderSummary.setTickets(tickets);
        
        model.addAttribute("orderTotal", orderTotal);
        model.addAttribute("orderSummary", orderSummary);
        model.addAttribute("exchangeTicketId", flightSearch.getExchangeTicketId());
        
        return "order";
    }
    
    @RequestMapping(value = "/submitOrder", method = RequestMethod.POST)
    public String orderTickets(@ModelAttribute("orderSummary") OrderSummary orderSummary, Model model, RedirectAttributes redirectAttributes) {
        Collection<Ticket> purchasedTickets = orderService.submitOrder(orderSummary.getTickets(), orderSummary.getCustomerFirstName(), orderSummary.getCustomerLastName());
        
        if (orderSummary.getExchangeTicketId() != null) {
            ticketService.returnTicket(orderSummary.getExchangeTicketId());
        }
        
        redirectAttributes.addFlashAttribute("purchasedTickets", purchasedTickets);
        
        return "redirect:/confirmation";
    }
}
