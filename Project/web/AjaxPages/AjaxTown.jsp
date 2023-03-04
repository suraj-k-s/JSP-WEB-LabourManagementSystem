<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option style="text-align:center" value="">Select Town</option> 
<%

    String tid = request.getParameter("tid");

    String sel = "select * from  tbl_town  where  taluk_id='" + tid + "'";

    ResultSet rs = con.selectCommand(sel);

    while (rs.next()) {

%>
<option style="text-align:center" value="<%=rs.getString("town_id")%>"  ><%=rs.getString("town_name")%></option>
<%
    }
%>