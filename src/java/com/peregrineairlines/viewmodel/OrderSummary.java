package com.peregrineairlines.viewmodel;

import com.peregrineairlines.entities.Ticket;
import java.util.List;

/**
 *
 * @author Chris
 */
public class OrderSummary {
    private List<Ticket> tickets;
    private String customerFirstName, customerLastName;
    private Integer exchangeTicketId;

    //<editor-fold defaultstate="collapsed" desc="getters and setters">
    public List<Ticket> getTickets() {
        return tickets;
    }
    
    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }
    
    public String getCustomerFirstName() {
        return customerFirstName;
    }
    
    public void setCustomerFirstName(String customerFirstName) {
        this.customerFirstName = customerFirstName;
    }
    
    public String getCustomerLastName() {
        return customerLastName;
    }
    
    public void setCustomerLastName(String customerLastName) {
        this.customerLastName = customerLastName;
    }

    public Integer getExchangeTicketId() {
        return exchangeTicketId;
    }

    public void setExchangeTicketId(Integer exchangeTicketId) {
        this.exchangeTicketId = exchangeTicketId;
    }
    //</editor-fold>
}
