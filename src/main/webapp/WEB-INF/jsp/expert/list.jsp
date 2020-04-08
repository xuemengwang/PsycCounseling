<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/3
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>心理文章_用心理学的眼光看世界_525心理网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/g.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myPagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/myConstant.js"></script>
    <script>
        $(function () {

            //分类栏的开关显示
            $(".aType .item").each(function () {
                if ($(this).children().text() === CON_FIELD[${field}]) {
                    $(this).children().addClass("on");
                } else {
                    $(this).children().removeClass("on");
                }
            });
            $(".c-tit").html(CON_FIELD[${field}] + ' 心理咨询师');

            //专家信息
            $(".expert_sex").each(function () {
                $(this).text(CON_SEX[$(this).text()]);
            });
            $(".expert_field").each(function () {
                $(this).text(CON_FIELD[$(this).text()]);
            });
            //截取过长的专家介绍
            $(".expert_introduction").each(function () {
                if ($(this).text().length > 100){
                    $(this).text($(this).text().substr(0,100) + '...');
                }
            });

            //分页处理
            var div = $("#pagination");
            var curPage = ${pageBean.curPage};
            var allPage = ${pageBean.allPage};
            var length = 5;
            paginationConstructor(div, length, curPage, allPage);

        })


    </script>
</head>
<body style="">
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->

<div class="wrap">
    <!--心理咨询师分类-->
    <div class="al">
        <ul class="aType">
            <li class="item"><a href="${pageContext.request.contextPath}/expert/list/0/1" class="on">全部</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/expert/list/1/1">婚恋</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/expert/list/2/1">健康</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/expert/list/3/1">两性</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/expert/list/4/1">职场</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/expert/list/5/1">教育</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/expert/list/6/1">性格</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/expert/list/7/1">其他</a></li>
        </ul>
    </div>
    <!--心理咨询师分类End-->
    <br class="clear">
    <div class="wrap pd"><br>
        <p class="c-tit">全部 心理咨询师</p>
        <hr>
        <!--心理咨询师列表-->
        <ul class="dr-list">
            <c:forEach items="${pageBean.list}" var="expert">
                <li>
                    <a href="${pageContext.request.contextPath}/expert/${expert.id}" class="avatar"
                       target="_blank">
                        <img src="${expert.avatar}">
                    </a>
                    <span class="txt">
                        <a href="${pageContext.request.contextPath}/expert/${expert.id}" class="un"
                           target="_blank">${expert.name}</a>
                        <br>
                        <div class="expert_sex" style="display: inline">${expert.sex}</div>&nbsp;&nbsp;
                        生于${expert.borndate.year}年&nbsp;&nbsp;
                        ${expert.qualification}&nbsp;&nbsp;
                        ${expert.address}
                        <br>
                        <div class="expert_introduction" style="display: inline">${expert.introduction}</div>
                        <a href="${pageContext.request.contextPath}/expert/${expert.id}" target="_blank">详情&gt;&gt;</a>
                        <br>
                        <span><i class="icons"></i>
                            <b><em>${expert.phone}</em>&nbsp;&nbsp;欢迎来电预约！</b>
                        </span>
                        </span>
                    <span class="zc">擅长领域：
                        <br>
                        <b class="expert_field">${expert.field}</b>
                    </span>
                    <span class="findzx">
                        <a href="${pageContext.request.contextPath}/ask/${expert.id}" class="btn_fzx"
                           target="_blank">向TA提问</a>
                    </span>
                    <br class="clear">
                </li>
            </c:forEach>


        </ul>
        <!--心理咨询师列表End-->
    </div>
    <!--分页-->
    <div id="pagination"></div>
    <!--分页End-->
</div>

<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->
</body>
</html>