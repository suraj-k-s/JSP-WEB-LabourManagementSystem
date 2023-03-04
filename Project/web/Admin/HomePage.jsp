<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="SessionValidator.jsp" %>
<%@include file="Head.jsp" %>


<section class="main_content dashboard_part">
    <!-- menu  -->

    <!--/ menu  -->
    <div class="main_content_iner ">
        <div class="container-fluid p-0">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="single_element">
                        <div class="quick_activity">
                            <div class="row">
                                <div class="col-12">
                                    <div class="quick_activity_wrap">
                                        <div class="single_quick_activity d-flex">
                                            <div class="icon">
                                                <img src="../Template/Admin/img/icon/labour.png" alt="">
                                            </div>
                                            <div class="count_content">
                                                <h3><span class="counter">
                                                        <%                                                            String sel = "select count(labour_id) as id from tbl_labour";
                                                            ResultSet rs = con.selectCommand(sel);
                                                            rs.next();
                                                            out.println(rs.getString("id"));
                                                        %>
                                                    </span> </h3>
                                                <p>Labour</p>
                                            </div>
                                        </div>
                                        <div class="single_quick_activity d-flex">
                                            <div class="icon">
                                                <img src="../Template/Admin/img/icon/user.png" alt="">
                                            </div>
                                            <div class="count_content">
                                                <h3><span class="counter">
                                                        <%
                                                            String sel1 = "select count(user_id) as id from tbl_user";
                                                            ResultSet rs1 = con.selectCommand(sel1);
                                                            rs1.next();
                                                            out.println(rs1.getString("id"));
                                                        %>
                                                    </span> </h3>
                                                <p>User</p>
                                            </div>
                                        </div>
                                        <div class="single_quick_activity d-flex">
                                            <div class="icon">
                                                <img src="../Template/Admin/img/icon/post.png" alt="">
                                            </div>
                                            <div class="count_content">
                                                <h3><span class="counter">
                                                        <%
                                                            String sel2 = "select count(workpost_id) as id from tbl_workpost";
                                                            ResultSet rs2 = con.selectCommand(sel2);
                                                            rs2.next();
                                                            out.println(rs2.getString("id"));
                                                        %>
                                                    </span> </h3>
                                                <p>Posts</p>
                                            </div>
                                        </div>
                                        <div class="single_quick_activity d-flex">
                                            <div class="icon">
                                                <img src="../Template/Admin/img/icon/request.png" alt="">
                                            </div>
                                            <div class="count_content">
                                                <h3><span class="counter">
                                                        <%
                                                            String sel3 = "select count(workrequest_id) as id from tbl_workrequest";
                                                            ResultSet rs3 = con.selectCommand(sel3);
                                                            rs3.next();
                                                            out.println(rs3.getString("id"));
                                                        %>
                                                    </span> </h3>
                                                <p>Requests</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-12">
                    <div class="white_box card_height_100">
                        <div class="box_header border_bottom_1px  ">
                            <div class="main-title">
                                <h3 class="mb_25">Labour</h3>
                            </div>
                        </div>
                        <div class="staf_list_wrapper sraf_active owl-carousel">
                            <%
                                String selZ = "select * from tbl_labour";
                                ResultSet rsZ = con.selectCommand(selZ);
                                while (rsZ.next()) {
                            %>
                            <!-- single carousel  -->
                            <div class="single_staf">
                                <div class="staf_thumb">
                                    <img src="../Assets/LabourPhoto/<%=rsZ.getString("labour_photo")%>" alt="">
                                </div>
                                <h4><%=rsZ.getString("labour_name")%></h4>
                                <p><%=rsZ.getString("labour_contact")%></p>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
                <div class="col-xl-12">
                    <div class="white_box card_height_100">
                        <div class="box_header border_bottom_1px  ">
                            <div class="main-title">
                                <h3 class="mb_25">User</h3>
                            </div>
                        </div>
                        <div class="staf_list_wrapper sraf_active owl-carousel">
                            <%
                                String selU = "select * from tbl_user";
                                ResultSet rsU = con.selectCommand(selU);
                                while (rsU.next()) {
                            %>
                            <!-- single carousel  -->
                            <div class="single_staf">
                                <div class="staf_thumb">
                                    <img src="../Assets/UserPhoto/<%=rsU.getString("user_photo")%>" alt="">
                                </div>
                                <h4><%=rsU.getString("user_name")%></h4>
                                <p><%=rsU.getString("user_contact")%></p>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</section>
<!-- main content part end -->

<!-- footer  -->
<!-- jquery slim -->
<script src="../Template/Admin/js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="../Template/Admin/js/popper.min.js"></script>
<!-- bootstarp js -->
<script src="../Template/Admin/js/bootstrap.min.js"></script>
<!-- sidebar menu  -->
<script src="../Template/Admin/js/metisMenu.js"></script>
<!-- waypoints js -->
<script src="../Template/Admin/vendors/count_up/jquery.waypoints.min.js"></script>
<!-- waypoints js -->
<script src="../Template/Admin/vendors/chartlist/Chart.min.js"></script>
<!-- counterup js -->
<script src="../Template/Admin/vendors/count_up/jquery.counterup.min.js"></script>
<!-- swiper slider js -->
<script src="../Template/Admin/vendors/swiper_slider/js/swiper.min.js"></script>
<!-- nice select -->
<script src="../Template/Admin/vendors/niceselect/js/jquery.nice-select.min.js"></script>
<!-- owl carousel -->
<script src="../Template/Admin/vendors/owl_carousel/js/owl.carousel.min.js"></script>
<!-- gijgo css -->
<script src="../Template/Admin/vendors/gijgo/gijgo.min.js"></script>
<!-- responsive table -->
<script src="../Template/Admin/vendors/datatable/js/jquery.dataTables.min.js"></script>
<script src="../Template/Admin/vendors/datatable/js/dataTables.responsive.min.js"></script>
<script src="../Template/Admin/vendors/datatable/js/dataTables.buttons.min.js"></script>
<script src="../Template/Admin/vendors/datatable/js/buttons.flash.min.js"></script>
<script src="../Template/Admin/vendors/datatable/js/jszip.min.js"></script>
<script src="../Template/Admin/vendors/datatable/js/pdfmake.min.js"></script>
<script src="../Template/Admin/vendors/datatable/js/vfs_fonts.js"></script>
<script src="../Template/Admin/vendors/datatable/js/buttons.html5.min.js"></script>
<script src="../Template/Admin/vendors/datatable/js/buttons.print.min.js"></script>

<script src="../Template/Admin/js/chart.min.js"></script>
<!-- progressbar js -->
<script src="../Template/Admin/vendors/progressbar/jquery.barfiller.js"></script>
<!-- tag input -->
<script src="../Template/Admin/vendors/tagsinput/tagsinput.js"></script>
<!-- text editor js -->
<script src="../Template/Admin/vendors/text_editor/summernote-bs4.js"></script>

<script src="../Template/Admin/vendors/apex_chart/apexcharts.js"></script>

<!-- custom js -->
<script src="../Template/Admin/js/custom.js"></script>

<script src="../Template/Admin/vendors/apex_chart/bar_active_1.js"></script>
<script src="../Template/Admin/vendors/apex_chart/apex_chart_list.js"></script>
</body>
</html>