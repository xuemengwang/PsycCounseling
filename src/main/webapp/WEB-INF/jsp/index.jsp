<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/2
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>525心理网_您身边的心理咨询专家</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<!--   图+求助Start-->
<div class="ibox ibg">
    <div class="il">
        <a href="${pageContext.request.contextPath}/test/index/1">
            <img src="${pageContext.request.contextPath}/image/AD1.jpg"/>
        </a>
    </div>
    <!--求助按钮-->
    <div class="ir">
        <p id="stat-core">24025&nbsp;名心理专家汇聚这里
            <br><em>帮您解答心理困惑</em>
            <br><span>已解答<i>8362933</i>个在线心理问题</span>
            <a href="${pageContext.request.contextPath}/ask/index" target="_blank" class="btn-zx">立即咨询</a>
        </p>
        <div id="stat-icon"></div>
    </div>
    <!--求助按钮End-->
    <br class="clear">
</div>
<p class="pd"></p>
<!--轮播图+求助End-->
<!--专家推荐+感恩墙Start-->
<div class="ibox ig">
    <div class="il">
        <p class="itit">
            <span class="tit">专家推荐</span>
            <a href="${pageContext.request.contextPath}/expert/list/0/1" class="more">>> 更多</a>
        </p>
        <ul id="dr-list">
        <c:forEach items="${expertList}" var="expert">
            <li>
                <a href="${pageContext.request.contextPath}/expert/${expert.id}" target="_blank">
                    <img src="${expert.avatar}">
                    <br>${expert.name}
                </a>
            </li>
        </c:forEach>
        </ul>
    </div>
    <div class="ir">
        <div class="itit-r">
            <b class="tit">感恩墙</b>
            <a href="${pageContext.request.contextPath}/gratwall/index" class="more">>> 更多</a>
            <ul id="dp-list">
                <li>
                <span>
                    <a href="javascript:void(0);" target="_blank">客户1</a>
                    为心理咨询师
                    <a href="expert.html" target="_blank">
                    朱可然
                    </a>
                    留言
                </span>
                    <i></i>
                    <a href="${pageContext.request.contextPath}/gratwall/1" class="txt">
                        谢谢您帮我儿子从抑郁的死亡边缘拉回来。现在儿子已经能够正常学习，与同学老师交往也渐渐多了。老师说他的学习比以前还进步了很多。我们全家都感谢您。
                    </a>
                </li>
                <li>
                <span>
                    <a href="javascript:void(0);" target="_blank">客户1</a>
                    为心理咨询师
                    <a href="expert.html" target="_blank">
                    朱可然
                    </a>
                    留言
                </span>
                    <i></i>
                    <a href="owe_detail.html" class="txt">
                        谢谢您帮我儿子从抑郁的死亡边缘拉回来。现在儿子已经能够正常学习，与同学老师交往也渐渐多了。老师说他的学习比以前还进步了很多。我们全家都感谢您。
                    </a>
                </li>
                <li>
                <span>
                    <a href="javascript:void(0);" target="_blank">客户1</a>
                    为心理咨询师
                    <a href="expert.html" target="_blank">
                    朱可然
                    </a>
                    留言
                </span>
                    <i></i>
                    <a href="owe_detail.html" class="txt">
                        谢谢您帮我儿子从抑郁的死亡边缘拉回来。现在儿子已经能够正常学习，与同学老师交往也渐渐多了。老师说他的学习比以前还进步了很多。我们全家都感谢您。
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <br class="clear">
</div>
<p class="pd"></p>
<!--专家推荐+感恩墙End-->
<jsp:include page="common/footer.jsp"/>
</body>

</html>