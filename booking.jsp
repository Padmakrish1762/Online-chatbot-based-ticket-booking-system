<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%
    String username = request.getParameter("username");
    session.setAttribute("username", username);
%>
<html>
<head><title>Booking</title></head>
<body>
    <form method="post" action="payment.jsp">
        Museum: <input type="text" name="currentMuseum" /><br/>
        Location: <input type="text" name="currentLocation" /><br/>
        Date: <input type="date" name="visitDate" /><br/>
        Adults: <input type="number" name="adults" /><br/>
        Children: <input type="number" name="children" /><br/>
        <input type="submit" value="Book" />
    </form>
</body>
</html>
