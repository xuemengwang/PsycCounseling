<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/2
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户注册_525心理网_您身边的心理咨询专家</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <style type="text/css">
        #reg-role {
            padding-bottom: 0;
            display: block;
            height: auto;
            padding-top: 80px;
            width: 70%;
        }

        #reg-role b.tit {
            font-size: 22px;
            padding-bottom: 30px;
            display: block;
            letter-spacing: 3px;
            font-weight: normal;
            color: #737373;
        }

        #role-reg {
            display: block;
            padding-bottom: 150px;
            width: 60%;
        }

        #role-reg li {
            display: block;
            padding: 10px 30px 10px 0;
            width: 40%;
            float: left
        }

        #role-reg li a {
            display: block;
            font-size: 24px;
            border: solid 5px #e2e2e2;
            width: 100%;
            height: 150px;
            line-height: 150px;
            color: #414141;
            border-radius: 10px;
            text-align: center
        }

        #role-reg li a:hover {
            display: block;
            font-size: 24px;
            border: solid 5px #55C860;
            width: 100%;
            height: 150px;
            line-height: 150px;
            color: #414141;
            text-decoration: none;
            border-radius: 10px;
            text-align: center
        }

        #role-reg li a i {
            color: #26A027;
            font-style: normal
        }

        a.role-reg:hover {
            background: #F8FFEE;
            color: #279F32;
            text-decoration: none;
            border-bottom: solid 2px #9D9D9D
        }

        .bgreg {
            border-top: solid 1px #eee
        }

        .pd2 {
            padding-bottom: 200px;
            display: block
        }
    </style>

</head>

<body>
<!--头-->
<div style="background-color:  #26A027">
    <div class="wrap pd">
        <p id="logo">
            <a href="${pageContext.request.contextPath}/index">
                <img src="${pageContext.request.contextPath}/image/logo.png">
            </a>
        </p>
        <p class="title">新用户注册</p>
        <p class="fun"><i>已有账号？</i>
            <a href="${pageContext.request.contextPath}/login">登录</a>
        </p><br class="clear">
    </div>
</div>
<!--头End-->
<div class="full bgreg">
    <div class="wrap bgnone">
        <p id="reg-role"><b class="tit">选择身份：</b></p>
        <ul id="role-reg">
            <li>
                <a href="${pageContext.request.contextPath}/register/user">求助者注册</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/register/expert">专业咨询师入驻</a>
            </li>
        </ul>
        <br class="clear">
    </div>
    <p class="pd2"></p>
</div>
<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->

</body>

</html>