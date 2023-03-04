<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Taluk</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Head.jsp" %>
    </head>

    <%        String did = "",id="", name = "";

        if (request.getParameter("edit") != null) {

            id = request.getParameter("edit");
            did = request.getParameter("id");
            name = request.getParameter("name");

        }

        if (request.getParameter("btn_save") != null) {

            if (request.getParameter("hid").equals("")) {
                String insQry = "insert into tbl_taluk(district_id,taluk_name)values('" + request.getParameter("sel_district") + "','" + request.getParameter("txt_taluk") + "')";
                con.executeCommand(insQry);
                response.sendRedirect("Taluk.jsp");
            } else {
                String upQry = "update tbl_taluk set district_id='" + request.getParameter("sel_district") + "',taluk_name='" + request.getParameter("txt_taluk") + "' where taluk_id='" + request.getParameter("hid") + "'";
                con.executeCommand(upQry);
                response.sendRedirect("Taluk.jsp");
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_taluk where taluk_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Taluk.jsp");
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
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Taluk</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_district">District</label>
                                                    <select class="form-control" name="sel_district" id="sel_district">
                                                    <option value="" style="text-align:center">-----Select-----</option>
                                                    <%
                                                String selQryq = "select * from tbl_district";
                                                ResultSet rsq = con.selectCommand(selQryq);
                                                while (rsq.next()) {


                                            %>
                                                     <option style="text-align:center" value="<%=rsq.getString("district_id")%> " 
                                                     <%
                                                      if(rsq.getString("district_id").equals(did))
                                                      { 
                                                      out.println("selected");
                                                      }
                                                      %>
                                                      ><%=rsq.getString("district_name")%></option >
                                                     
                                                      <%                      }


                                            %>

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_taluk">Taluk Name</label>
                                                    <input required="" type="text" class="form-control" id="txt_taluk" name="txt_taluk" value="<%=name%>">
                                                    <input type="hidden" name="hid" value="<%=id%>">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">District</td>
                                                <td align="center" scope="col">Taluk</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0;
                                                String selQry = "select * from tbl_taluk p inner join tbl_district d on d.district_id=p.district_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("district_name")%></td>
                                                <td align="center"><%=rs.getString("taluk_name")%></td>
                                                <td align="center"><a href="Taluk.jsp?del=<%=rs.getString("taluk_id")%>" class="status_btn">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <a href="Taluk.jsp?id=<%=rs.getString("district_id")%>&edit=<%=rs.getString("taluk_id")%>&name=<%=rs.getString("taluk_name")%>" class="status_btn">Edit</a></td>
                                            </tr>
                                            <%                      }


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
