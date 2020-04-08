<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/5
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>心理案例_心理问题_心理案例分析_525心理网_您身边的心理咨询专家</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/case.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/casebase.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
    <script>
        $(function () {
            //页面中时间转换
            $(".timeNeedToConvert").each(function () {
                var timestamp = $(this).text();
                $(this).text(timeFormat(parseInt(timestamp)));
            })

            //如果该案件无人受理，且刚好浏览者是心理咨询师，则可以受理此案件，把”向他提问“改为受理该咨询
            if ('${caze.replyid}' === '' && $.cookie("role") === '2'){
                var button = $(".button_ask");
                button.text('受理该咨询');
                button.attr("href","#");
                button.click(function () {
                    var href = "${pageContext.request.contextPath}/case/${caze.id}/receive";
                    var content = $("textarea").val();
                    $.post(
                        href, //url地址
                        {"userId": $.cookie("id")}, //请求参数
                        function () { //执行成功后的回调函数
                            alert("受理成功！");
                            window.location.reload();
                        }
                    );
                });
            }

            //对回复框的处理
            var countOfProblem = $(".que").length;
            var countOfReply = $(".reply").length;

            if ($.cookie("id") === '${caze.fromid}') {
                //咨询者
                if (countOfProblem !== countOfReply) {
                    // 等待回复
                    $("textarea").val("请耐心等待咨询师的回复...").attr("disabled", "true");
                } else {
                    //添加新的问题
                    $(".button").click(function () {
                        var href = "${pageContext.request.contextPath}/case/${caze.id}/addProblem";
                        var content = $("textarea").val();
                        if (content === '') {
                            alert("请先填写内容");
                        } else {
                            $.post(
                                href, //url地址
                                {"content": content}, //请求参数
                                function () { //执行成功后的回调函数
                                    alert("回复成功！");
                                    window.location.reload();
                                }
                            );
                            //向咨询师发送消息
                            $.ajax("${pageContext.request.contextPath}/sendMessage",{
                                data:{'receiverid':'${caze.replyid}','title':'系统提示','content':'你有新的咨询'},
                                type:"POST"
                            })
                        }
                    });
                }
            } else if ($.cookie("id") === '${caze.replyid}') {
                //咨询师
                if (countOfProblem === countOfReply) {
                    // 等待新的提问
                    $("textarea").val("感谢您的热心解答。谢谢！").attr("disabled", "true");
                } else {
                    //添加新的回复
                    $(".button").click(function () {
                        var href = "${pageContext.request.contextPath}/case/${caze.id}/reply";
                        var content = $("textarea").val();
                        if (content === '') {
                            alert("请先填写内容");
                        } else {
                            $.post(
                                href, //url地址
                                {"content": content, "problemId": ${lastProblemId}}, //请求参数
                                function () { //执行成功后的回调函数
                                    alert("感谢您的热心解答！");
                                    window.location.reload();
                                }
                            );
                            //向咨询者发送消息
                            $.ajax("${pageContext.request.contextPath}/sendMessage",{
                                data:{'receiverid':'${caze.fromid}','title':'系统提示','content':'你的咨询有了新的回复'},
                                type:"POST"
                            })
                        }
                    });
                }
            } else {
                //既不是咨询者也不是咨询师，隐藏回复框
                $(".replyBox").hide();
            }
        })

        function add0(m) {
            return m < 10 ? '0' + m : m
        }

        //时间戳转化成时间格式
        function timeFormat(timestamp) {
            //timestamp是整数，否则要parseInt转换,不会出现少个0的情况
            var time = new Date(timestamp);
            var year = time.getFullYear();
            var month = time.getMonth() + 1;
            var date = time.getDate();
            var hours = time.getHours();
            var minutes = time.getMinutes();
            var seconds = time.getSeconds();
            return year + '-' + add0(month) + '-' + add0(date) + ' ' + add0(hours) + ':' + add0(minutes) + ':' + add0(seconds);
        }

    </script>
