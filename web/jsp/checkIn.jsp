<!DOCTYPE html>
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
                    <h1><a href="index.html" id="logo">Air lines</a></h1>
                    <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
                </div>
                <nav>
                    <ul id="menu">
                        <li><a href="/PeregrineAirlines/Home"><span><span>Home</span></span></a></li>
                        <li><a href="/PeregrineAirlines/Home"><span><span>Book Flight</span></span></a></li>
                        <li id="menu_active"><a href="/PeregrineAirlines/CheckIn"><span><span>CheckIn</span></span></a></li>
                        <li><a href="Book.html"><span><span>Change Flight</span></span></a></li>
                        <li class="end"><a href="Contacts.html"><span><span>Contact Us</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <h2 class="top">Check In</h2>
                <form action="/PeregrineAirlines/CheckIn">
                    <input type="hidden" name="action" value="findTicket" />
                    <table class="radio">
                        <tr>
                            <td>Confirmation Number*</td>
                            <td><input type="text" name="ticketId" class="input" required /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" class="button1" value="Check In" /></td>
                        </tr>
                    </table>
                </form>
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