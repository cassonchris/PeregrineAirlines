<%@page import="java.util.Collection"%>
<%@page import="com.peregrineairlines.entities.Ticket"%>
<!DOCTYPE html>
<%
    Collection<Ticket> purchasedTickets = (Collection) request.getAttribute("purchasedTickets");
    Ticket checkedTicket = (Ticket) request.getAttribute("checkedTicket");
    Ticket returnedTicket = (Ticket) request.getAttribute("returnedTicket");
%>
<html lang="en">
    <head>
        <title>CheckIn</title>
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
                        <li id="menu_active"><a href="/PeregrineAirlines/Home"><span><span>Home</span></span></a></li>
                        <li><a href="/PeregrineAirlines/Home"><span><span>Book Flight</span></span></a></li>
                        <li><a href="/PeregrineAirlines/CheckIn"><span><span>CheckIn</span></span></a></li>
                        <li><a href="/PeregrineAirlines/ChangeFlight"><span><span>Change Flight</span></span></a></li>
                        <li class="end"><a href="Contacts.html"><span><span>Contact Us</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="wrapper pad1" style="height: 500px;">
                    <% if (purchasedTickets != null) {%>
                    <h2 class="top">Order Summary</h2>
                    <table style="width: 100%;">
                        <tr>
                            <td><b>Ticket Number</b></td>
                            <td><b>Flight Number</b></td>
                            <td><b>Seat</b></td>
                            <td><b>Passenger First Name</b></td>
                            <td><b>Passenger Last Name</b></td>
                        </tr>
                        <%
                            for (Ticket ticket : purchasedTickets) {
                        %>
                        <tr>
                            <td><%= ticket.getTicketId()%></td>
                            <td><%= ticket.getFlight().getFlightId()%></td>
                            <td><%= ticket.getSeat()%></td>
                            <td><%= ticket.getPassengerFirstname()%></td>
                            <td><%= ticket.getPassengerLastname()%></td>
                        </tr>
                        <% }%>
                    </table>
                    <% }%>
                    <% if (checkedTicket != null) {%>
                    <h1 class="top">You are checked in</h1>
                    <table style="width: 100%;">
                        <tr>
                            <td><b>Ticket Number</b></td>
                            <td><b>Flight Number</b></td>
                            <td><b>Seat</b></td>
                            <td><b>Passenger First Name</b></td>
                            <td><b>Passenger Last Name</b></td>
                        </tr>
                        <tr>
                            <td><%= checkedTicket.getTicketId()%></td>
                            <td><%= checkedTicket.getFlight().getFlightId()%></td>
                            <td><%= checkedTicket.getSeat()%></td>
                            <td><%= checkedTicket.getPassengerFirstname()%></td>
                            <td><%= checkedTicket.getPassengerLastname()%></td>
                        </tr>
                    </table>
                    <% }%>
                    <% if (returnedTicket != null) {%>
                    <h1 class="top">Your ticket has been returned</h1>
                    <table style="width: 100%;">
                        <tr>
                            <td><b>Ticket Number</b></td>
                            <td><b>Flight Number</b></td>
                            <td><b>Seat</b></td>
                            <td><b>Passenger First Name</b></td>
                            <td><b>Passenger Last Name</b></td>
                        </tr>
                        <tr>
                            <td><%= returnedTicket.getTicketId()%></td>
                            <td><%= returnedTicket.getFlight().getFlightId()%></td>
                            <td><%= returnedTicket.getSeat()%></td>
                            <td><%= returnedTicket.getPassengerFirstname()%></td>
                            <td><%= returnedTicket.getPassengerLastname()%></td>
                        </tr>
                    </table>
                    <% }%>
                </div>
            </section>
        </div>
        <!--content end-->
        <script type="text/javascript"> Cufon.now();</script>
        <script>
            jQuery(document).ready(function ($) {
                $('.form_5').jqTransform({imgPath: 'jqtransformplugin/img/'});
            });
            $(document).ready(function () {
                tabs2.init();
            });
        </script>
    </body>
</html>