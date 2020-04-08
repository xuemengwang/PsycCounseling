<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/5
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>在线免费心理咨询_在线心理医生_525心理网_您身边的心理咨询专家</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/caseindex.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script>
        $(function () {
            $(".passedTime").each(function () {
                var startTime = $(this).text();
                $(this).text(computePassedTime(startTime));
            })

        });

        //计算已过时间
        function computePassedTime(startTime) {
            var differTime = new Date().getTime() - parseInt(startTime);
            var day = Math.floor(differTime / (24 * 60 * 60 * 1000));
            if (day > 0) return day + '天前';
            var hours = Math.floor(differTime / (60 * 60 * 1000));
            if (hours > 0) return hours + '小时前';
            var minutes = Math.floor(differTime / (60 * 1000));
            if (minutes > 0) return minutes + '分钟前';
            var seconds = Math.floor(differTime / 1000);
            return seconds + '秒前';
        }
    </script>

</head>
<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->

<!--宣传广告+提问按钮-->
<div id="fbg" title="点击提问">
    <div id="fask">
        <p>
            <i>8</i><i>3</i><i>6</i><i>2</i><i>9</i><i>3</i><i>3</i>
            <em>个心理问题得到专业解答</em>
        </p>
        <a href="${pageContext.request.contextPath}/ask/">我要提问</a>
    </div>
    <br class="clear">
</div>
<!--宣传广告+提问按钮End-->
<p class="pd"></p>
<!--最新解答-->
<div class="ibox">
    <p class="itit">
        <span class="tit">最新解答</span>
        <a href="${pageContext.request.contextPath}/case/list/1" class="more">>> 更多</a>
    </p>
    <ul id="clist-prive" class="clist">
        <c:forEach items="${cases}" var="caze">
            <li>
                <span>
                    <a href="${pageContext.request.contextPath}/case/${caze.id}" target="_blank" class="tit">
                        ${caze.title}
                    </a>
                    <i class="passedTime">${caze.time}</i>
                    <br class="clear">
                </span>
                <em>本案例由心理咨询师
                    <a href="${pageContext.request.contextPath}/expert/${caze.replyid}" target="_blank">${caze.replyUser.name}</a>
                    提供解答
                </em>
            </li>
        </c:forEach>
        <li class="more">
            <a href="${pageContext.request.contextPath}/case/list/1" target="_blank">&gt;&nbsp;更多案例...</a>
        </li>
    </ul>
    <br class="clear">
</div>
<!--最新解答End-->
<p class="pd"></p>
<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->

</body>
</html>