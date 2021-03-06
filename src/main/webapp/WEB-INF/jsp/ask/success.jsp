<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/4
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>525心理网_您身边的心理咨询专家</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/success.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script>
        $(function () {
            //向咨询师发送消息
            $.ajax("${pageContext.request.contextPath}/sendMessage",{
                data:{'receiverid':'${expertId}','title':'系统提示','content':'你有新的咨询'},
                type:"POST"
            })
        })
    </script>
</head>

<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->

<div class="wrap ptop">
    <div class="w">

        <p class="pd"></p>
        <p class="succ">提交成功！</p>
        <p class="remark" style="background:none;">
            请耐心等待专家为你解答
            <img src="${pageContext.request.contextPath}/image/weixin.jpg" alt="">
            <i>【微信扫码，您身边的心理健康专家】</i>
        </p>

        <div style="padding-top:20px;padding-bottom:30px">
            <p class="use">
                <b>你还可以：</b>
                <a href="${pageContext.request.contextPath}/gratwall/index" class="app">在感恩墙留言</a>
                <a href="${pageContext.request.contextPath}/ask/tel" class="app">与专家通话</a>
                <a href="${pageContext.request.contextPath}/expert/list/0/1" class="app">找专家</a>
                <br class="clear">
            </p>
            <br><br><br>
            <p class="use">
                <b>随便看看：</b>
                <a href="${pageContext.request.contextPath}/uc/profile" target="_blank" class="app">个人主页</a>
                <a href="${pageContext.request.contextPath}/test/index/1" target="_blank" class="app">心理测试</a>
                <a href="${pageContext.request.contextPath}/essay/list/0/1" class="app" target="_blank">学习心理知识</a>
                <br class="clear"><br>
            </p>
        </div>

    </div>
</div>
<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->

</body>
</html>