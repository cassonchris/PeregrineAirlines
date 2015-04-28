<%@page import="com.peregrineairlines.entities.Airport"%>
<%@page import="java.util.Collection"%>
<!DOCTYPE html>
<%
    Collection<Airport> airports = (Collection) request.getAttribute("airports");
    String message = (String) request.getAttribute("message");
%>
<html lang="en">
    <head>
        <title>CheckIn</title>
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
                $(".datepicker").datepicker({minDate: 0});
            });

            function toggleReturnDate() {
                if (document.getElementById("roundTripRadio").checked) {
                    document.getElementById("returnDateRow").style.display = "table-row";
                } else {
                    document.getElementById("returnDateRow").style.display = "none";
                }
            }

            function toggleSearchDiv() {
                if (document.getElementById("changeFlightRadio").checked) {
                    document.getElementById("searchDiv").style.display = "block";
                } else {
                    document.getElementById("searchDiv").style.display = "none";
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
                        <li><a href="/PeregrineAirlines/CheckIn"><span><span>CheckIn</span></span></a></li>
                        <li id="menu_active"><a href="/PeregrineAirlines/ChangeFlight"><span><span>Change Flight</span></span></a></li>
                        <li class="end"><a href="Contacts.html"><span><span>Contact Us</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <h2 class="top">Change Flight</h2>
                <% if (message != null) {%>
                <h3 class="top"><%= message%></h3>
                <% }%>
                <form action="/PeregrineAirlines/ChangeFlight">
                    <table class="radio">
                        <tr>
                            <td>Confirmation Number*</td>
                            <td><input type="text" name="ticketId" class="input" required /></td>
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
                    <div id="searchDiv">
                        <table class="radio">
                            <tr>
                                <td>One way</td>
                                <td><input type="radio" name="triptype" onchange="toggleReturnDate();" checked></td>
                            </tr>
                            <tr>
                                <td>Round trip</td>
                                <td><input id="roundTripRadio" type="radio" name="triptype" onchange="toggleReturnDate();"></td>
                            </tr>
                            <tr>
                                <td>From City:</td>
                                <td>
                                    <select name="from">
                                        <%
                                            if (airports != null) {
                                                for (Airport airport : airports) {
                                        %>
                                        <option value="<%= airport.getAirportId()%>"><%= airport.getCity()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>To City:</td>
                                <td>
                                    <select name="to">
                                        <%
                                            if (airports != null) {
                                                for (Airport airport : airports) {
                                        %>
                                        <option value="<%= airport.getAirportId()%>"><%= airport.getCity()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Depart Date:</td>
                                <td><input type="date" class="datepicker" name="departdate" /></td>
                            </tr>
                            <tr id="returnDateRow" style="display: none;">
                                <td>Return Date:</td>
                                <td><input type="date" class="datepicker" name="returndate" /></td>
                            </tr>
                            <tr>
                                <td>Passengers</td>
                                <td>
                                    <select name="passengers">
                                        <option></option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
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
                </form>
            </section>
            <!--content end-->
        </div>
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