package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.model.PAModel;
import java.util.Collection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Chris
 */
@Controller
public class HomeController {
    
    @RequestMapping(value = {"/", "/index", "/home"}, method = RequestMethod.GET)
    public String homePage(Model model) {
        Collection<Airport> airports = PAModel.getAirports();
        
        model.addAttribute("airports", airports);
        
        return "index";
    }
}
