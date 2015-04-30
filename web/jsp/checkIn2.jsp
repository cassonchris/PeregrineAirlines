<%@page import="com.peregrineairlines.entities.Ticket"%>
<!DOCTYPE html>
<%
    // get attributes set by servlet
    Ticket ticket = (Ticket) request.getAttribute("ticket");
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
                        <% if (ticket != null) {%>
                        <form id="form_1" action="/PeregrineAirlines/CheckIn">
                            <input type="hidden" name="action" value="checkIn" />
                            <input type="hidden" name="ticketId" value="<%= ticket.getTicketId()%>" />
                            <div class="radio">
                                <table>
                                    <tr>
                                        <td>First Name:</td>
                                        <td><%= ticket.getPassengerFirstname()%></td>
                                    </tr>
                                    <tr>
                                        <td>Last Name:</td>
                                        <td><%= ticket.getPassengerLastname()%></td>
                                    </tr>
                                    <tr>
                                        <td>Flight:</td>
                                        <td><%= ticket.getFlight().getFlightId()%>: <%= ticket.getFlight().getDepartingAirport().getCity()%> to <%= ticket.getFlight().getArrivingAirport().getCity()%></td>
                                    </tr>
                                    <tr>
                                        <td>Number of Checked Bags:</td>
                                        <td>
                                            <select id="num_bags" name="numberOfBags" onchange="displayPrice(this.value);">
                                                <option value="None">Select # of bag(s)</option>
                                                <option value="0">0 ($0)</option>
                                                <option value="1">1 ($20)</option>
                                                <option value="2">2 ($40)</option>
                                                <option value="3">3 ($60)</option>
                                                <option value="4">4 ($80)</option>
                                            </select>
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
                        </form>
                        <% } else { %>
                        <h2 class="top">TODO - The user shouldn't be seeing this</h2>
                        <% }%>
                    </article>
                </div>
            </section>
            <!--content end-->
        </div>
    </body>
</html>