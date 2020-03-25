<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/2
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户登录_525心理网_您身边的心理咨询专家</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
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
        <p class="title">欢迎登陆</p>
        <p class="fun">
            <i>没有账号？</i>
            <a href="${pageContext.request.contextPath}/register">注册</a>
        </p>
        <br class="clear">
    </div>
</div>
<!--头End-->
<!--body-->
<div class="full bg0">
    <div class="wrap pd">
        <!--二维码-->
        <div id="login-l">
            <img src="${pageContext.request.contextPath}/image/login-weixin.png" style="width:526px;height:401px">
        </div>
        <!--二维码end-->
        <!--登陆表单-->
        <form id="login-r" method="post" action="javascript:loginCheck();">
            <br>
            <p class="info">
                <span id="loginInfo"></span>
            </p>
            <p class="item in0" style="display: block;">
                <i>手机号</i>
                <input type="text" name="username" id="username">
                <br class="clear">
            </p>
            <p class="item in0" style="display: block;">
                <i>密码</i>
                <input type="password" name="password" id="password">
                <br class="clear">
            </p>
            <%--自动登陆与找回密码
            <p class="item autologin">
                <i></i>
                <input type="checkbox" id="expires" name="expires">
                <label id="remember" for="expires">下次自动登录</label>
                <a href="${pageContext.request.contextPath}/findpsw" class="findpwd" target="_blank" style="display: block;">
                    找回密码？
                </a>
                <br class="clear">
            </p>
            --%>
            <p class="item">
                <i></i>
                <input type="submit" id="btn-login" name="btn-login" value="登录" style="background: rgb(80, 210, 91);">
            </p>
        </form>
        <br class="clear">
        <!--登陆表单-->
    </div>
</div>
<!--body end-->
<!--页脚-->
<jsp:include page="common/footer.jsp"/>
<!--页脚End-->

<script>

    //登陆验证
    function loginCheck() {
        var userName = $("#username").val();
        var password = $("#password").val();
        if (userName === ''){
            $("#loginInfo").text("请填写用户名");
        }else if (password ===''){
            $("#loginInfo").text("请填写密码");
        }else{
            $.post(
                "${pageContext.request.contextPath}/login/check", //url地址
                {"userName":userName,"password":password}, //请求参数
                function(data){ //执行成功后的回调函数
                    if (data.status === 0){
                        $("#loginInfo").text("用户名或密码错误");
                    }else if (data.status ===1){
                        //登陆成功
                        $("#loginInfo").text("你好"+data.user.name);
                        //存cookie
                        $.cookie('id', data.user.id, { expires: 30, path:'/' });
                        $.cookie('name', data.user.name, { expires: 30, path:'/' });
                        $.cookie('role', data.user.role, { expires: 30, path:'/' });
                        $.cookie('phone', data.user.phone, { expires: 30, path:'/' });
                        $.cookie('avatar', data.user.avatar, { expires: 30, path:'/' });
                        //跳转首页
                        window.location.href = "${pageContext.request.contextPath}/index";
                    }
                },
                "json"
            );
        }
    }


</script>

</body>
</html>