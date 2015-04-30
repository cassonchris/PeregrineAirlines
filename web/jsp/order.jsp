<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Collection"%>
<%@page import="com.peregrineairlines.entities.Ticket"%>
<!DOCTYPE html>
<%
    // get attributes set by servlet
    Collection<Ticket> tickets = (Collection) request.getAttribute("tickets");
    Ticket exchangeTicket = (Ticket) request.getAttribute("exchangeTicket");
    BigDecimal orderTotal = new BigDecimal(0);
%>
<html lang="en">
    <head>
        <title>Book Flight</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <script src="js/jquery-1.9.1.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-replace.js"></script>  
        <script type="text/javascript" src="js/Cabin_400.font.js"></script>
        <script type="text/javascript" src="js/tabs.js"></script> 
        <script type="text/javascript" src="js/jquery.jqtransform.js" ></script>
        <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
        <script type="text/javascript" src="js/atooltip.jquery.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script>
            $(function () {
                $(".datepicker").datepicker({minDate: 0});// creates all the datepickers
            });
        </script>
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
                <div class="wrapper pad1">
                    <div class="tabs2">
                        <div class="content" style="width: 100%;">
                            <div class="tab-content" id="Flight">
                                <form id="form_5" class="form_5" method="post" action="/PeregrineAirlines/Order">
                                    <input type="hidden" name="action" value="purchaseTickets" />
                                    <%
                                        if (exchangeTicket != null) {
                                            orderTotal = orderTotal.subtract(exchangeTicket.getPrice());
                                    %>
                                    <h2 class="top">Exchange Ticket</h2>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td><b>Seat</b></td>
                                            <td><b>Flight</b></td>
                                            <td><b>Date</b></td>
                                            <td><b>Price</b></td>
                                        </tr>
                                        <input type="hidden" name="exchangeTicketId" value="<%= exchangeTicket.getTicketId()%>" />
                                        <tr>
                                            <td><%= exchangeTicket.getSeat()%></td>
                                            <td><%= exchangeTicket.getFlight().getDepartingAirport().getCity()%> to <%= exchangeTicket.getFlight().getArrivingAirport().getCity()%></td>
                                            <td><%= exchangeTicket.getFlight().getFlightDatetime()%></td>
                                            <td>$<%= exchangeTicket.getPrice()%></td>
                                        </tr>
                                    </table>
                                    <% }%>
                                    <h2 class="top">Ticket Summary</h2>
                                    <div class="pad wrapper under">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td><b>Seat</b></td>
                                                <td><b>Flight</b></td>
                                                <td><b>Date</b></td>
                                                <td><b>Price</b></td>
                                                <td><b>Passenger First Name</b></td>
                                                <td><b>Passenger Last Name</b></td>
                                            </tr>
                                            <%
                                                if (tickets != null) {
                                                    int i = 0;
                                            %>
                                            <input type="hidden" name="ticketCount" value="<%= tickets.size()%>" />
                                            <%
                                                for (Ticket ticket : tickets) {
                                                    orderTotal = orderTotal.add(ticket.getPrice());
                                            %>
                                            <input type="hidden" name="ticket<%= i%>" value="<%= ticket.getTicketId()%>" />
                                            <tr>
                                                <td><%= ticket.getSeat()%></td>
                                                <td><%= ticket.getFlight().getDepartingAirport().getCity()%> to <%= ticket.getFlight().getArrivingAirport().getCity()%></td>
                                                <td><%= ticket.getFlight().getFlightDatetime()%></td>
                                                <td>$<%= ticket.getPrice()%></td>
                                                <td><input type="text" class="input" name="firstName<%= i%>" required="true" /></td>
                                                <td><input type="text" class="input" name="lastName<%= i%>" required="true" /></td>
                                            </tr>
                                            <%
                                                        i++;
                                                    }
                                                }
                                            %>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>Total $<%= orderTotal%></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <h2 class="top">Payment Information</h2>
                                    <div class="pad">
                                        <table>
                                            <tr>
                                                <td>First Name*</td>
                                                <td><input type="text" name="customerFirstName" class="input" required /></td>
                                            </tr>
                                            <tr>
                                                <td>Last Name*</td>
                                                <td><input type="text" name="customerLastName" class="input" required /></td>
                                            </tr>
                                            <tr>
                                                <td>Card Number*</td>
                                                <td><input type="text" class="input" pattern="[0-9]{16}" required /></td>
                                            </tr>
                                            <tr>
                                                <td>Expiration Date*</td>
                                                <td>
                                                    <select>
                                                        <% for (int i = 1; i <= 12; i++) {%>
                                                        <option value="<%= i%>"><%= i%></option>
                                                        <% }%>
                                                    </select>
                                                    <select>
                                                        <% for (int i = 2015; i <= 2025; i++) {%>
                                                        <option value="<%= i%>"><%= i%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>CVV*</td>
                                                <td><input type="text" class="input" pattern="[0-9]{3}" required /></td>
                                            </tr>
                                        </table>	
                                    </div>
                                    <br />
                                    <input type="submit" class="button1" value="Purchase Ticket(s)" />
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
