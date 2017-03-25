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
                $(".datepicker").datepicker({minDate: 0});// create the datepickers
            });

            // this toggles the return date field depending on whether round trip is selected
            function toggleReturnDate() {
                if (document.getElementById("roundTripRadio").checked) {
                    document.getElementById("returnDateRow").style.display = "table-row";
                } else {
                    document.getElementById("returnDateRow").style.display = "none";
                }
            }

            // this toggles the search div depending on whether change flight is selected
            function toggleSearchDiv() {
                if (document.getElementById("changeFlightRadio").checked) {
                    document.getElementById("searchDiv").style.display = "block";
                    document.getElementById("form").action = "/PeregrineAirlines/ChangeFlight";
                } else {
                    document.getElementById("searchDiv").style.display = "none";
                    document.getElementById("form").action = "/PeregrineAirlines/CancelFlight";
                }
            }
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
            <!--header -->
            <header>
                <div class="wrapper">
                    <h1><a href="index.html" id="logo">Air lines</a></h1>
                    <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
                </div>
                <nav>
                    <ul id="menu">
                        <li><a href="/PeregrineAirlines/Home"><span><span>Home</span></span></a></li>
                        <li><a href="/PeregrineAirlines/Home"><span><span>Book Flight</span></span></a></li>
                        <li><a href="/PeregrineAirlines/CheckIn"><span><span>Check In</span></span></a></li>
                        <li id="menu_active" class="end"><a href="/PeregrineAirlines/ChangeFlight"><span><span>Change Flight</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="for_banners">
                    <article class="col1">
                        <div class="content">
                            <form:form id="form" modelAttribute="flightSearch" action="/PeregrineAirlines/ChangeFlight">
                                <div class="radio">
                                    <table>
                                        <tr>
                                            <td>Confirmation Number*</td>
                                            <td><form:input type="text" path="ticket.ticketId" class="input" required="true" /></td>
                                        </tr>
                                        <tr>
                                            <td>Passenger Last Name*</td>
                                            <td><form:input type="text" path="ticket.passengerLastname" class="input" required="true" /></td>
                                        </tr>
                                        <tr>
                                            <td>Cancel</td>
                                            <td><input type="radio" name="action" value="cancelTicket" onchange="toggleSearchDiv();" /></td>
                                        </tr>
                                        <tr>
                                            <td>Change</td>
                                            <td><input id="changeFlightRadio" type="radio" name="action" value="changeFlight" onchange="toggleSearchDiv();" checked="true" /></td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div id="searchDiv">
                                        <h4>Flight Search</h4>
                                        <table class="radio">
                                            <tr>
                                                <td>From City:</td>
                                                <td>
                                                    <form:select path="departingAirport">
                                                        <form:options items="${airports}" itemLabel="city" itemValue="airportId" />
                                                    </form:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>To City:</td>
                                                <td>
                                                    <form:select path="arrivingAirport">
                                                        <form:options items="${airports}" itemLabel="city" itemValue="airportId" />
                                                    </form:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>One way</td>
                                                <td><input type="radio" name="triptype" onchange="toggleReturnDate();" checked></td>
                                            </tr>
                                            <tr>
                                                <td>Round trip</td>
                                                <td><input id="roundTripRadio" type="radio" name="triptype" onchange="toggleReturnDate();"></td>
                                            </tr>
                                            <tr>
                                                <td>Depart Date:</td>
                                                <td><form:input type="date" class="datepicker input" path="departDate" /></td>
                                            </tr>
                                            <tr id="returnDateRow" style="display: none;">
                                                <td>Return Date:</td>
                                                <td><form:input type="date" class="datepicker input" path="returnDate" /></td>
                                            </tr>
                                            <tr>
                                                <td>Passengers</td>
                                                <td>
                                                    <form:select path="passengers">
                                                        <form:option value="1">1</form:option>
                                                        <form:option value="2">2</form:option>
                                                        <form:option value="3">3</form:option>
                                                        <form:option value="4">4</form:option>
                                                        <form:option value="5">5</form:option>
                                                    </form:select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div> 
                                    <table>
                                        <tr>
                                            <td></td>
                                            <td><input type="submit" class="button1" value="Continue"</td>
                                        </tr>
                                    </table>
                                </div>
                            </form:form>
                        </div>
                    </article>
                </div>
            </section>
            <!--content end-->
        </div>
    </body>
</html>