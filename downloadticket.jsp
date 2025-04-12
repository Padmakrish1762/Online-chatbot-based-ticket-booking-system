<%@ page import="java.io.*" %>
<%
    String bookingID = request.getParameter("bookingID");
    String currentMuseum = request.getParameter("currentMuseum");
    String currentLocation = request.getParameter("currentLocation");
    String visitDate = request.getParameter("visitDate");
    String adultCount = request.getParameter("adults");
    String childCount = request.getParameter("children");
    String qrCodePath = "images/ticket_qr_" + bookingID + ".png";
%>
<html>
<head><title>Download Ticket</title></head>
<body>
    <h2>Booking Confirmation</h2>
    <p>Museum: <%= currentMuseum %></p>
    <p>Location: <%= currentLocation %></p>
    <p>Date: <%= visitDate %></p>
    <p>Adults: <%= adultCount %></p>
    <p>Children: <%= childCount %></p>
    <p><img src="<%= qrCodePath %>" width="200"/></p>
</body>
</html>