</head>

<body>
<!--导航条Start-->
<jsp:include page="../common/header.jsp"/>
<!--导航条到End-->
<!--咨询师介绍-->
<div class="full bg7">
    <div class="dr-topinfo">
        <ul class="h-base-a">
            <li class="avatar">
                <img src="${caze.replyUser.avatar}">
            </li>
        </ul>
        <ul class="dr-base">
            <li class="dname"><b>${caze.replyUser.name} 心理咨询师工作室</b></li>
            <li class="dremark">${caze.replyUser.qualification}&nbsp;&nbsp;&nbsp;&nbsp;${caze.replyUser.address}</li>
            <li class="dask">
                <i>咨询预约：<em>${caze.replyUser.phone}</em></i>
                <div class="pd clear"></div>
                <a class="button_ask" href="${pageContext.request.contextPath}/ask/${caze.replyid}" target="_blank">向TA提问</a>
                <br class="clear">
            </li>
        </ul>
        <br class="clear">
    </div>
</div>
<!--咨询师介绍End-->
<!--案例-->
<div class="full bg8">
    <div class="wrap casebody">
        <div class="c-left">
            <!--标题-->
            <div id="c-title">
                <div>
                    <h1>${caze.title}</h1>
                    <i><a  class="un" target="_blank">${caze.fromUser.name}</a></i>
                    <i>生于${caze.fromUser.borndate.year}年</i>
                </div>
            </div>
            <!--标题End-->
            <c:forEach items="${problemList}" var="problem" varStatus="status">
                <!--一次咨询-->
                <div class="c-item">
                    <p class="num"><i>第<b>${status.count}</b>次咨询</i></p>
                    <div class="txt">
                        <!--提问-->
                        <p class="que hig">${problem.content}
                            <span id="c1"></span>
                        </p>
                        <p class="time">提问于<span class="timeNeedToConvert">${problem.time}</span></p>
                        <!--回答-->
                        <c:if test="${problem.reply.content!=null}">
                            <p class="reply low">
                                <a href="${pageContext.request.contextPath}/expert/${caze.replyid}}" class="avatar">
                                    <img src="${caze.replyUser.avatar}">
                                </a>
                                <span class="c-drinfo">
                                <a href="${pageContext.request.contextPath}/expert/${caze.replyid}}" target="_blank"
                                   class=" low">${caze.replyUser.name} 咨询师&nbsp;&nbsp;回复：</a>
                                <br>推荐直接与${caze.replyUser.name}通话<b>${caze.replyUser.phone}</b>更快捷有效且保护隐私！</span>
                                <br class="clear">
                            </p>
                            <p class="ask low">${problem.reply.content}</p>
                            <p class="time">回复于<span class="timeNeedToConvert">${problem.reply.time}</span></p>
                        </c:if>
                    </div>
                    <br class="clear">
                </div>
                <!--一次咨询End-->
            </c:forEach>

            <!--回复消息（仅当事人可见）-->
            <div class="replyBox">
                <textarea style="margin: 0; height: 204px; width: 1067px;font-size: 20px"></textarea>
                <hr>
                <a class="button" style="float: right;">回复</a>
            </div>
            <!--回复消息End-->
            <!--4大按钮-->
            <br class="clear"><br>
            <ul class="c-fun">
                <li>
                    <a href="${pageContext.request.contextPath}/ask/" target="_blank">我要提问<i>专业咨询师10分钟内解答</i></a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/test/index/1" target="_blank">专业测评<i>在这里发现未知的自己</i></a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/case/" target="_blank">解决问题<i>心理专家为您在线解惑</i></a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/essay/index" target="_blank">自我成长<i>专业文章助您心灵成长</i></a>
                </li>
            </ul>

            <br class="clear">
            <!--4大按钮End-->
        </div>
        <br class="clear">
    </div>
</div>
<!--案例End-->

<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->
</body>

</html>