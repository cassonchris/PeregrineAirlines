/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.peregrineairlines.servlets;

import com.peregrineairlines.entities.Ticket;
import com.peregrineairlines.model.PAModel;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chris
 */
public class CheckIn extends HttpServlet {

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

        String nextUrl = "/jsp/checkIn.jsp";

        String action = request.getParameter("action");

        if (action != null) {
            if (action.equalsIgnoreCase("findTicket")) {
                String ticketIdStr = request.getParameter("ticketId");
                if (ticketIdStr != null) {
                    ticketIdStr = ticketIdStr.replaceAll("\\D", ""); // replace all non digit
                    if (!ticketIdStr.isEmpty()) {
                        int ticketId = Integer.parseInt(ticketIdStr);
                        String passengerLastname = request.getParameter("passengerLastname");
                        if (passengerLastname != null) {
                            Ticket ticket = PAModel.getTicketByIdAndPassengerLastname(ticketId, passengerLastname);
                            if (ticket != null) {
                                request.setAttribute("ticket", ticket);
                                nextUrl = "/jsp/checkIn2.jsp";
                            } else {
                                request.setAttribute("message", "Could not find ticket");
                            }
                        }
                    } else {
                        request.setAttribute("message", "Ticket Id is invalid");
                    }
                }
            } else if (action.equalsIgnoreCase("checkIn")) {
                String ticketId = request.getParameter("ticketId");
                request.setAttribute("ticketId", ticketId);

                String numberOfBagsString = request.getParameter("numberOfBags");
                Integer numberOfBags = null;
                if (numberOfBagsString != null) {
                    numberOfBagsString = numberOfBagsString.replaceAll("\\D", "");
                    if (!numberOfBagsString.isEmpty()) {
                        numberOfBags = Integer.parseInt(numberOfBagsString);
                    }
                }
                if (numberOfBags != null && numberOfBags > 0) {
                    request.setAttribute("numberOfBags", numberOfBags);
                    nextUrl = "/jsp/orderBaggage.jsp";
                } else {
                    if (ticketId != null) {
                        ticketId = ticketId.replaceAll("\\D", "");
                        if (!ticketId.isEmpty()) {
                            Ticket checkedTicket = PAModel.checkIn(Integer.parseInt(ticketId));
                            request.setAttribute("checkedTicket", checkedTicket);
                            nextUrl = "/jsp/confirmation.jsp";
                        }
                    }
                }
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
