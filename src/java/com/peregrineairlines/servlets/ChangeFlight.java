/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.peregrineairlines.servlets;

import com.peregrineairlines.entities.Airport;
import com.peregrineairlines.entities.Flight;
import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chris
 */
public class ChangeFlight extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nextUrl = "/jsp/changeFlight.jsp";

        String action = request.getParameter("action");

        if (action != null) {
            if (action.equalsIgnoreCase("cancelTicket")) {
                String ticketIdString = request.getParameter("ticketId");
                if (ticketIdString != null) {
                    ticketIdString = ticketIdString.replaceAll("\\D", "");
                    if (!ticketIdString.isEmpty()) {
                        Integer ticketId = Integer.parseInt(ticketIdString);
                        String passengerLastname = request.getParameter("passengerLastname");
                        if (passengerLastname != null) {
                            Ticket ticket = PAModel.getTicketByIdAndPassengerLastname(ticketId, passengerLastname);
                            if (ticket != null && ticket.getTicketOrder() != null) {
                                PAModel.returnTicket(ticketId);
                                request.setAttribute("returnedTicket", ticket);
                                nextUrl = "/jsp/confirmation.jsp";
                            } else {
                                Collection<Airport> airports = PAModel.getAirports();
                                request.setAttribute("airports", airports);
                                request.setAttribute("message", "Could not find ticket");
                            }
                        }
                    }
                }
            } else if (action.equalsIgnoreCase("changeFlight")) {
                String ticketIdString = request.getParameter("ticketId");
                if (ticketIdString != null) {
                    ticketIdString = ticketIdString.replaceAll("\\D", "");
                    if (!ticketIdString.isEmpty()) {
                        Integer ticketId = Integer.parseInt(ticketIdString);
                        String passengerLastname = request.getParameter("passengerLastname");
                        if (passengerLastname != null) {
                            Ticket exchangeTicket = PAModel.getTicketByIdAndPassengerLastname(ticketId, passengerLastname);
                            if (exchangeTicket != null) {
                                request.setAttribute("exchangeTicketId", exchangeTicket.getTicketId());
                            } else {
                                request.setAttribute("message", "Couldn't find ticket: " + ticketIdString);
                            }
                        }
                    }
                }

                String fromString = request.getParameter("from");
                int from = 0;
                if (fromString != null) {
                    fromString = fromString.replaceAll("\\D", "");
                    if (!fromString.isEmpty()) {
                        from = Integer.parseInt(fromString);
                    }
                }
                String toString = request.getParameter("to");
                int to = 0;
                if (toString != null) {
                    toString = toString.replaceAll("\\D", "");
                    if (!toString.isEmpty()) {
                        to = Integer.parseInt(toString);
                    }
                }
                String departDateString = request.getParameter("departdate");
                Date departDate = null;
                try {
                    departDate = new SimpleDateFormat("M/d/y").parse(departDateString);
                } catch (ParseException ex) {
                    Logger.getLogger(SearchFlights.class.getName()).log(Level.SEVERE, null, ex);
                }
                String returnDateString = request.getParameter("returndate");
                Date returnDate = null;
                try {
                    returnDate = new SimpleDateFormat("M/d/y").parse(returnDateString);
                } catch (ParseException ex) {
                    Logger.getLogger(SearchFlights.class.getName()).log(Level.SEVERE, null, ex);
                }

                String passengersString = request.getParameter("passengers");
                request.setAttribute("passengers", passengersString);
                int passengers = 0;
                if (passengersString != null) {
                    passengersString = passengersString.replaceAll("\\D", "");
                    if (!passengersString.isEmpty()) {
                        passengers = Integer.parseInt(passengersString);
                    }
                }

                if (departDate != null) {
                    Collection<Flight> flights = PAModel.searchFlights(from, to, departDate, passengers);
                    request.setAttribute("flights", flights);
                }

                if (returnDate != null) {
                    Collection<Flight> returnFlights = PAModel.searchFlights(to, from, returnDate, passengers);
                    request.setAttribute("returnFlights", returnFlights);
                }

                nextUrl = "/jsp/searchResults.jsp";
            }
        } else {
            Collection<Airport> airports = PAModel.getAirports();
            request.setAttribute("airports", airports);
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextUrl);
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
