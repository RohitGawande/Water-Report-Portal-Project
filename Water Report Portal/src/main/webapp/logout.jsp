<%
    session.invalidate();
    response.sendRedirect("adminLogin.jsp?error=You have logged out successfully");
%>
