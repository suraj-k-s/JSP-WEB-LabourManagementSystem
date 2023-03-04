<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Town</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Head.jsp" %>
    </head>

    <%        String did = "", id = "", name = "";

        if (request.getParameter("edit") != null) {

            id = request.getParameter("edit");
            did = request.getParameter("id");
            name = request.getParameter("name");

        }

        if (request.getParameter("btn_save") != null) {

            if (request.getParameter("hid").equals("")) {
                String insQry = "insert into tbl_town(taluk_id,town_name)values('" + request.getParameter("sel_taluk") + "','" + request.getParameter("txt_town") + "')";
                con.executeCommand(insQry);
                response.sendRedirect("Town.jsp");
            } else {
                String upQry = "update tbl_town set taluk_id='" + request.getParameter("sel_taluk") + "',town_name='" + request.getParameter("txt_town") + "' where town_id='" + request.getParameter("hid") + "'";
                con.executeCommand(upQry);
                response.sendRedirect("Town.jsp");
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_town where town_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Town.jsp");
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
                                                    <h3 class="mb-0" >Table Town</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_district">District</label>
                                                    <select class="form-control" name="sel_district" id="sel_district" onchange="getTaluk(this.value)">
                                                        <option value="" style="text-align:center">-----Select-----</option>
                                                        <%                                                        String selQryd = "select * from tbl_district";
                                                            ResultSet rsd = con.selectCommand(selQryd);
                                                            while (rsd.next()) {


                                                        %>
                                                        <option style="text-align:center" value="<%=rsd.getString("district_id")%> " 
                                                                ><%=rsd.getString("district_name")%></option >

                                                        <%                      }


                                                        %>

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_taluk">Taluk</label>
                                                    <select class="form-control" name="sel_taluk" id="sel_taluk">
                                                        <option style="text-align:center" value="">-----Select-----</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_town">Town Name</label>
                                                    <input required="" type="text" class="form-control" id="txt_town" name="txt_town" value="<%=name%>">
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
                                                <td align="center" scope="col">Town</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0;
                                                String selQry = "select * from tbl_town p inner join tbl_taluk d on d.taluk_id=p.taluk_id inner join tbl_district di on di.district_id=d.district_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("district_name")%></td>
                                                <td align="center"><%=rs.getString("taluk_name")%></td>
                                                <td align="center"><%=rs.getString("town_name")%></td>
                                                <td align="center"><a href="Town.jsp?del=<%=rs.getString("town_id")%>" class="status_btn">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
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
    </script>
    <%@include file="Foot.jsp" %>
</html>





