/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.peregrineairlines.servlets;

import com.peregrineairlines.entities.PlaneModel;
import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import java.io.IOException;
import java.io.PrintWriter;
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
                String ticketCountString = request.getParameter("ticketCount");
                if (ticketCountString != null) {
                    ticketCountString = ticketCountString.replaceAll("\\D", "");
                    if (!ticketCountString.isEmpty()) {
                        int ticketCount = Integer.parseInt(ticketCountString);
                        List<Ticket> tickets = new ArrayList<>();
                        for (int i = 0; i < ticketCount; i++) {
                            String ticketId = request.getParameter("ticket" + i);
                            if (ticketId != null) {
                                ticketId = ticketId.replaceAll("\\D", "");
                                if (!ticketId.isEmpty()) {
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
                        
                        Collection<Ticket> purchasedTickets = PAModel.submitOrder(tickets, customerFirstName, customerLastName);
                        request.setAttribute("purchasedTickets", purchasedTickets);

                        nextUrl = "/jsp/confirmation.jsp";
                    }
                }
            } else if (action.equalsIgnoreCase("changeFlightPurchase")) {
                nextUrl = "/jsp/confirmation.jsp";
            }
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
