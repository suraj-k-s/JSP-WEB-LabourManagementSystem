<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
	
	if(request.getParameter("did")!=null)
	{
		String del = "delete from tbl_workgallery where workgallery_id = '"+request.getParameter("did")+"'";
		if(con.executeCommand(del))
		{
                        response.sendRedirect("WorkGallery.jsp");
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
<h1>Work Gallery</h1>
<form method="post" enctype="multipart/form-data" action="../ActionPages/GalleryUploadAction.jsp" autocomplete="off">

  <table width="360" border="1">
    <tr>
      <td width="156">File</td>
      <td width="188"><input type="file" name="file_photo" /></td>
    </tr>
    <tr>
      <td>Caption</td>
      <td><textarea name="txt_caption"></textarea></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" name="btn_save" value="Add"></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="300" style="border-collapse:collapse;" align="center" id="dataT">
  <tr>
  <%
        int i =0;
 String sel = "select * from tbl_workgallery where labour_id = '"+session.getAttribute("labourid")+"'";
	ResultSet rs = con.selectCommand(sel);
	while(rs.next())
	{
		
		i++;
		%><td style="padding:30px">
            	<p style="border:1px solid black;padding:20px;text-align:center">
                    <img src="../Assets/WorkGallery/<%=rs.getString("workgallery_file")%>" style="border-radius:50%" width="80" height="80"/><br /><br />
                Caption : <%=rs.getString("workgallery_caption")%></br><br />
				<a style="color:green" href="WorkGallery.jsp?did=<%=rs.getString("workgallery_id")%>">Delete</a>
                </p>
			</td>
		<%
		if(i==4)
		{
			i=0;
                        out.println("</tr><tr>");
		}
	}
  
  
  %>
  </table>

</form>
</div>
       <%@include file="Foot.jsp" %>
</body>
</html>