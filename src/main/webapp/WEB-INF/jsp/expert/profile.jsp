<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/3
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>广州市周伟翔心理咨询师工作室_525心理网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/expert.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/myConstant.js"></script>
    <script>
        $(function () {
            //专家信息
            var expertSex = $(".expert_sex");
            expertSex.text(CON_SEX[expertSex.text()]);
            var expertField = $(".expert_field");
            expertField.text(CON_FIELD[expertField.text()]);

        })
    </script>
</head>
<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条End-->
<div class="full menubd bg8">
    <div class="dr-info">
        <!--头像+粉丝+关注-->
        <ul class="h-base-a">
            <li class="avatar">
                <img src="${expert.avatar}" >
            </li>
            <%--<li class="fans">--%>
                <%--<a href="#" target="_blank">他的粉丝<i>37</i></a>--%>
                <%--<a href="#" target="_blank" class="no">他关注的人<i>31</i></a>--%>
                <%--<br class="clear">--%>
            <%--</li>--%>
            <%--<li class="fun">--%>
                <%--<a href="#" onclick="">关注他</a>--%>
                <%--<a href="#" onclick="" class="no">私聊</a>--%>
                <%--<br class="clear">--%>
            <%--</li>--%>
        </ul>
        <!--头像+粉丝+关注End-->
        <ul class="dr-base">
            <li class="dname">
                <b>${expert.name} 心理咨询师工作室</b>
            <li class="dremark">
                ${expert.qualification}&nbsp;&nbsp;&nbsp;&nbsp;${expert.address}<br>
            </li>
            <li class="dask">
                <i>咨询预约：<em>${expert.phone}</em></i>
                <a href="${pageContext.request.contextPath}/ask/${expert.id}" target="_blank">向他提问</a>
            </li>
            <li class="dfoor">
                <i>擅长领域：</i>
                <span class="expert_field">${expert.field}</span><br><br>
                <i>性别：</i>
                <span class="expert_sex">${expert.sex}</span><br>
                <i>学历：</i>
                ${expert.degree}<br>
                <i>电话：</i>
                ${expert.phone}<br>
                <i>地址：</i>
                ${expert.address}<br>
                <i>个人介绍：</i>
                ${expert.introduction}<br>
            </li>
        </ul>
        <br class="clear">
    </div>
</div>


<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->

</body>
</html>