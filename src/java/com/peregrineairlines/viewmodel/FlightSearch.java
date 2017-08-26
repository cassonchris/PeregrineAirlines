package com.peregrineairlines.viewmodel;

import com.peregrineairlines.entities.Ticket;
import java.util.Date;

/**
 *
 * @author Chris
 */
public class FlightSearch {
    
    private Integer departingAirport;
    private Integer arrivingAirport;
    private Date departDate;
    private Date returnDate;
    private Integer passengers;
    private Integer flightId;
    private Integer returnFlightId;
    private Ticket ticket;
    private Integer exchangeTicketId;

    //<editor-fold defaultstate="collapsed" desc="getters and setters">
    public Integer getDepartingAirport() {
        return departingAirport;
    }
    
    public void setDepartingAirport(Integer departingAirport) {
        this.departingAirport = departingAirport;
    }
    
    public Integer getArrivingAirport() {
        return arrivingAirport;
    }
    
    public void setArrivingAirport(Integer arrivingAirport) {
        this.arrivingAirport = arrivingAirport;
    }
    
    public Date getDepartDate() {
        return departDate;
    }
    
    public void setDepartDate(Date departDate) {
        this.departDate = departDate;
    }
    
    public Date getReturnDate() {
        return returnDate;
    }
    
    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }
    
    public Integer getPassengers() {
        return passengers;
    }
    
    public void setPassengers(Integer passengers) {
        this.passengers = passengers;
    }

    public Integer getFlightId() {
        return flightId;
    }

    public void setFlightId(Integer flightId) {
        this.flightId = flightId;
    }

    public Integer getReturnFlightId() {
        return returnFlightId;
    }

    public void setReturnFlightId(Integer returnFlightId) {
        this.returnFlightId = returnFlightId;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public Integer getExchangeTicketId() {
        return exchangeTicketId;
    }

    public void setExchangeTicketId(Integer exchangeTicketId) {
        this.exchangeTicketId = exchangeTicketId;
    }
    //</editor-fold>
}
