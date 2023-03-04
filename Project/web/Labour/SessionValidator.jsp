<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("labourid") == null)
        {
            response.sendRedirect("../Guest/Login.jsp");
        }
    %>