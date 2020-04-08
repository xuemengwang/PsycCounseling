<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: wangxuemeng
  Date: 2018/4/14
  Time: 10:25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>心理文章_用心理学的眼光看世界_525心理网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myPagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/myConstant.js"></script>
    <script>
        $(function () {
            //分类栏的开关显示
            $(".aType .item").each(function () {
                if ($(this).children().text() === CON_ESSAY_FIELD[${type}]) {
                    $(this).children().addClass("on");
                } else {
                    $(this).children().removeClass("on");
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
    <!--文章左侧（文章导航+最新文章）-->
    <div class="al">
        <!--文章分类-->
        <ul class="aType">
            <li class="item"><a href="${pageContext.request.contextPath}/essay/list/0/1">全部</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/essay/list/1/1">婚恋</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/essay/list/2/1">健康</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/essay/list/3/1">性心理</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/essay/list/4/1">职场</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/essay/list/5/1">教育</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/essay/list/6/1">性格</a></li>
            <li class="item"><a href="${pageContext.request.contextPath}/essay/list/7/1">科普</a></li>
        </ul>
        <br class="clear">
        <!--文章分类End-->
        <!--最新文章-->
        <p id="tagnameinfo"><b>最新文章</b></p>
        <ul class="artlist">
            <c:forEach items="${pageBean.list}" var="essay">
                <li class="item">
                    <a href="${pageContext.request.contextPath}/essay/${essay.id}" target="_blank" class="coverImg">
                        <c:if test="${essay.imgUrl==null}">
                            <img src="${pageContext.request.contextPath}/image/essay/default_essay.jpg">
                        </c:if>
                        <c:if test="${essay.imgUrl!=null}">
                            <img src="${pageContext.request.contextPath}/image/essay/${essay.imgUrl}">
                        </c:if>
                    </a>
                    <ul>
                        <li class="tit">
                            <a href="${pageContext.request.contextPath}/essay/${essay.id}" target="_blank">${essay.title}</a>
                        </li>
                        <li class="des">
                            <i>${essay.source}</i>
                            <i>阅读 ${essay.clickrate}</i>
                        </li>
                    </ul>
                    <br class="clear">
                </li>
            </c:forEach>
        </ul>
        <!--最新文章End-->
        <!--分页-->
        <div id="pagination"></div>
        <!--分页End-->
    </div>
    <!--文章左侧 End-->
    <!--文章右侧(热文)-->
    <div class="ar pd">
        <ul class="hot">
            <li class="tit">热文</li>
            <li class="item">
                <a href="artical.html" target="_blank" class="photo">
                    <img src="${pageContext.request.contextPath}/image/essay/essay6_7.jpg"></a>
                <a href="artical.html" target="_blank" class="txt">曾奇峰：自卑的本质是瞧不起别人</a>
            </li>
            <li class="item">
                <a href="artical.html" target="_blank" class="photo">
                    <img src="${pageContext.request.contextPath}/image/essay/essay1_7.jpg"></a>
                <a href="artical.html" target="_blank" class="txt">爱，不是你以为的那样</a>
            </li>
            <li class="item">
                <a href="artical.html" target="_blank" class="photo">
                    <img src="/image/essay/default_essay.jpg"></a>
                <a href="artical.html" target="_blank" class="txt">曾奇峰：自卑的本质是瞧不起别人</a>
            </li>
            <li class="item">
                <a href="artical.html" target="_blank" class="photo">
                    <img src="/image/essay/default_essay.jpg"></a>
                <a href="artical.html" target="_blank" class="txt">曾奇峰：自卑的本质是瞧不起别人</a>
            </li>
            <li class="item">
                <a href="artical.html" target="_blank" class="photo">
                    <img src="/image/essay/default_essay.jpg"></a>
                <a href="artical.html" target="_blank" class="txt">曾奇峰：自卑的本质是瞧不起别人</a>
            </li>
            <li class="item">
                <a href="artical.html" target="_blank" class="photo">
                    <img src="/image/essay/default_essay.jpg"></a>
                <a href="artical.html" target="_blank" class="txt">曾奇峰：自卑的本质是瞧不起别人</a>
            </li>
        </ul>
    </div>
    <!--文章右侧End-->
    <br class="clear">
</div>

<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->
</body>
</html>
