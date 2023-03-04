<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//ENnullhttp://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <%@include file="Head.jsp" %><%@include file="SessionValidator.jsp" %>
    </head>

    <body>
        <div align="center" id="tab">
            <form id="form1" name="form1" method="post" action=null>
                <h1>Search Labour</h1>
                <br><br>
                        <table width="750" border="1" align="center">
                            <tr>
                                <td><label for="sel_district"></label>
                                    <select name="sel_district" id="sel_district" onchange="getTaluk(this.value), getLabour()">
                                        <option value="" style="text-align:center">Select District</option>
                                        <%
                                            String sel1 = "select * from tbl_district ";
                                            ResultSet rs111 = con.selectCommand(sel1);
                                            while (rs111.next()) {
                                        %>
                                        <option style="text-align:center" value="<%=rs111.getString("district_id")%>" 
                                                ><%=rs111.getString("district_name")%></option >

                                        <%
                                            }
                                        %>
                                    </select>
                                </td>

                                <td><label for="sel_taluk"></label>
                                    <select name="sel_taluk" id="sel_taluk" onchange="getTown(this.value), getLabour()">
                                        <option value="" style="text-align:center">Select Taluk</option>


                                    </select>

                                </td>

                                <td><label for="sel_town"></label>
                                    <select name="sel_town" id="sel_town" onchange="getLabour()">
                                        <option value="" style="text-align:center">Select Town</option>

                                    </select>


                                </td>
                                <td><label for="sel_type"></label>
                                    <select name="sel_type" id="sel_type" onchange="getLabour()">
                                        <option style="text-align:center" value="">Select Work Type</option>
                                        <%
                                            String sel11 = "select * from tbl_worktype ";
                                            ResultSet rs11 = con.selectCommand(sel11);
                                            while (rs11.next()) {
                                        %>
                                        <option style="text-align:center" value="<%=rs11.getString("worktype_id")%>" 
                                                ><%=rs11.getString("worktype_name")%></option >

                                        <%
                                            }
                                        %>
                                    </select>
                                </td>



                            </tr>
                        </table>
                        <table style="border-collapse:collapse;" align="center" id="dataT">
                            <tr>
                                <%
                                    int i = 0;
                                    String sel = "select * from tbl_labour l inner join tbl_worktype wt on wt.worktype_id=l.worktype_id inner join tbl_town tow on tow.town_id=l.town_id inner join tbl_taluk ta on ta.taluk_id=tow.taluk_id inner join tbl_district d on d.district_id=ta.district_id";

                                    ResultSet rs = con.selectCommand(sel);
                                    while (rs.next()) {
                                        int average_rating = 0;
                                        int total_review = 0;
                                        int five_star_review = 0;
                                        int four_star_review = 0;
                                        int three_star_review = 0;
                                        int two_star_review = 0;
                                        int one_star_review = 0;
                                        int total_user_rating = 0;

                                        String query = "SELECT * FROM tbl_review where labour_id = '" + rs.getString("labour_id") + "' ORDER BY review_id DESC";
                                        ResultSet rs1 = con.selectCommand(query);
                                        while (rs1.next()) {
                                            if (rs1.getString("user_rating").equals("5")) {
                                                five_star_review++;
                                            }
                                            if (rs1.getString("user_rating").equals("4")) {
                                                four_star_review++;
                                            }
                                            if (rs1.getString("user_rating").equals("3")) {
                                                three_star_review++;
                                            }
                                            if (rs1.getString("user_rating").equals("2")) {
                                                two_star_review++;
                                            }
                                            if (rs1.getString("user_rating").equals("1")) {
                                                one_star_review++;
                                            }
                                            total_review++;
                                            total_user_rating = total_user_rating + Integer.parseInt(rs1.getString("user_rating"));
                                        }
                                        if (total_user_rating > 0) {
                                            average_rating = total_user_rating / total_review;
                                        }
                                        i++;
                                %>
                                <td style="padding:30px">
                                    <p style="border:1px solid black;padding:20px;text-align:center">
                                        <img src="../Assets/LabourPhoto/<%=rs.getString("labour_photo")%>" style="border-radius:50%" width="80" height="80"/><br /><br />
                                        Name : <%=rs.getString("labour_name")%></br><br />
                                        Type : <%=rs.getString("worktype_name")%></br><br />
                                        Rating : <%=average_rating%>/5</br><br />
                                        <a style="color:green" href="LabourRequest.jsp?lid=<%=rs.getString("labour_id")%>">Request Now</a><br>
                                            <a style="color:green" href="ViewWorkGallery.jsp?lid= <%=rs.getString("labour_id")%>">View Works</a>
                                    </p>

                                </td>
                <%
                        if (i == 4) {
                            out.println("</tr><tr>");
                            i = 0;
                        }
                    }
                %>
        </table>
        </form>
        </div>
        <script src="../Jq/jquery.js"></script>
        <script>
                                       function getTaluk(did)
                                            {


                                                $.ajax({
                                                    url: "../AjaxPages/AjaxTaluk.jsp?did=" + did,
                                                    success: function(result) {
                                                        $("#sel_taluk").html(result);
                                                    }
                                                });
                                            }
                                            function getTown(tid)
                                            {


                                                $.ajax({
                                                    url: "../AjaxPages/AjaxTown.jsp?tid=" + tid,
                                                    success: function(result) {
                                                        $("#sel_town").html(result);
                                                    }
                                                });
                                            }
                                        function getLabour()
                                        {
                                            var did = "", taid = "",toid="", tid = "";
                                            did = document.getElementById('sel_district').value.trim();
                                            taid = document.getElementById('sel_taluk').value.trim();
                                            toid = document.getElementById('sel_town').value.trim();
                                            tid = document.getElementById('sel_type').value.trim();

                                            $.ajax({
                                                url: "../AjaxPages/AjaxLabour.jsp?did=" + did + "&tid=" + tid + "&taid=" + taid+ "&toid=" + toid,
                                                success: function(result) {
                                                    $("#dataT").html(result);
                                                }
                                            });

                                        }
        </script>
        <%@include file="Foot.jsp" %>
        </body>
        </html>