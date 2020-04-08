<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/4
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>心理问题一个电话轻松解决，更快捷有效且保护隐私_525心理网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/asktab.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tel.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/myConstant.js"></script>
    <script>

        $(function () {
            //专家信息
            $(".expert_sex").each(function () {
                $(this).text(CON_SEX[$(this).text()]);
            });
            $(".expert_field").each(function () {
                $(this).text('擅长领域：'+CON_FIELD[$(this).text()]);
            });
            //截取过长的专家介绍
            $(".expert_introduction").each(function () {
                if ($(this).text().length > 70){
                    $(this).text($(this).text().substr(0,70) + '...');
                }
            });
        })




    </script>
</head>
<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->
<!--提问or通话-->
<div id="ask-top">
    <div class="pu">
        <a href="${pageContext.request.contextPath}/ask/index">
            <b>向专家提问</b>
        </a>
        <a href="${pageContext.request.contextPath}/ask/tel" class="on">
            <b>与专家通话</b>
            <i><em>推荐</em></i>
        </a>
        <br class="clear">
    </div>
</div>
<!--提问or通话End-->
<!--通话-->
<div class="wrap"><p class="title"><b>心理问题一个电话轻松解决</b>方便高效、保护隐私</p>
    <ul id="drlist">
        <c:forEach items="${expertList}" var="expert">
            <li>
                <a href="${pageContext.request.contextPath}/expert/${expert.id}" target="_blank" class="avatar">
                    <img src="${expert.avatar}">
                </a>
                <a href="${pageContext.request.contextPath}/expert/${expert.id}" target="_blank" class="un">${expert.name}</a>
                <span class="level">${expert.qualification}</span>
                <span class="expert_field">${expert.field}</span>
                <span class="remark"><div class="expert_sex" style="display: inline">${expert.sex}</div>
                    ，生于${expert.borndate.year}年
                    ，${expert.address}
                    <br><div class="expert_introduction" style="display: inline">${expert.introduction}</div>
                </span>
                <span class="tel">
                <i class="tel-icon"></i>
                ${expert.phone}
            </span>
            </li>
        </c:forEach>
    </ul>
    <br class="clear">
    <p class="nextbtn"><a href="${pageContext.request.contextPath}/ask/tel">换一批</a></p>
</div>
<!--通话End-->
<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->

</body>
</html>