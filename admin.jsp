<%@ page import="java.sql.*" %>
<html>
<head><title>Admin Panel</title></head>
<body>
    <h2>Admin Panel</h2>
    <form method="post" action="admin.jsp">
        <input type="text" name="admin" placeholder="Username" />
        <input type="password" name="password" placeholder="Password" />
        <input type="submit" value="Login" />
    </form>
</body>
</html>
