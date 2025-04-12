<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.sql.*, java.io.File" %>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.BarcodeFormat, com.google.zxing.client.j2se.MatrixToImageWriter, com.google.zxing.common.BitMatrix" %>
<%
    String totalAmount = request.getParameter("total");
    String adultCount = request.getParameter("adults");
    String childCount = request.getParameter("children");
    String visitDate = request.getParameter("visitDate");
    String currentLocation = request.getParameter("currentLocation");
    String currentMuseum = request.getParameter("currentMuseum");
    String bookingID = "NM" + System.currentTimeMillis();
    Date currentDate = new Date();
    String loggedInUsername = (String) session.getAttribute("username");

    SimpleDateFormat visitDateFormatter = new SimpleDateFormat("dd/MM/yyyy");
    String formattedVisitDate = "N/A";
    try {
        if (visitDate != null && !visitDate.isEmpty()) {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedVisitDate = inputFormat.parse(visitDate);
            formattedVisitDate = visitDateFormatter.format(parsedVisitDate);
        }
    } catch (Exception e) {
        formattedVisitDate = "Invalid Date";
    }

    String qrText = "Museum Name: " + currentMuseum + "\nLocation: " + currentLocation + "\nBooking ID: " + bookingID + "\nDate: " + formattedVisitDate;
    String qrFilePath = application.getRealPath("/") + "/images/ticket_qr_" + bookingID + ".png";

    try {
        QRCodeWriter qrWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrWriter.encode(qrText, BarcodeFormat.QR_CODE, 300, 300);
        File qrFile = new File(qrFilePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", qrFile.toPath());
    } catch (Exception e) {
        out.println("QR Generation Error: " + e.getMessage());
    }

    response.sendRedirect("downloadticket.jsp?bookingID=" + bookingID + "&currentMuseum=" + currentMuseum +
        "&currentLocation=" + currentLocation + "&visitDate=" + formattedVisitDate + "&adults=" + adultCount + "&children=" + childCount);
%>
