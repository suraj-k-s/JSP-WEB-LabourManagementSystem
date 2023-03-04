<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="" style="text-align:center">Select Taluk</option> 
<%

    String did = request.getParameter("did");

    String sel = "select * from  tbl_taluk  where  district_id='" + did + "'";

    ResultSet rs = con.selectCommand(sel);

    while (rs.next()) {

%>
<option style="text-align:center" value="<%=rs.getString("taluk_id")%>"  ><%=rs.getString("taluk_name")%></option>
<%
    }
%>