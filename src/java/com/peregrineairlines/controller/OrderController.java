package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.formmodel.FlightSearch;
import com.peregrineairlines.formmodel.OrderSummary;
import com.peregrineairlines.model.PAModel;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
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
    
    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public String orderTickets(@ModelAttribute("flightSearch") FlightSearch flightSearch, Model model) {
        List<Ticket> tickets = new ArrayList<>();
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
        
        OrderSummary orderSummary = new OrderSummary();
        orderSummary.setTickets(tickets);
        
        model.addAttribute("orderTotal", orderTotal);
        model.addAttribute("orderSummary", orderSummary);
        
        return "order";
    }
    
    @RequestMapping(value = "/submitOrder", method = RequestMethod.POST)
    public String orderTickets(@ModelAttribute("orderSummary") OrderSummary orderSummary, Model model, RedirectAttributes redirectAttributes) {
        Collection<Ticket> purchasedTickets = PAModel.submitOrder(orderSummary.getTickets(), orderSummary.getCustomerFirstName(), orderSummary.getCustomerLastName());
        
        redirectAttributes.addFlashAttribute("purchasedTickets", purchasedTickets);
        
        return "redirect:/confirmation";
    }
}
