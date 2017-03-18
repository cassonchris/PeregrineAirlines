package com.peregrineairlines.controller;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.model.PAModel;
import com.peregrineairlines.viewmodel.FlightSearch;
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
public class ChangeFlightController {
    
    @RequestMapping(value = {"/changeFlight", "/ChangeFlight"}, method = RequestMethod.GET)
    public String getView(Model model) {
        Collection<Airport> airports = PAModel.getAirports();
        model.addAttribute("airports", airports);
        
        model.addAttribute("flightSearch", new FlightSearch());
        
        return "changeFlight";
    }
}
