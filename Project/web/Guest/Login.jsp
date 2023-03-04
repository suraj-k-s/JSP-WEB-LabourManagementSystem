<%-- 
    Document   : Login
    Created on : Dec 26, 2021, 10:06:13 PM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("btn_submit") != null) {
        String username = request.getParameter("txt_username");
        String password = request.getParameter("txt_password");

        String selU = "select * from tbl_user where user_email='" + username + "' and user_password='" + password + "'";
        ResultSet rsU = con.selectCommand(selU);

        String selE = "select * from tbl_labour where labour_email='" + username + "' and labour_password='" + password + "'";
        ResultSet rsE = con.selectCommand(selE);

        String selA = "select * from tbl_admin where admin_uname='" + username + "' and admin_password='" + password + "'";
        ResultSet rsA = con.selectCommand(selA);

        if (rsU.next()) {
            if (rsU.getString("user_status").equals("1")) {
                out.println("<script>alert('Sorry Your Account Disabled')</script>");
            } else if (rsU.getString("user_status").equals("0")) {
                session.setAttribute("userid", rsU.getString("user_id"));
                session.setAttribute("username", rsU.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");
            }
        } else if (rsE.next()) {

            if (rsE.getString("labour_status").equals("0")) {
                out.println("<script>alert('Verification Under Proccessing')</script>");
            } else if (rsE.getString("labour_status").equals("2")) {
                out.println("<script>alert('Sorry Your Account Disabled')</script>");
            } else if (rsE.getString("labour_status").equals("1")) {
                session.setAttribute("labourid", rsE.getString("labour_id"));
                session.setAttribute("labourname", rsE.getString("labour_name"));
                response.sendRedirect("../Labour/HomePage.jsp");
            }

        } else if (rsA.next()) {
            session.setAttribute("adminname", rsA.getString("admin_name"));
            session.setAttribute("aid", rsA.getString("admin_id"));
            response.sendRedirect("../Admin/HomePage.jsp");
        } else {
            out.println("<script>alert('Invalid E-mail or Password')</script>");
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="../Template/Login/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 d-none d-md-block image-container"></div>

                <div class="col-lg-6 col-md-6 form-container">
                    <div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box text-center">
                        <div class="logo mb-3">
                            <h1>WORKDAY</h1>
                        </div>
                        <div class="heading mb-4">
                            <h4>Login into your account</h4>
                        </div>
                        <form method="post" autocomplete="off">
                            <div class="form-input">
                                <span><i class="fa fa-envelope"></i></span>
                                <input type="email" name="txt_username"  placeholder="Email Address" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-lock"></i></span>
                                <input type="password" name="txt_password" title="Minimum eight characters, at least one letter and one number" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"  placeholder="Password" required>
                            </div>
                            <div class="row mb-3">

                            </div>
                            <div class="text-left mb-3">
                                <button type="submit" name="btn_submit"  class="btn">Login</button>
                            </div>
                            <div class="text-center mb-2">

                                <div style="color: #777">Don't have an account
                                    <a href="../index.jsp" class="register-link">Back To Home</a>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>