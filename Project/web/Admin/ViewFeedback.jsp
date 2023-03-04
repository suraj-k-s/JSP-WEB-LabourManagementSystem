<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
  <%@include file="SessionValidator.jsp" %>
        <%@include file="Head.jsp" %>
</head>
   
    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <h1>Feedbacks</h1>
                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Feedback</td>
                                                <td align="center" scope="col">Date</td>
                                                <td align="center" scope="col">User</td>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                             <%
												int i = 0;
                                                String selQry = "select * from tbl_feedback f inner join tbl_user u on f.user_id = u.user_id";
                                               ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                   i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("feedback_content")%></td>
                                                <td align="center"><%=rs.getString("feedback_date")%></td>
                                                <td align="center"><%=rs.getString("user_name")%></td>
                                            </tr>
                                            <%                     }


                                            %>
                                            

                                        </tbody>
                                    </table>
                                </div>
                             </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
  
    <%@include file="Foot.jsp" %>

    </html>






