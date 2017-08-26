package com.peregrineairlines.controller;

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
public class ConfirmationController {
    
    @RequestMapping(value = "/confirmation", method = RequestMethod.GET)
    public String getConfirmation(@ModelAttribute("purchasedTickets") Object purchasedTickets, Model model) {
        
        model.addAttribute("purchasedTickets", purchasedTickets);
        
        return "confirmation";
    }
}
