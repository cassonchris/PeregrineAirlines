package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.model.PAModel;
import java.util.Collection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.peregrineairlines.formmodel.FlightSearch;

/**
 *
 * @author Chris
 */
@Controller
public class HomeController {
    
    /**
     * Home page with flight search.
     * 
     * @param model
     * @return 
     */
    @RequestMapping(value = {"/", "/index", "/home"}, method = RequestMethod.GET)
    public String homePage(Model model) {
        Collection<Airport> airports = PAModel.getAirports();
        
        model.addAttribute("flightSearch", new FlightSearch());
        model.addAttribute("airports", airports);
        
        return "index";
    }
}
