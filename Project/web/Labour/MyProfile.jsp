<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<%@include file="Head.jsp" %><%@include file="SessionValidator.jsp" %>
</head>

<body>
<div align="center" id="tab">
<h1>My Profile</h1>
<form id="form1" name="form1" method="post" action="">
<%

String sel="select * from tbl_labour where labour_id='"+session.getAttribute("labourid")+"'";
ResultSet rs = con.selectCommand(sel);
if(rs.next())
{
%>
  <table width="360" border="1">
    <tr>
      <td width="156">Name</td>
      <td width="188"><%=rs.getString("labour_name")%></td>
    </tr>
    <tr>
      <td>Contact</td>
      <td><%=rs.getString("labour_contact")%></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><%=rs.getString("labour_email")%></td>
    </tr>
    <tr>
      <td>Address</td>
      <td><label for="Address"></label><%=rs.getString("labour_address")%></td>
    </tr>
    <tr>
      <td><a href="EditProfile.jsp">Edit Profile</a></td>
      <td><a href="ChangePassword.jsp">Change Password</a></td>
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