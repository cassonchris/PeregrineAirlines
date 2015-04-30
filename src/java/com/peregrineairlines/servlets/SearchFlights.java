package com.peregrineairlines.servlets;

import com.peregrineairlines.entities.Flight;
import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class SearchFlights extends HttpServlet {

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

        String nextUrl = "/jsp/searchResults.jsp";

        String action = request.getParameter("action");

        if (action != null) {
            if (action.equalsIgnoreCase("searchFlights")) {
                
                // process from
                String fromString = request.getParameter("from");
                int from = 0;
                if (fromString != null) {
                    fromString = fromString.replaceAll("\\D", ""); // remove all non digit
                    if (!fromString.isEmpty()) {
                        from = Integer.parseInt(fromString);
                    }
                }
                
                // process to
                String toString = request.getParameter("to");
                int to = 0;
                if (toString != null) {
                    toString = toString.replaceAll("\\D", ""); // remove all non digit
                    if (!toString.isEmpty()) {
                        to = Integer.parseInt(toString);
                    }
                }
                
                // process depart date
                String departDateString = request.getParameter("departdate");
                Date departDate = null;
                try {
                    departDate = new SimpleDateFormat("M/d/y").parse(departDateString);
                } catch (ParseException ex) {
                    Logger.getLogger(SearchFlights.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                // process return date
                String returnDateString = request.getParameter("returndate");
                Date returnDate = null;
                try {
                    returnDate = new SimpleDateFormat("M/d/y").parse(returnDateString);
                } catch (ParseException ex) {
                    Logger.getLogger(SearchFlights.class.getName()).log(Level.SEVERE, null, ex);
                }

                // process passenger count
                String passengersString = request.getParameter("passengers");
                request.setAttribute("passengers", passengersString);
                int passengers = 0;
                if (passengersString != null) {
                    passengersString = passengersString.replaceAll("\\D", ""); // remove all non digit
                    if (!passengersString.isEmpty()) {
                        passengers = Integer.parseInt(passengersString);
                    }
                }

                if (departDate != null) {
                    // search for flights
                    Collection<Flight> flights = PAModel.searchFlights(to, from, departDate, passengers);
                    request.setAttribute("flights", flights);
                }

                if (returnDate != null) {
                    // search for return flights
                    Collection<Flight> returnFlights = PAModel.searchFlights(from, to, returnDate, passengers);
                    request.setAttribute("returnFlights", returnFlights);
                }

                nextUrl = "/jsp/searchResults.jsp";
            } else if (action.equalsIgnoreCase("selectFlight")) {
                
                // process flightId
                String flight = request.getParameter("flight");
                Integer flightId = null;
                if (flight != null) {
                    flight = flight.replaceAll("\\D", ""); // remove all non digit
                    if (!flight.isEmpty()) {
                        flightId = Integer.parseInt(flight);
                    }
                }
                
                // process returnFlightId
                String returnFlight = request.getParameter("returnFlight");
                Integer returnFlightId = null;
                if (returnFlight != null) {
                    returnFlight = returnFlight.replaceAll("\\D", ""); // remove all non digit
                    if (!returnFlight.isEmpty()) {
                        returnFlightId = Integer.parseInt(returnFlight);
                    }
                }

                // process number of passengers
                String passengersString = request.getParameter("passengers");
                int passengers = 0;
                if (passengersString != null) {
                    passengersString = passengersString.replaceAll("\\D", ""); // remove all non digit
                    if (!passengersString.isEmpty()) {
                        passengers = Integer.parseInt(passengersString);
                    }
                }

                Collection<Ticket> tickets = new ArrayList<>();
                if (flightId != null) {
                    // get the requested tickets
                    Collection<Ticket> departTickets = PAModel.getAvailableTicketsByFlightId(flightId, passengers);
                    if (departTickets != null) {
                        tickets.addAll(departTickets);
                    }
                }
                if (returnFlightId != null) {
                    // get the requested tickets
                    Collection<Ticket> returnTickets = PAModel.getAvailableTicketsByFlightId(returnFlightId, passengers);
                    if (returnTickets != null) {
                        tickets.addAll(returnTickets);
                    }
                }
                request.setAttribute("tickets", tickets);
                
                // check for exchange ticket
                String exchangeTicketIdString = request.getParameter("exchangeTicketId");
                if (exchangeTicketIdString != null) {
                    exchangeTicketIdString = exchangeTicketIdString.replaceAll("\\D", ""); // remove all non digit
                    if (!exchangeTicketIdString.isEmpty()) {
                        Integer exchangeTicketId = Integer.parseInt(exchangeTicketIdString);
                        Ticket exchangeTicket = PAModel.getTicketById(exchangeTicketId);
                        request.setAttribute("exchangeTicket", exchangeTicket);
                    }
                }

                nextUrl = "/jsp/order.jsp";
            }
        }

        // forward to nextUrl
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
