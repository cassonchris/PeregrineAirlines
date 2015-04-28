<%@page import="java.util.Collection"%>
<%@page import="com.peregrineairlines.entities.Ticket"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Collection<Ticket> tickets = (Collection) request.getAttribute("tickets");
        Ticket exchangeTicket = (Ticket) request.getAttribute("exchangeTicket");
    %>
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
            <header>
                <div class="wrapper">
                    <h1><a href="/PeregrineAirlines/Home" id="logo">Air lines</a></h1>
                    <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
                    <nav id="top_nav">
                        <ul>
                            <li><a href="/PeregrineAirlines/Home" class="nav1">Home</a></li>
                        </ul>
                    </nav>
                </div>
                <nav>
                    <ul id="menu">
                        <li><a href="/PeregrineAirlines/Home"><span><span>Home</span></span></a></li>
                        <li id="menu_active"><a href="/PeregrineAirlines/Home"><span><span>Book Flight</span></span></a></li>
                        <li><a href="/PeregrineAirlines/CheckIn"><span><span>Check In</span></span></a></li>
                        <li><a href="/PeregrineAirlines/ChangeFlight"><span><span>Change Flight</span></span></a></li>
                        <li class="end"><a href="Contacts.html"><span><span>Contact Us</span></span></a></li>
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
                                    <% if (exchangeTicket != null) {%>
                                    <h2 class="top">Exchange Ticket</h2>
                                    <div class="pad wrapper under">
                                        <table style="width: 100%;">
                                            <tr>
                                                <th>Seat</th>
                                                <th>Flight</th>
                                                <th>Date</th>
                                            </tr>
                                            <input type="hidden" name="exchangeTicketId" value="<%= exchangeTicket.getTicketId()%>" />
                                            <tr>
                                                <td><%= exchangeTicket.getSeat()%></td>
                                                <td><%= exchangeTicket.getFlight().getDepartingAirport().getCity()%> to <%= exchangeTicket.getFlight().getArrivingAirport().getCity()%></td>
                                                <td><%= exchangeTicket.getFlight().getFlightDatetime()%></td>
                                            </tr>
                                        </table>
                                        <% }%>
                                        <h2 class="top">Ticket Summary</h2>
                                        <div class="pad wrapper under">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <th>Seat</th>
                                                    <th>Flight</th>
                                                    <th>Date</th>
                                                    <th>Passenger First Name</th>
                                                    <th>Passenger Last Name</th>
                                                </tr>
                                                <%
                                                    if (tickets != null) {
                                                        int i = 0;
                                                %>
                                                <input type="hidden" name="ticketCount" value="<%= tickets.size()%>" />
                                                <%
                                                    for (Ticket ticket : tickets) {
                                                %>
                                                <input type="hidden" name="ticket<%= i%>" value="<%= ticket.getTicketId()%>" />
                                                <tr>
                                                    <td><%= ticket.getSeat()%></td>
                                                    <td><%= ticket.getFlight().getDepartingAirport().getCity()%> to <%= ticket.getFlight().getArrivingAirport().getCity()%></td>
                                                    <td><%= ticket.getFlight().getFlightDatetime()%></td>
                                                    <td><input type="text" class="input" name="firstName<%= i%>" required="true" /></td>
                                                    <td><input type="text" class="input" name="lastName<%= i%>" required="true" /></td>
                                                </tr>
                                                <%
                                                            i++;
                                                        }
                                                    }
                                                %>
                                            </table>
                                        </div>

                                        <h2 class="top">Payment Information</h2>
                                        <div class="pad">
                                            <div class="wrapper under">
                                                <div class="row"><span class="left">First Name*</span>
                                                    <input type="text" name="customerFirstName" class="input" required ></div>

                                                <div class="row"><span class="left">Last Name*</span>
                                                    <input type="text" name="customerLastName" class="input" required ></div>

                                                <div class="row"><span class="left">Card Num*</span>
                                                    <input type="text" class="input" pattern="[0-9]{16}" required ></div>
                                                <div class = "row">	<span class = "left"> Expiry Date:</span>
                                                    <input type="date" name="bday" max="2014-12-31"></div>
                                                <div class = "row"><span class="left">CVV:</span> 							
                                                    <input type="text" class= "input" name="_pin1" pattern="[0-9]{3}" required></div>
                                            </div>	
                                        </div>
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
