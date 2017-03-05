<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Book Flight</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="<c:url value="/resources/css/reset.css" />" type="text/css" media="all">
        <link rel="stylesheet" href="<c:url value="/resources/css/layout.css" />" type="text/css" media="all">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="all">
        <link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css" />" />
        <script src="<c:url value="/resources/js/jquery-1.9.1.js" />"></script>
        <script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/cufon-yui.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/cufon-replace.js" />"></script>  
        <script type="text/javascript" src="<c:url value="/resources/js/Cabin_400.font.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/tabs.js" />"></script> 
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.jqtransform.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.nivo.slider.pack.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/atooltip.jquery.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/script.js" />"></script>
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
                                            <input type="hidden" name="ticketCount" value="${tickets.size()}" />
                                            <c:forEach var="ticket" items="${tickets}" varStatus="i">
                                                <input type="hidden" name="ticket${i.index}" value="${ticket.ticketId}" />
                                                <tr>
                                                    <td>${ticket.seat}</td>
                                                    <td>${ticket.flight.departingAirport.city} to ${ticket.flight.arrivingAirport.city}</td>
                                                    <td>${ticket.flight.flightDatetime}</td>
                                                    <td>$${ticket.price}</td>
                                                    <td><input type="text" class="input" name="firstName${i.index}" required="true" /></td>
                                                    <td><input type="text" class="input" name="lastName${i.index}" required="true" /></td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>Total $${orderTotal}</td>
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
