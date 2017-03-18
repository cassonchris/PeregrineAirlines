package com.peregrineairlines.viewmodel;

import com.peregrineairlines.entities.Ticket;

/**
 *
 * @author Chris
 */
public class CheckIn {
    private Ticket ticket;
    private Integer numberOfBags;

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public Integer getNumberOfBags() {
        return numberOfBags;
    }

    public void setNumberOfBags(Integer numberOfBags) {
        this.numberOfBags = numberOfBags;
    }
}
