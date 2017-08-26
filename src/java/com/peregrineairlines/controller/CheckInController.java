package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.viewmodel.CheckIn;
import com.peregrineairlines.model.PAModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Chris
 */
@Controller
public class CheckInController {

    @RequestMapping(value = {"/checkIn", "/CheckIn"}, method = RequestMethod.GET)
    public String getView(Model model) {
        model.addAttribute("ticket", new Ticket());
        return "checkIn";
    }

    @RequestMapping(value = {"/findTicket", "/FindTicket"}, method = RequestMethod.POST)
    public String findTicket(@ModelAttribute("ticket") Ticket ticket, Model model) {
        Ticket foundTicket = PAModel.getTicketByIdAndPassengerLastname(ticket.getTicketId(), ticket.getPassengerLastname());
        CheckIn checkIn = new CheckIn();
        checkIn.setTicket(foundTicket);
        model.addAttribute("checkIn", checkIn);
        return "checkIn2";
    }

    @RequestMapping(value = {"/checkIn", "/CheckIn"}, method = RequestMethod.POST)
    public String checkIn(@ModelAttribute("checkIn") CheckIn checkIn, Model model) {
        if (checkIn.getNumberOfBags() > 0) {
            return "orderBaggage";
        } else {
            Ticket checkedTicket = PAModel.checkIn(checkIn.getTicket().getTicketId());
            model.addAttribute("checkedTicket", checkedTicket);
            return "confirmation";
        }
    }
}
