<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Description: 
  User: wangxuemeng
  Date: 2018/5/6
  Time: 16:13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${essay.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/artical.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/myConstant.js"></script>
    <script>
        $(function () {
            //文章类型
            var essayType = $("#essay_type");
            essayType.text(CON_ESSAY_FIELD[essayType.text()]);
            //文章发布时间转化
            var timeEle=$(".timeNeedConvert");
            timeEle.each(function () {
                var time = $(this).text();
                time = timeFormat(time);
                $(this).text(time);
            })

        })

        function add0(m){return m<10?'0'+m:m }
        //时间戳转化成时间格式
        function timeFormat(timestamp){
            timestamp = parseInt(timestamp);
            //timestamp是整数，否则要parseInt转换,不会出现少个0的情况
            var time = new Date(timestamp);
            var year = time.getFullYear();
            var month = time.getMonth()+1;
            var date = time.getDate();
            var hours = time.getHours();
            var minutes = time.getMinutes();
            var seconds = time.getSeconds();
            return year+'-'+add0(month)+'-'+add0(date);
        }
    </script>
</head>
<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->

<div class="wrap pdline">
    <!--文章-->
    <div class="artview-l">
        <p class="artType">
            <a href="essay/list/0/1"><b id="essay_type">${essay.type}</b><i></i></a>
        </p>
        <h1 id="a-title">${essay.title}</h1>
        <p id="a-remark">
            <i class="timeNeedConvert">${essay.time}</i>
            <i>${essay.source}</i>
            <i>阅读 ${essay.clickrate}</i>
        </p>
        <!--文章正文-->
        <div class="a-body">
            <p>
                <c:if test="${essay.imgUrl==null}">
                    <img src="${pageContext.request.contextPath}/image/essay/default_essay.jpg">
                </c:if>
                <c:if test="${essay.imgUrl!=null}">
                    <img src="${pageContext.request.contextPath}/image/essay/${essay.imgUrl}">
                </c:if>
            </p>
            <div>
                ${essay.content}
            </div>
            <p class="end">— The End —</p>
        </div>
        <!--文章正文End-->
    </div>
    <!--文章End-->
    <br class="clear">
</div>

<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->
</body>
</html>