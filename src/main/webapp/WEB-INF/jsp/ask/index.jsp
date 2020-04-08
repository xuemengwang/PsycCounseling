<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/4
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>向心理专家提问,在线帮您解决心理困惑_525心理网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/asktab.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/askform.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
    <script>

        $(function () {
            $("#fromId").attr("value",$.cookie('id'));
        });

    </script>
</head>
<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->
<!--提问or通话-->
<div id="ask-top">
    <div class="pu">
        <a href="${pageContext.request.contextPath}/ask/index" class="on">
            <b>向专家提问</b>
        </a>
        <a href="${pageContext.request.contextPath}/ask/tel">
            <b>与专家通话</b>
            <i><em>推荐</em></i>
        </a>
        <br class="clear">
    </div>
</div>
<!--提问or通话End-->
<!--提问-->
<div id="ask-form" class="wrap">
    <form action="${pageContext.request.contextPath}/ask/success" method="post">
        <p class="tit">
            <span class="q">描述您的问题<em class="f30">请勿在内容中泄漏个人隐私信息</em></span>
            <i><em id="onlinedr">239</em>位在线专家为您解答</i>
            <br class="clear">
        </p>
        <div class="c-a">
            <p class="ask-p">
            <span>
                <select id="clt_field" name="field">
                    <option value="">请选择问题领域，我们为你精确推送相关专家</option>
                    <option value="1">婚恋相关</option>
                    <option value="2">健康相关</option>
                    <option value="3">两性相关</option>
                    <option value="4">职场相关</option>
                    <option value="5">教育相关</option>
                    <option value="6">性格相关</option>
                    <option value="7">其他相关</option>
                </select>
            </span>
            </p>
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