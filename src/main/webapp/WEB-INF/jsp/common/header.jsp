<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/2
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%--请先包含<script src="js/jquery-1.8.3.js"></script>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script>

    $(function () {
        if ($.cookie('id')) {
            //如果已登陆（cookie中有phone信息）,隐藏登陆注册按钮
            $(".regAndLog").hide();
            $(".navUserName").text('你好，'+$.cookie('name'));
            $(".navUserAvatar").attr('src',$.cookie('avatar'));
        }else {
            //否则，隐藏头像相关功能
            $("#homefun").hide();
            $("#showmsg").hide();
            $(".navUserName").hide();
        }
    })

    //关闭消息
    function closeMsg() {
        $("#showmsg").css("display", "none");
    }
    //显示头像弹出框
    function showHomeFun() {
        $("#homefun").addClass("current").find("li ul").css("display", "block");
    }
    //关闭头像弹出框
    function closeHomeFun() {
        $("#homefun").removeClass("current").find("li ul").css("display", "none");
    }
    //安全退出
    function logout() {
        //清除cookie
        $.cookie('id', '', { expires: -1, path:'/' });
        $.cookie('name', '', { expires: -1, path:'/' });
        $.cookie('role', '', { expires: -1, path:'/' });
        $.cookie('phone', '', { expires: -1, path:'/' });
        $.cookie('avatar', '', { expires: -1, path:'/' });
        window.location.href="${pageContext.request.contextPath}/index";
    }

</script>
<!--导航条Start-->
<div class="bg bar">
    <div class="wrap">
        <ul id="mge">
            <li class="logo">
                <a href="${pageContext.request.contextPath}/index">
                    <img src="${pageContext.request.contextPath}/image/logo.png">
                </a>
            </li>
            <li class="dis">
                <a href="${pageContext.request.contextPath}/essay/list/0/1">文章</a>
            </li>
            <li class="dis">
                <a href="${pageContext.request.contextPath}/test/index/1">测评</a>
            </li>
            <li class="dis">
                <a href="${pageContext.request.contextPath}/expert/list/0/1">找专家</a>
            </li>
            <li class="dis">
                <a href="${pageContext.request.contextPath}/case/">问答</a>
            </li>
            <li class="dis">
                <a href="${pageContext.request.contextPath}/gratwall/index">感恩墙</a>
            </li>
        </ul>
        <div class="topright">
            <ul id="homefun" onmouseenter="showHomeFun();" onmouseleave="closeHomeFun();">
                <li>
                    <a href="${pageContext.request.contextPath}/uc/message/1" class="baravatar">
                        <span><img class="navUserAvatar" src=""></span>
                    </a>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/uc/message/1" class="m_new">
                                <span>未读消息</span>
                                <br class="clear">
                            </a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/uc/message/1">管理中心</a></li>
                        <li><a href="${pageContext.request.contextPath}/uc/caseRecord/1">我的咨询记录</a></li>
                        <li><a href="${pageContext.request.contextPath}/uc/profile" class="acountset">账户设置</a>
                            <a href="javascript:logout();" class="logout">安全退出</a>
                            <br class="clear">
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="navUserName">你好，游客</div>

            <a href="${pageContext.request.contextPath}/register" class="bg lr regAndLog">
                <i class="bg reg"></i><span>注册</span><br class="clear">
            </a>
            <a href="${pageContext.request.contextPath}/login" class="bg lr regAndLog">
                <i class="bg login"></i><span>登录</span><br class="clear">
            </a>
            <%--//搜索框--%>
            <%--<form id="soform" action="#" method="get">
                <input type="text" name="q" id="keyword" class="bg" maxlength="28">
                <a href="#" id="btn_search">
                    <i class="bg"></i>
                </a>
                <br class="clear">
            </form>--%>
        </div>
        <br class="clear">
        <%--<div id="showmsg" style="display: block;">--%>
            <%--<div>--%>
                <%--<ul id="showmsglist">--%>
                    <%--<li><a href="javascript:void(0);" title="关闭" class="bg close" onclick="closeMsg();"></a>--%>
                        <%--<br class="clear">--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="${pageContext.request.contextPath}/uc/message/1" class="msgrow">您有未读消息<i>&nbsp;1&nbsp;</i></a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>
<div id="headeline"></div>
<!--导航条到End-->
