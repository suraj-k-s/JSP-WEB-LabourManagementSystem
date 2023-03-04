<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
if(request.getParameter("btn_post")!=null)
{
	String detail = request.getParameter("txt_details");
	
	String ins = "insert into tbl_workrequest(workrequest_details,workrequest_date,labour_id,workrequest_amount,user_id)values('"+detail+"',curdate(),'"+request.getParameter("txt_lid")+"','"+request.getParameter("txt_amount")+"','"+session.getAttribute("userid")+"')";
	if(con.executeCommand(ins))
	{
                response.sendRedirect("MyRequest.jsp");
	}
	else
	{
		out.println("<script>alert('Failed')</script>") ;
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
<h1>Request</h1>
<br><br>
<form id="form1" name="form1" method="post" action="">
  <table width="200" border="1">
    <tr>
      <td>Amount</td>
      <td><input type="text" pattern="^\d{5}$" name="txt_amount"/><input type="hidden" name="txt_lid" value="<%=request.getParameter("lid")%>"/></td>
    </tr>
    <tr>
      <td>Details</td>
      <td><label for="txt_details"></label>
      <textarea name="txt_details" id="txt_details" cols="45" rows="5"></textarea></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="btn_post" id="btn_post" value="Request" />
      </div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
 
</form>
</div>
<%@include file="Foot.jsp" %>
</body>
</html>