<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book Flight</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="<c:url value="/resources/css/reset.css" />" type="text/css" media="all">
        <link rel="stylesheet" href="<c:url value="/resources/css/layout.css" />" type="text/css" media="all">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="all">
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.5.2.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/cufon-yui.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/cufon-replace.js" />"></script>  
        <script type="text/javascript" src="<c:url value="/resources/js/Cabin_400.font.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/tabs.js" />"></script> 
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.jqtransform.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.nivo.slider.pack.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/atooltip.jquery.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/script.js" />"></script>
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
                    <form:form modelAttribute="flightSearch" action="/PeregrineAirlines/order">
                        <form:input type="hidden" path="passengers" value="${flightSearch.passengers}" />
                        <form:input type="hidden" path="exchangeTicketId" value="${exchangeTicketId}" />
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
                                    <c:forEach var="flight" items="${flights}">
                                    <tr>
                                        <td><form:radiobutton path="flightId" value="${flight.flightId}" /></td>
                                        <td>${flight.departingAirport.city} to ${flight.arrivingAirport.city}</td>
                                        <td>${flight.flightDatetime}</td>
                                        <td>${flight.planeModel.name}</td>
                                        <td>${flight.cheapestTicketPrice} - ${flight.highestTicketPrice}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
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
                                    <c:forEach var="flight" items="${returnFlights}">
                                    <tr>
                                        <td><form:radiobutton path="returnFlightId" value="${flight.flightId}" /></td>
                                        <td>${flight.departingAirport.city} to ${flight.arrivingAirport.city}</td>
                                        <td>${flight.flightDatetime}</td>
                                        <td>${flight.planeModel.name}</td>
                                        <td>${flight.cheapestTicketPrice} - ${flight.highestTicketPrice}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                        <input class="button1" type="submit" value="Select Flight(s)" />
                    </form:form>
                </div>
            </section>
        </div>
    </body>
</html>

