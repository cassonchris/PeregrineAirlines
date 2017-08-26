<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>CheckIn</title>
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
        <script>
            // this displays the price
            function displayPrice(num_bags)
            {
                var divobj = document.getElementById('totalPrice');
                divobj.display = 'block';
                divobj.innerHTML = "Total Price For Baggage $" + num_bags * 20;
            }
        </script>
        <!--[if lt IE 9]>
        <script type="text/javascript" src="js/html5.js"></script>
        <style type="text/css">
                .main, .tabs ul.nav a, .content, .button1, .box2, .top { behavior:url(js/PIE.htc)}
        </style>
        <![endif]-->
        <!--[if lt IE 7]>
                <div style=' clear: both; text-align:center; position: relative;'>
                        <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0"  alt="" /></a>
                </div>
        <![endif]-->
    </head>
    <body id="page5">
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
                        <li><a href="/PeregrineAirlines/Home"><span><span>Book</span></span></a></li>
                        <li id="menu_active"><a href="/PeregrineAirlines/CheckIn"><span><span>Check In</span></span></a></li>
                        <li class="end"><a href="/PeregrineAirlines/ChangeFlight"><span><span>Change Flight</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="for_banners">
                    <article class="col1">
                        <h2 class="top">Confirm your Detail</h2>
                        <form:form modelAttribute="checkIn" id="form_1" action="/PeregrineAirlines/checkIn">
                            <form:input type="hidden" path="ticket.ticketId" value="${checkIn.ticket.ticketId}" />
                            <div class="radio">
                                <table>
                                    <tr>
                                        <td>First Name:</td>
                                        <td>${checkIn.ticket.passengerFirstname}</td>
                                    </tr>
                                    <tr>
                                        <td>Last Name:</td>
                                        <td>${checkIn.ticket.passengerLastname}</td>
                                    </tr>
                                    <tr>
                                        <td>Flight:</td>
                                        <td>${checkIn.ticket.flight.flightId}: ${checkIn.ticket.flight.departingAirport.city} to ${checkIn.ticket.flight.arrivingAirport.city}</td>
                                    </tr>
                                    <tr>
                                        <td>Number of Checked Bags:</td>
                                        <td>
                                            <form:select id="num_bags" path="numberOfBags" onchange="displayPrice(this.value);">
                                                <option value="None">Select # of bag(s)</option>
                                                <option value="0">0 ($0)</option>
                                                <option value="1">1 ($20)</option>
                                                <option value="2">2 ($40)</option>
                                                <option value="3">3 ($60)</option>
                                                <option value="4">4 ($80)</option>
                                            </form:select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><div id="totalPrice"></div></td>
                                    </tr>
                                    <tr>
                                        <td><input class="button1" type="reset" value="Cancel" /></td>
                                        <td><input class="button1" type="submit" value="Check In" /></td>
                                    </tr>
                                </table>
                            </div>
                        </form:form>
                    </article>
                </div>
            </section>
            <!--content end-->
        </div>
    </body>
</html>