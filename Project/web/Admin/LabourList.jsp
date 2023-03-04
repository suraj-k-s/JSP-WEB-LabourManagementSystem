<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Labour List</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Head.jsp" %>
    </head>

    <%       
    if(request.getParameter("aid")!=null)
	  {
		  String accept = "update tbl_labour set labour_status='1' where labour_id='"+request.getParameter("aid")+"'";
		  if(con.executeCommand(accept))
		  {
			  response.sendRedirect("LabourList.jsp");
		  }
	  }
	  if(request.getParameter("rid")!=null)
	  {
		  String accept = "update tbl_labour set labour_status='2' where labour_id='"+request.getParameter("rid")+"'";
		  if(con.executeCommand(accept))
		  {
			  response.sendRedirect("LabourList.jsp");
		  }
	  }

    %>
    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                            <h1>New Labours</h1>
                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Name</td>
                                                <td align="center" scope="col">Contact</td>
                                                <td align="center" scope="col">Email</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
												int i = 0;
                                                String sel1 = "select * from tbl_labour where labour_status='0'";
                                                ResultSet rs1 = con.selectCommand(sel1);
                                                while (rs1.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs1.getString("labour_name")%></td>
                                                <td align="center"><%=rs1.getString("labour_contact")%></td>
                                                <td align="center"><%=rs1.getString("labour_email")%></td>
                                                <td align="center"><a href="LabourList.jsp?aid=<%=rs1.getString("labour_id")%>" class="status_btn">Accept</a> | <a href="LabourList.jsp?rid=<%=rs1.getString("labour_id")%>" class="status_btn">Reject</a> </td>
                                            </tr>
                                           <%
                                                }
                                           %>

                                        </tbody>
                                    </table>
                                </div>
                                <h1>Accepted Labours</h1>
                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Name</td>
                                                <td align="center" scope="col">Contact</td>
                                                <td align="center" scope="col">Email</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
												int ii = 0;
                                                String sel2 = "select * from tbl_labour where labour_status='1'";
                                                ResultSet rs2 = con.selectCommand(sel2);
                                                while (rs2.next()) {

                                                    ii++;

                                            %>
                                            <tr>
                                                <td align="center"><%=ii%></td>
                                                <td align="center"><%=rs2.getString("labour_name")%></td>
                                                <td align="center"><%=rs2.getString("labour_contact")%></td>
                                                <td align="center"><%=rs2.getString("labour_email")%></td>
                                                <td align="center"><a href="LabourList.jsp?rid=<%=rs2.getString("labour_id")%>" class="status_btn">Reject</a> </td>
                                            </tr>
                                           <%
                                                }
                                           %>
                                        </tbody>
                                    </table>
                                </div>
                                <h1>Rejected Labours</h1>
                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                           <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Name</td>
                                                <td align="center" scope="col">Contact</td>
                                                <td align="center" scope="col">Email</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
												int ii1 = 0;
                                                String sel21 = "select * from tbl_labour where labour_status='2'";
                                                ResultSet rs21 = con.selectCommand(sel21);
                                                while (rs21.next()) {

                                                    ii1++;

                                            %>
                                            <tr>
                                                <td align="center"><%=ii1%></td>
                                                <td align="center"><%=rs21.getString("labour_name")%></td>
                                                <td align="center"><%=rs21.getString("labour_contact")%></td>
                                                <td align="center"><%=rs21.getString("labour_email")%></td>
                                                <td align="center"><a href="LabourList.jsp?aid=<%=rs21.getString("labour_id")%>" class="status_btn">Accept</a> </td>
                                            </tr>
                                           <%
                                                }
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
