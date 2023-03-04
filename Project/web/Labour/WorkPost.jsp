<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("btn_post") != null) {
        String detail = request.getParameter("txt_details");
        String ins = "insert into tbl_workpost(workpost_details,workpost_date,labour_id,workpost_amount)values('" + detail + "',curdate(),'" + session.getAttribute("labourid") + "','" + request.getParameter("txt_amount") + "')";
        if (con.executeCommand(ins)) {
            response.sendRedirect("WorkPost.jsp");
        } else {
            out.println("<script>alert('Failed')</script>");
            System.out.println(ins);
        }

    }

    if (request.getParameter("did") != null) {

        String del = "delete from tbl_workpost where workpost_id = '" + request.getParameter("did") + "'";
        if (con.executeCommand(del)) {
            response.sendRedirect("WorkPost.jsp");
        } else {
            out.println("<script>alert('Failed')</script>");
        }

    }
    if (request.getParameter("aid") != null) {

         String a = "update tbl_workpost set workpost_status='2' where workpost_id='"+ request.getParameter("aid") + 
        "'";
        if (con.executeCommand(a)) {
            response.sendRedirect("WorkPost.jsp");
        } else {
            out.println("<script>alert('Failed')</script>");
        }

    }
        if (request.getParameter("rid") != null) {

         String a = "update tbl_workpost set workpost_status='3' where workpost_id='"+ request.getParameter("rid") + 
        "'";
        if (con.executeCommand(a)) {
            response.sendRedirect("WorkPost.jsp");
        } else {
            out.println("<script>alert('Failed')</script>");
        }

    }
        if (request.getParameter("fid") != null) {

         String a = "update tbl_workpost set workpost_status='4' where workpost_id='"+ request.getParameter("fid") + 
        "'";
        if (con.executeCommand(a)) {
            response.sendRedirect("WorkPost.jsp");
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
            <h1>Work Post</h1>
            <br /><br />
            <form id="form1" name="form1" method="post" action="">
                <table>
                    <tr>
                        <td>Amount</td>
                        <td><input type="text" pattern="^\d{5}$" name="txt_amount"/></td>
                    </tr>
                    <tr>
                        <td>Details</td>
                        <td><label for="txt_details"></label>
                            <textarea name="txt_details" id="txt_details" cols="45" rows="5"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div align="center">
                                <input type="submit" name="btn_post" id="btn_post" value="Post" />
                            </div></td>
                    </tr>
                </table>
                <p>&nbsp;</p>
                <table >
                    <tr>
                        <th width="38">Sl.No</th>
                        <th width="90">Date</th>
                        <th width="142">Details</th>
                        <th width="142">Amount</th>
                        <th width="104">Action</th>
                    </tr>
                    <%

                    int i = 0;
                    String sel = "select * from tbl_workpost where labour_id='"+session.getAttribute("labourid")+"' ORDER BY workpost_id DESC ";
                    ResultSet rs = con.selectCommand(sel);
                    while(rs.next())
                    {
                    i++;	
                    %>

                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("workpost_date")%></td>
                        <td><%=rs.getString("workpost_details")%></td>
                        <td><%=rs.getString("workpost_amount")%></td>
                        <td>
                            <%

                            if(rs.getString("workpost_status").equals("0"))
                            {
                            %>
                            <a href="WorkPost.jsp?did=<%=rs.getString("workpost_id")%>">Delete</a>
                            <%
                            }
                            else if(rs.getString("workpost_status").equals("1"))
                            {
                            %>
                            <a href="WorkPost.jsp?aid=<%=rs.getString("workpost_id")%>">Accept</a>
                            <a href="WorkPost.jsp?rid=<%=rs.getString("workpost_id")%>">Reject</a>
                            <%
                            }
                            else if(rs.getString("workpost_status").equals("3"))
                            {
                            %>
                            Rejected
                            <%
                            }
                            else if(rs.getString("workpost_status").equals("4"))
                            {
                            %>
                            Payment Pending
                            <%
                            }
                            else if(rs.getString("workpost_status").equals("5"))
                            {
                            %>
                            Completed
                            <%
                            }
                            else if(rs.getString("workpost_status").equals("2"))
                            {
                            String selU = "select * from tbl_user where user_id = '"+rs.getString("user_id")+"'";
                            ResultSet rs1 = con.selectCommand(selU);
                            rs1.next();
                            %>
                            <a href="tel:<%=rs1.getString("user_contact")%>">Contact</a> | 
                            <a href="WorkPost.jsp?fid=<%=rs.getString("workpost_id")%>">Finish</a>
                            <%
                            }


                            %>
                        </td>
                    </tr>

                    <%
                    }
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