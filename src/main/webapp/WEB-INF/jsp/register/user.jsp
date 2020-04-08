<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/2
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>求助者_普通用户注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reguser.css">
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
    <div class="wrap regbg">
        <form id="regform" action="${pageContext.request.contextPath}/register/next">
            <p class="item">
                <i>昵称<em>设置您在本站公开的称呼(2-9字符)</em></i>
                <input type="text" id="nickname" name="name" maxlength="9">
            </p>
            <p class="item">
                <i>性别</i>
                <input id="sex_0" type="radio" name="sex" value="1">
                <label for="sex_0">男</label>
                <input id="sex_1" type="radio" name="sex" value="0">
                <label for="sex_1">女</label>
            </p>
            <p class="item">
                <i>生日</i>
                <input type="date" id="borndate" name="borndate">
            </p>
            <p class="item">
                <i>学历</i>
                <select id="degree" name="degree">
                    <option value="">请选择</option>
                    <option value="博士以上">博士以上</option>
                    <option value="博士">博士</option>
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="初中以下">初中以下</option>
                    <option value="其它">其它</option>
                </select>
            </p>
            <p class="item">
                <br>
                <input type="hidden" name="role" value="3">
                <input type="submit" id="btn-u-reg" value="提交注册">
            </p>
        </form>
    </div>
</div>
<p class="pd"></p>
<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->

</body>
</html>