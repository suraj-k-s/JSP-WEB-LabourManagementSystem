<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("btn_submit") != null) {
        String complaint = request.getParameter("txt_complaint");
        String complainttype = request.getParameter("sel_complainttype_name");

        if (request.getParameter("txt_complaint") != null) {
            String ins = "insert into tbl_complaint (complaint_content,complainttype_id,user_id,complaint_date) values('" + complaint + "','" + complainttype + "','" + session.getAttribute("userid") + "',curdate())";

            if (con.executeCommand(ins)) {
                response.sendRedirect("Complaint.jsp");
            } else {
                out.println("<script>alert('Failed')</script>");

            }

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
            <h1>Complaint</h1>
            <br><br>
                    <form id="form1" name="form1" method="post" action="">
                        <table >
                            <tr>
                                <td>Type</td>
                                <td><label for="sel_complainttype_name"></label>
                                    <select name="sel_complainttype_name" id="sel_complainttype_name">
                                        <option value="">-----Select-----</option>
                                        <%
                                        String sel ="select * from tbl_complainttype ";
                                        ResultSet rs = con.selectCommand(sel);
                                        while(rs.next())
                                        {
                                        %>
                                        <option value="<%=rs.getString("complainttype_id")%>" 
                                               
                                                ><%=rs.getString("complainttype_name")%></option >
                                        <%
                                        }
                                       %>
                                </td>



                            </tr>
                            <tr>
                                <td>Complaint</td>
                                <td><label for="txt_complaint"></label>
                                    <textarea name="txt_complaint" id="txt_complaint" cols="45" rows="5"></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><input type="submit" name="btn_submit" id="btn_submit" value="Submit" /></td>
                            </tr>
                        </table>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <table>
                            <tr>
                                <td>Sl.No</td>
                                <td>type</td> 
                                <td>content</td>
                                <td>date</td>
                                <td>reply</td>
                            </tr>
                            <%
                            int i=0;
                            String sel1 = "select * from tbl_complaint c inner join tbl_complainttype ct on ct.complainttype_id=c.complainttype_id where user_id='"+session.getAttribute("userid")+"'";
                            ResultSet rs1 = con.selectCommand(sel1);
                            while(rs1.next())
                            {
                            i++;

                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=rs1.getString("complainttype_name")%></td>
                                <td><%=rs1.getString("complaint_content")%></td>
                                <td><%=rs1.getString("complaint_date")%></td>
                                <td><%=rs1.getString("complaint_reply")%></td>
                            </tr>
                            <%
                            }
                            %>
                        </table>
                    </form>
                    </div>
                   <%@include file="Foot.jsp" %>
                    </body>
                    </html>