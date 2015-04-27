<%@page import="java.util.Collection"%>
<%@page import="com.peregrineairlines.entities.Ticket"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Integer numberOfBags = (Integer) request.getAttribute("numberOfBags");
        String ticketId = (String) request.getAttribute("ticketId");
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
                </div>
                <nav>
                    <ul id="menu">
                        <li><a href="/PeregrineAirlines/Home"><span><span>Home</span></span></a></li>
                        <li id="menu_active"><a href="/PeregrineAirlines/Home"><span><span>Book Flight</span></span></a></li>
                        <li><a href="#"><span><span>Change Flight</span></span></a></li>
                        <li><a href="/PeregrineAirlines/CheckIn"><span><span>Checkin</span></span></a></li>
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
                                <form id="form_5" class="form_5" method="post" action="/PeregrineAirlines/CheckIn">
                                    <input type="hidden" name="action" value="checkIn" />
                                    <input type="hidden" name="ticketId" value="<%= ticketId%>" />
                                    <h2 class="top">Baggage</h2>
                                    <table>
                                        <tr>
                                            <td>Number of Bags</td>
                                            <td><%= numberOfBags%></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>$<%= numberOfBags * 20%></td>
                                        </tr>
                                    </table>

                                    <h2 class="top">Payment Information</h2>
                                    <div class="pad">
                                        <div class="wrapper under">
                                            <div class="row"><span class="left">First Name*</span>
                                                <input type="text" name="customerFirstName" class="input" required /></div>

                                            <div class="row"><span class="left">Last Name*</span>
                                                <input type="text" name="customerLastName" class="input" required /></div>

                                            <div class="row"><span class="left">Card Num*</span>
                                                <input type="text" class="input" pattern="[0-9]{16}" required /></div>
                                            <div class = "row">	<span class="left"> Expiry Date:</span>
                                                <input type="date" /></div>
                                            <div class = "row"><span class="left">CVV:</span> 							
                                                <input type="text" class="input" pattern="[0-9]{3}" required /></div>
                                        </div>	
                                    </div>
                                    <input type="submit" class="button1" value="Pay for Bags" />
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
