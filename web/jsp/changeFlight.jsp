<%-- 
    Document   : changeFlight
    Created on : Mar 19, 2015, 11:04:18 AM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Change Flight</h1>
        <form action="/PeregrineAirlines/SearchFlights">
            <input type="hidden" name="action" value="changeFlightSearch" />
            <input type="submit" value="Search Flights" />
        </form>
        <form action="/PeregrineAirlines/SearchFlights">
            <input type="hidden" name="action" value="changeFlightSelect" />
            <input type="submit" value="Select Flight" />
        </form>
        <form action="/PeregrineAirlines/Order">
            <input type="hidden" name="action" value="changeFlightPurchase" />
            <input type="submit" value="Change Flignt" />
        </form>
    </body>
</html>
