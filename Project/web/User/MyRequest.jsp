
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%    if (request.getParameter("did") != null) {
        String del = "delete from tbl_workrequest where workrequest_id = '" + request.getParameter("did") + "'";
        if (con.executeCommand(del)) {
            response.sendRedirect("MyRequest.jsp");
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
            <h1>Requests</h1>
            <form id="form1" name="form1" method="request" action="">
                <p>&nbsp;</p>
                <table width="402" border="1">
                    <tr>
                        <th width="38">Sl.No</th>
                        <th width="90">Date</th>
                        <th width="142">Details</th>
                        <th width="142">Amount</th>
                        <th width="104">Action</th>
                    </tr>
                    <%                                int i = 0;
                        String sel = "select * from tbl_workrequest where user_id='" + session.getAttribute("userid") + "' ORDER BY workrequest_id DESC ";
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
                            <a href="MyRequest.jsp?did=<%=rs.getString("workrequest_id")%>">Delete</a>
                            <%
                            } else if (rs.getString("workrequest_status").equals("2")) {
                            %>
                            Rejected
                            <%
                            } else if (rs.getString("workrequest_status").equals("3")) {
                            %>
                            <a href="PaymentGateway.jsp?pid=<%=rs.getString("workrequest_id")%>">Pay Now</a>
                            <%
                            } else if (rs.getString("workrequest_status").equals("4")) {
                            %>
                            Completed | <a href="LabourRating.jsp?lid=<%=rs.getString("labour_id")%>">Rate Now</a>
                            <%
                            } else if (rs.getString("workrequest_status").equals("1")) {
                                String selU = "select * from tbl_labour where labour_id = '" + rs.getString("labour_id") + "'";
                                ResultSet rs1 = con.selectCommand(selU);
                                rs1.next();
                            %>
                            <a href="tel:<%=rs1.getString("labour_contact")%>">Contact</a>
                            <%
                                }


                            %>
                        </td>
                    </tr>

                    <%       }
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