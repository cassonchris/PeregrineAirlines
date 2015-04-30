package com.peregrineairlines.servlets;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chris
 */
public class Order extends HttpServlet {

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

        String nextUrl = "/jsp/order.jsp";

        String action = request.getParameter("action");

        if (action != null) {
            if (action.equalsIgnoreCase("purchaseTickets")) {
                
                // validate parameters
                String ticketCountString = request.getParameter("ticketCount");
                if (ticketCountString != null) {
                    ticketCountString = ticketCountString.replaceAll("\\D", ""); // remove all non digit
                    if (!ticketCountString.isEmpty()) {
                        int ticketCount = Integer.parseInt(ticketCountString);
                        List<Ticket> tickets = new ArrayList<>();
                        
                        // process each of the tickets
                        for (int i = 0; i < ticketCount; i++) {
                            String ticketId = request.getParameter("ticket" + i);
                            if (ticketId != null) {
                                ticketId = ticketId.replaceAll("\\D", ""); // remove all non digit
                                if (!ticketId.isEmpty()) {
                                    
                                    // create a placeholderTicket to pass to submitOrder
                                    Ticket placeholderTicket = new Ticket();
                                    placeholderTicket.setTicketId(Integer.parseInt(ticketId));
                                    placeholderTicket.setPassengerFirstname(request.getParameter("firstName" + i));
                                    placeholderTicket.setPassengerLastname(request.getParameter("lastName" + i));
                                    tickets.add(placeholderTicket);
                                }
                            }
                        }

                        String customerFirstName = request.getParameter("customerFirstName");
                        String customerLastName = request.getParameter("customerLastName");

                        // check for an exchange ticket
                        String exchangeTicketIdString = request.getParameter("exchangeTicketId");
                        if (exchangeTicketIdString != null) {
                            exchangeTicketIdString = exchangeTicketIdString.replaceAll("\\D", ""); // remove all non digit
                            if (!exchangeTicketIdString.isEmpty()) {
                                Integer exchangeTicketId = Integer.parseInt(exchangeTicketIdString);
                                
                                // return the exchange ticket
                                PAModel.returnTicket(exchangeTicketId);
                            }
                        }

                        // submit the order
                        Collection<Ticket> purchasedTickets = PAModel.submitOrder(tickets, customerFirstName, customerLastName);
                        request.setAttribute("purchasedTickets", purchasedTickets);

                        nextUrl = "/jsp/confirmation.jsp";
                    }
                }
            } else if (action.equalsIgnoreCase("changeFlightPurchase")) {
                nextUrl = "/jsp/confirmation.jsp";
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
