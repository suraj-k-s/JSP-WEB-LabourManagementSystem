<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <tr>
    <%
        String did = request.getParameter("did");
        String taid = request.getParameter("taid");
        String toid = request.getParameter("toid");
        String tid = request.getParameter("tid");
        int i = 0;
        String sel = "select * from tbl_labour l inner join tbl_worktype wt on wt.worktype_id=l.worktype_id inner join tbl_town tow on tow.town_id=l.town_id inner join tbl_taluk ta on ta.taluk_id=tow.taluk_id inner join tbl_district d on d.district_id=ta.district_id where true";

        if (!did.equals("")) {
            sel += " and d.district_id = '" + did + "'";
        }
        if (!taid.equals("")) {
            sel += " and ta.taluk_id = '" + taid + "'";
        }
        if (!toid.equals("")) {
            sel += " and tow.town_id = '" + toid + "'";
        }
        if (!tid.equals("")) {
            sel += " and l.worktype_id = '" + tid + "'";
        }
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