<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>Untitled Document</title>
        </head>
    <%@include file="Head.jsp" %><%@include file="SessionValidator.jsp" %>
    <body>
        <table width="300" style="border-collapse:collapse;" align="center" id="dataT">
            <tr>
                <%
                int i = 0;
                String sel = "select * from tbl_workgallery where labour_id = '"+request.getParameter("lid")+"'";
                      ResultSet rs = con.selectCommand(sel);
                      while(rs.next())
                      {
		
                              i++;
                              %><td style="padding:30px">
                              <p style="border:1px solid black;padding:20px;text-align:center">
                                  <img src="../Assets/WorkGallery/<%=rs.getString("workgallery_file")%>"  width="120" height="120"/><br /><br />
                              Caption : <%=rs.getString("workgallery_caption")%></br><br />
                              </p>
                                      </td>
                              <%
                              if(i==4)
                              {
                                        out.println("</tr><tr>");
                                      i=0;
                              }
                      }
  
  
                %>
        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>