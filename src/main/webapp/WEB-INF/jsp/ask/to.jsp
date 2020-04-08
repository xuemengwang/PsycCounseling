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
    <title>向${expert.name}提问,在线帮您解决心理困惑_525心理网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/asktab.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/askform.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/js/myConstant.js"></script>
    <script>

        $(function () {
            var expert_field = $(".expert_field");
            expert_field.text('擅长领域：' + CON_FIELD[expert_field.text()]);
            $("#fromId").attr("value",$.cookie('id'));
        });

    </script>
</head>
<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->
<div id="ask-top">
    <div class="pr">
        <a href="${pageContext.request.contextPath}/expert/${expert.id}" class="avatar" target="_blank">
            <img src="${expert.avatar}"></a>
        <p class="dr-info">
            <a href="${pageContext.request.contextPath}/expert/${expert.id}" target="_blank"
               class="un">${expert.name}</a>
            <i>${expert.qualification}</i>
            <em class="expert_field">${expert.field}</em>
        </p>
        <br class="clear">
    </div>
</div>
<!--提问-->
<div id="ask-form" class="wrap">
    <form action="${pageContext.request.contextPath}/ask/success" method="post">
        <p class="tit">
            <span class="q">描述您的问题<em class="f30">请勿在内容中泄漏个人隐私信息</em></span>
            <br class="clear">
        </p>
        <div class="c-a">
            <p class="ask-in fbd">
                <input id="clt_Title" name="title" maxlength="50" type="text" placeholder="写标题（一句话概述您的问题）">
            </p>
            <p class="ask-in">
            <textarea id="clt_Ans" name="problem" cols="20" rows="2" placeholder="写咨询内容，同时希望获得怎样的帮助？"
                      style="word-wrap: break-word; resize: vertical; height: 150px;"></textarea>
            </p>
        </div>
        <!--提交-->
        <p class="ask-in" style="padding:10px 0 50px 0">
            <input id="fromId" name="fromId" type="hidden">
            <input name="replyId" type="hidden" value=${expert.id}>
            <input name="field" type="hidden" value=${expert.field}>
            <input id="btn_SaveAsk" type="submit" value="提交问题" class="btn">
            <br class="clear">
        </p>
        <!--提交End-->
    </form>

</div>
<br class="clear">
<!--提问End-->
<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->
</body>
</html>