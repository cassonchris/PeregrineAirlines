<%@page import="java.util.Collection"%>
<%@page import="com.peregrineairlines.entities.Airport"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Collection<Airport> airports = (Collection) request.getAttribute("airports");
    %>
    <head>
        <title>Home</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/reset.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/layout.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
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
    <!--header -->
    <body id="page1">
        <div class="main">
            <header>
                <div class="wrapper">
                    <h1><a href="/PeregrineAirlines/Home" id="logo">Airlines</a></h1>
                    <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
                </div>
                <nav>
                    <ul id="menu">
                        <li><li id="menu_active"><a href="/PeregrineAirlines/Home"><span><span>Home</span></span></a></li><li>
                        <li><a href="/PeregrineAirlines/Home"><span><span>Book Flight</span></span></a></li>
                        <li><a href="/PeregrineAirlines/CheckIn"><span><span>Check In</span></span></a></li>
                        <li><a href="#"><span><span>Change Flight</span></span></a></li>
                        <li class="end"><a href="Contacts.html"><span><span>Contact Us</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="for_banners">
                    <article class="col1">
                        <div class="tabs">
                            <div class="content">
                                <div class="tab-content" id="Flight">
                                    <form id="form_1" action="/PeregrineAirlines/SearchFlights">
                                        <input type="hidden" name="action" value="searchFlights" />
                                        <div class="radio">
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
                                                <tr>
                                                    <td></td>
                                                    <td><input type="submit" class="button1" value="Search Flights" /></td>
                                                </tr>
                                            </table>
                                        </div>  
                                    </form>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
            <!--content end-->
            <!--footer -->
            <footer>
            </footer>
            <!--footer end-->
            <script type="text/javascript"> Cufon.now();</script>
            <script>
                $(document).ready(function () {
                    tabs.init();
                });
                jQuery(document).ready(function ($) {
                    $('#form_1, #form_2, #form_3').jqTransform({imgPath: 'jqtransformplugin/img/'});
                });
                $(window).load(function () {
                    $('#slider').nivoSlider({
                        effect: 'fade', //Specify sets like: 'fold,fade,sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft' 
                        slices: 15,
                        animSpeed: 500,
                        pauseTime: 6000,
                        startSlide: 0, //Set starting Slide (0 index)
                        directionNav: false, //Next & Prev
                        directionNavHide: false, //Only show on hover
                        controlNav: false, //1,2,3...
                        controlNavThumbs: false, //Use thumbnails for Control Nav
                        controlNavThumbsFromRel: false, //Use image rel for thumbs
                        controlNavThumbsSearch: '.jpg', //Replace this with...
                        controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
                        keyboardNav: true, //Use left & right arrows
                        pauseOnHover: true, //Stop animation while hovering
                        manualAdvance: false, //Force manual transitions
                        captionOpacity: 1, //Universal caption opacity
                        beforeChange: function () {
                        },
                        afterChange: function () {
                        },
                        slideshowEnd: function () {
                        } //Triggers after all slides have been shown
                    });
                });
            </script>
        </div>
    </body>
</html>