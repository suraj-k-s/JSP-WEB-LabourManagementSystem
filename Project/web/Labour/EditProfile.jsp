<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("btn_Submit") != null) {
        String name = request.getParameter("txt_name");
        String contact = request.getParameter("txt_contact");
        String email = request.getParameter("txt_email");
        String address = request.getParameter("txt_address");

        String up = "update tbl_labour set labour_name='" + name + "',labour_contact='" + contact + "',labour_email='" + email + "',labour_address='" + address + "' where labour_id='" + session.getAttribute("labourid") + "'";

        if (con.executeCommand(up)) {
%>
<script type="text/javascript">
    alert("Updated");
    setTimeout(function() {
        window.location.href = 'EditProfile.php'
    }, 40);
</script>
<%
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
            <h1>Edit Profile</h1>
            <br /><br />
            <form id="form1" name="form1" method="post" action="">

                <%    String sel = "select * from tbl_labour where labour_id='" + session.getAttribute("labourid") + "'";
                    ResultSet rs = con.selectCommand(sel);
                    if (rs.next()) {
                %>
                <table width="200" border="1">
                    <tr>
                        <td>Name</td>
                        <td><label for="txt_name"></label>
                            <input type="text" name="txt_name" value="<%=rs.getString("labour_name")%>" id="txt_name" /></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><label for="txt_contact"></label>
                            <input type="text" name="txt_contact" value="<%=rs.getString("labour_contact")%>" id="txt_contact" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><label for="txt_email"></label>
                            <input type="text" name="txt_email"  value="<%=rs.getString("labour_email")%>" /></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><label for="txt_address"></label>
                            <textarea name="txt_address"  id="txt_address" cols="45" rows="5"><%=rs.getString("labour_address")%></textarea></td>

                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="btn_Submit" id="btn_Submit" value="Submit" /></td>
                    </tr>
                </table>

                <%

                    }

                %>

            </form>
        </div>
        <%@include file="Foot.jsp" %>
    </body>
</html>