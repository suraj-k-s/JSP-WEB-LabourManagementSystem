<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

if(request.getParameter("btn_save")!=null)
{
		String feedback = request.getParameter("txt_feedback");
		
		String ins = "insert into tbl_feedback (feedback_content,user_id,feedback_date) values('"+feedback+"','"+session.getAttribute("userid")+"',curdate())";
		
			if(con.executeCommand(ins))
			{
				%>
				<script type="text/javascript">
                                alert("Feedback Sumbitted");
                                setTimeout(function(){window.location.href='HomePage.jsp'},10);
                            </script>                
				<%
			}
			else
			{
				%><script>alert('Failed')</script><%
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
<h1>Feedback</h1>
<br><br>
<form id="form1" name="form1" method="post" action="">
  <table width="200" border="1">
    <tr>
      <td>Feedback</td>
      <td><label for="txt_feedback"></label>
        <textarea name="txt_feedback" id="txt_feedback" cols="45" rows="5"></textarea></td>
    </tr>
    <tr>
      <td align="center" colspan="2"><input type="submit" name="btn_save" id="btn_save" value="Submit" /></td>
      </tr>
  </table>
</form>
</div>
</body>
  <%@include file="Foot.jsp" %>
</html>