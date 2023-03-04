<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("aid") != null) {

        String a = "update tbl_workrequest set workrequest_status='1' where workrequest_id='" + request.getParameter("aid")
                + "'";
        if (con.executeCommand(a)) {
            response.sendRedirect("WorkRequest.jsp");
        } else {
            out.println("<script>alert('Failed')</script>");
        }

    }
    if (request.getParameter("rid") != null) {

        String a = "update tbl_workrequest set workrequest_status='2' where workrequest_id='" + request.getParameter("rid")
                + "'";
        if (con.executeCommand(a)) {
            response.sendRedirect("WorkRequest.jsp");
        } else {
            out.println("<script>alert('Failed')</script>");
        }

    }
    if (request.getParameter("fid") != null) {

        String a = "update tbl_workrequest set workrequest_status='3' where workrequest_id='" + request.getParameter("fid")
                + "'";
        if (con.executeCommand(a)) {
            response.sendRedirect("WorkRequest.jsp");
        } else {
            out.println("<script>alert('Failed')</script>");
        }

    }


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <%@include file="Head.jsp" %><%@include file="SessionValidator.jsp" %>
    </head>

    <body>
        <div align="center" id="tab">
            <form id="form1" name="form1" method="post" action="">
                <p>&nbsp;</p>
                <table >
                    <tr>
                        <th width="38">Sl.No</th>
                        <th width="90">Date</th>
                        <th width="142">Details</th>
                        <th width="142">Amount</th>
                        <th width="104">Action</th>
                    </tr>
                    <%                        int i = 0;
                        String sel = "select * from tbl_workrequest where labour_id='" + session.getAttribute("labourid") + "' ORDER BY workrequest_id DESC ";
                        ResultSet rs = con.selectCommand(sel);
                        while (rs.next()) {
                            i++;
                    %>

                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("workrequest_date")%></td>
                        <td><%=rs.getString("workrequest_details")%></td>
                        <td><%=rs.getString("workrequest_amount")%></td>
                        <td>
                            <%
                                if (rs.getString("workrequest_status").equals("0")) {
                            %>
                            <a href="WorkRequest.jsp?aid=<%=rs.getString("workrequest_id")%>">Accept</a>
                            <a href="WorkRequest.jsp?rid=<%=rs.getString("workrequest_id")%>">Reject</a>
                            <%
                            } else if (rs.getString("workrequest_status").equals("2")) {
                            %>
                            Rejected
                            <%
                            } else if (rs.getString("workrequest_status").equals("3")) {
                            %>
                            Payment Pending
                            <%
                            } else if (rs.getString("workrequest_status").equals("4")) {
                            %>
                            Completed
                            <%
                            } else if (rs.getString("workrequest_status").equals("1")) {
                                String selU = "select * from tbl_user where user_id = '" + rs.getString("user_id") + "'";
                                ResultSet rs1 = con.selectCommand(selU);
                                rs1.next();
                            %>
                            <a href="tel:<%=rs1.getString("user_contact")%>">Contact</a> | 
                            <a href="WorkRequest.jsp?fid=<%=rs.getString("workrequest_id")%>">Finish</a>
                            <%
                                }


                            %>
                        </td>
                    </tr>

                    <%                        }
                    %>
                </table>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
            </form>
        </div>
        <%@include file="Foot.jsp" %>
    </body>
</html>