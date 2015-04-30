<%-- 
    Document   : searchResults
    Created on : Mar 19, 2015, 11:03:19 AM
    Author     : Chris
--%>

<%@page import="com.peregrineairlines.entities.Ticket"%>
<%@page import="java.util.Collection"%>
<%@page import="com.peregrineairlines.entities.Flight"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Collection<Flight> flights = (Collection) request.getAttribute("flights");
    Collection<Flight> returnFlights = (Collection) request.getAttribute("returnFlights");
    Integer exchangeTicketId = (Integer) request.getAttribute("exchangeTicketId");
    String passengers = (String) request.getAttribute("passengers");
    String message = (String) request.getAttribute("message");
%>
<html>
    <head>
        <title>Book Flight</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="js/jquery-1.5.2.js" ></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-replace.js"></script>  
        <script type="text/javascript" src="js/Cabin_400.font.js"></script>
        <script type="text/javascript" src="js/tabs.js"></script> 
        <script type="text/javascript" src="js/jquery.jqtransform.js" ></script>
        <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
        <script type="text/javascript" src="js/atooltip.jquery.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <!--[if lt IE 9]>
        <script type="text/javascript" src="js/html5.js"></script>
        <style type="text/css">
                .main, .tabs ul.nav a, .content, .button1, .box1, .top { behavior:url(js/PIE.htc)}
        </style>
        <![endif]-->
        <!--[if lt IE 7]>
                <div style=' clear: both; text-align:center; position: relative;'>
                        <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0"  alt="" /></a>
                </div>
        <![endif]-->
    </head>
    <body id="page3">
        <div class="main">
            <!--header -->
            <header>
                <div class="wrapper">
                    <h1><a href="/PeregrineAirlines/Home" id="logo">Air lines</a></h1>
                    <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
                </div>
                <nav>
                    <ul id="menu">
                        <li><a href="/PeregrineAirlines/Home"><span><span>Home</span></span></a></li>
                        <li id="menu_active"><a href="/PeregrineAirlines/Home"><span><span>Book Flight</span></span></a></li>
                        <li><a href="/PeregrineAirlines/CheckIn"><span><span>Check In</span></span></a></li>
                        <li class="end"><a href="/PeregrineAirlines/ChangeFlight"><span><span>Change Flight</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="wrapper pad1" style="min-height: 500px;">
                <% if (message != null) {%>
                <h3 class="top"><%= message%></h3>
                <% }%>
                    <form action="/PeregrineAirlines/SearchFlights">
                        <input type="hidden" name="action" value="selectFlight" />
                        <input type="hidden" name="passengers" value="<%= passengers%>" />
                        <input type="hidden" name="exchangeTicketId" value="<%= exchangeTicketId%>" />
                        <% if (flights != null) {%>
                        <div class="box2">
                            <h2 class="top">Flight Details</h2>
                            <div>
                                <table style="width: 100%;">
                                    <tr>
                                        <td></td>
                                        <td><b>Flight</b></td>
                                        <td><b>Date and time</b></td>
                                        <td><b>Plane Model</b></td>
                                        <td><b>Price Range</b></td>
                                    </tr>
                                    <% for (Flight flight : flights) {%>
                                    <tr>
                                        <td><input type="radio" name="flight" value="<%= flight.getFlightId()%>" /></td>
                                        <td><%= flight.getDepartingAirport().getCity()%> to <%= flight.getArrivingAirport().getCity()%></td>
                                        <td><%= flight.getFlightDatetime()%></td>
                                        <td><%= flight.getPlaneModel().getName()%></td>
                                        <td><%= flight.getCheapestTicketPrice()%> - <%= flight.getHighestTicketPrice()%></td>
                                    </tr>
                                    <% }%>
                                </table>
                            </div>
                        </div>
                        <% }%>
                        <% if (returnFlights != null) {%>
                        <div class="box2">
                            <h2 class="top">Return Flight Details</h2>
                            <div>
                                <table style="width: 100%;">
                                    <tr>
                                        <td></td>
                                        <td><b>Flight</b></td>
                                        <td><b>Date and time</b></td>
                                        <td><b>Plane Model</b></td>
                                        <td><b>Price Range</b></td>
                                    </tr>
                                    <% for (Flight flight : returnFlights) {%>
                                    <tr>
                                        <td><input type="radio" name="returnFlight" value="<%= flight.getFlightId()%>" /></td>
                                        <td><%= flight.getDepartingAirport().getCity()%> to <%= flight.getArrivingAirport().getCity()%></td>
                                        <td><%= flight.getFlightDatetime()%></td>
                                        <td><%= flight.getPlaneModel().getName()%></td>
                                        <td><%= flight.getCheapestTicketPrice()%> - <%= flight.getHighestTicketPrice()%></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                        </div>
                        <% }%>
                        <input class="button1" type="submit" value="Select Flight(s)" />
                    </form>
                </div>
            </section>
        </div>
    </body>
</html>

