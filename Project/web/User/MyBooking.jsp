<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%    if (request.getParameter("cid") != null) {
        String a = "update tbl_workpost set workpost_status='0',user_id='0' where workpost_id='" + request.getParameter("cid") + "'";
        if (con.executeCommand(a)) {
            response.sendRedirect("MyBooking.jsp");
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
            <h1>Bookings</h1>
            <br><br>
                    <form id="form1" name="form1" method="post" action="">
                        <table width="402" border="1">
                            <tr>
                                <th width="38">Sl.No</th>
                                <th width="90">Date</th>
                                <th width="142">Details</th>
                                <th width="142">Amount</th>
                                <th width="104">Action</th>
                            </tr>
                            <%
                                int i = 0;
                                String sel = "select * from tbl_workpost where user_id='" + session.getAttribute("userid") + "' ORDER BY workpost_id DESC ";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                                    i++;
                            %>

                            <tr>
                                <td><%=i%></td>
                                <td><%=rs.getString("workpost_date")%></td>
                                <td><%=rs.getString("workpost_details")%></td>
                                <td><%=rs.getString("workpost_amount")%></td>
                                <td>
                                    <%

                                        if (rs.getString("workpost_status").equals("1")) {
                                    %>
                                    <a href="MyBooking.jsp?cid=<%=rs.getString("workpost_id")%>">Cancel</a>
                                    <%
                                    } else if (rs.getString("workpost_status").equals("3")) {
                                    %>
                                    Rejected
                                    <%
                                    } else if (rs.getString("workpost_status").equals("4")) {
                                    %>
                                    <a href="BPayment.jsp?bid=<%=rs.getString("workpost_id")%>">Pay Now</a>
                                    <%
                                    } else if (rs.getString("workpost_status").equals("5")) {
                                    %>
                                    Completed | <a href="LabourRating.jsp?lid=<%=rs.getString("labour_id")%>">Rate Now</a>
                                    <%
                                    } else if (rs.getString("workpost_status").equals("2")) {
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
                    </body>
                    <%@include file="Foot.jsp" %>
                    </html>