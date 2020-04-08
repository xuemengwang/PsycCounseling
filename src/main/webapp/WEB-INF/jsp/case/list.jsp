<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/5
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>心理案例_心理问题_心理案例分析_525心理网_您身边的心理咨询专家</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/caselist.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myPagination.js"></script>
    <script>
        $(function () {
            // 时间处理
            $(".cazeTime").each(function () {
                var timestamp = $(this).text();
                $(this).text(timeFormat(parseInt(timestamp)));
            });
            //分页处理
            var div = $("#pagination");
            var curPage = ${pageBean.curPage};
            var allPage = ${pageBean.allPage};
            var length = 5;
            paginationConstructor(div, length, curPage, allPage);

        })


        //时间戳转化成时间格式
        function add0(m){return m<10?'0'+m:m }
        function timeFormat(timestamp){
            //timestamp是整数，否则要parseInt转换,不会出现少个0的情况
            var time = new Date(timestamp);
            var year = time.getFullYear();
            var month = time.getMonth()+1;
            var date = time.getDate();
            var hours = time.getHours();
            var minutes = time.getMinutes();
            var seconds = time.getSeconds();
            return year+'-'+add0(month)+'-'+add0(date)+' '+add0(hours)+':'+add0(minutes)+':'+add0(seconds);
        }

    </script>
</head>

<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->

<div class="wrap">
    <p class="title"><a href="${pageContext.request.contextPath}/case/index">心理案例</a></p>
    <p class="channel-remark">525心理网心理案例分析内容涵盖婚姻心理、恋爱心理、性心理、青春期心理、家庭矛盾心理、亲子心理、人际关系心理等，仅供学习参考，请谨慎参阅。</p>
</div>
<!--案例-->
<div class="wrap pd">
    <ul id="clist">
        <c:forEach items="${pageBean.list}" var="caze">
            <li>
            <a href="${pageContext.request.contextPath}/case/${caze.id}" target="_blank" class="tit">${caze.title}</a>
            <span class="remark">
                <em class="cazeTime">${caze.time}</em>
                <i>本案例由心理咨询师
                    <a href="${pageContext.request.contextPath}/expert/${caze.replyid}" target="_blank">${caze.replyUser.name}</a>
                    提供解答
                </i>
                <br class="clear">
            </span>
        </li>
        </c:forEach>
    </ul>
    <!--分页-->
    <div id="pagination"></div>
    <!--分页End-->
</div>
<!--案例End-->

<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->
</body>

</html>