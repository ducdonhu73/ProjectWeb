<%@page import="java.util.List"%>
<%@page import="Model.sanPham"%>
<%@page import="Model.TaiKhoan"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    TaiKhoan user = (TaiKhoan) session.getAttribute("user");
    if (user == null) {
%>
<c:redirect url="http://localhost:8080/BTLWeb"/>
<%
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <title>Cửa hàng điện tử</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>

        <div id="upbg"></div>

        <div id="outer">


            <div id="header">
                <div id="headercontent">
                    <h1>Cửa Hàng Điện Tử</h1>
                    <h2></h2>
                </div>
            </div>


            <form method="post" action="">
                <div id="search">
                    <input type="text" class="text" maxlength="64" name="keywords" />
                    <input type="submit" class="submit" value="Search" />
                </div>
            </form>


            <div id="headerpic"></div>


            <div id="menu">
                <!-- HINT: Set the class of any menu link below to "active" to make it appear active -->
                <ul>
                    <li><a href="admin.jsp">Trang chủ </a></li>
                    <li><a href="quanlisanpham">Quản lý sản phẩm</a></li>
                    <li><a href="admin.jsp">Quản lý</a></li>
                    <li><a href="index.html">Người dùng</a></li>
                    <li class="nut-dn">
                        <% if (user == null) {%>
                        <a href="dangnhap.html">Đăng nhập</a>
                        <%} else { %>
                        <div class="user">
                            <img class="avatar" src="images/RAVpower-RP-PB18.png" alt="avata"/>
                            <p>${user.ten}</p> 
                        </div>
                        <div class="user-thongtin">
                            <div class="user-item user-quanli-tk">Quản lí tài khoản</div>
                            <div class="user-item user-dangxuat"><a href="dangxuat">Đăng xuất</a></div>
                        </div>
                        <% }%>
                    </li>

                </ul>
            </div>

            <table>
                <%
                    List<sanPham> list = (List<sanPham>) request.getAttribute("list");
                    for (sanPham sp : list) {
                %>
                <tr>
                    <td><%= sp.getId()%></td>
                    <td><%= sp.getTen()%></td>
                    <td><%= sp.getMoTa()%></td>
                    <td><%= sp.getLoai()%></td>
                    <td><%= sp.getMau()%></td> 
                    <td><%= sp.getGia()%></td>
                    <td><%= sp.getSoLuong()%></td>
                    <td><%= sp.getDaBan()%></td>
                </tr>
                <%
                    }
                %>
            </table>

            <div class="contentarea">
            </div>

            <div id="footer">
                <div class="left">&copy; 2006 Your Website Name. All rights reserved.</div>
                <div class="right">Design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree Design</a></div>
            </div>

        </div>

    </body>
</html>