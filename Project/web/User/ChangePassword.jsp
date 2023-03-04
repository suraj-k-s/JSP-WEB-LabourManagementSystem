<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
if(request.getParameter("btn_save")!=null)
{
	
	
	
	String currentPassword= request.getParameter("txt_password");
        String newPassword= request.getParameter("txt_newpassword");
        String rePassword= request.getParameter("txt_repassword");
	
	String sel="select * from tbl_user where user_id='"+session.getAttribute("userid")+"'";
        ResultSet data = con.selectCommand(sel);
        data.next();
	String dbPassword = data.getString("user_password");
		
		if(dbPassword.equals(currentPassword))
		{
				if(newPassword.equals(rePassword))
				{
					String up="update tbl_user set user_password='"+newPassword+"' where user_id='"+session.getAttribute("userid")+"'";
                                    if(con.executeCommand(up))
					{
					out.println("<script>alert('Updated')</script>");
					}
				}
				else
				{out.println("<script>alert('Password Missmatch')</script>");
				}
		}
		else
		{out.println("<script>alert('Incorrect Current Password')</script>");	
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
<h1>Change Password</h1>
<br /><br />
<form id="form1" name="form1" method="post" action="">
  <table width="700" border="1">
    <tr>
      <td>Current Password</td>
      <td><label for="txt_password"></label>
      <input type="text" name="txt_password" id="txt_password" /></td>
    </tr>
    <tr>
      <td>New Password</td>
      <td><label for="txt_newpassword"></label>
      <input type="text" name="txt_newpassword" id="txt_newpassword" /></td>
    </tr>
    <tr>
      <td>Re-Password</td>
      <td><label for="txt_repassword"></label>
      <input type="text" name="txt_repassword" id="txt_repassword" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="btn_save" id="btn_save" value="save" /></td>
    </tr>
  </table>
</form>
</div>
<%@include file="Foot.jsp" %>
</body>
</html>