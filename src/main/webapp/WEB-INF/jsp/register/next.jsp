<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/2
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户注册_525心理网_您身边的心理咨询专家</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/regverify.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/sha256.js"></script>
    <script>
        $(function () {
            var SMSCode = Math.ceil(Math.random() * 10000);

            //发送短信验证码
            $(".send").click(function () {
                SMSCode = "" + Math.ceil(Math.random() * 10000);
                var time = Math.ceil(new Date().getTime() / 1000);
                var mobile = $("#mobile").val();
                var button = $(".send");
                $.ajax("https://yun.tim.qq.com/v5/tlssmssvr/sendsms?sdkappid=1400093317&random=" + SMSCode, {
                    method: "POST",
                    data: {
                        "ext": "",
                        "extend": "",
                        "params": [
                            "验证码",
                            SMSCode,
                            "4"
                        ],
                        "sig": sha256_digest("appkey=ade2f6df30f7149b17062208ee3a6045&random=" + SMSCode + "&time="+time+"&mobile="+mobile),
                        "tel": {
                            "mobile": mobile,
                            "nationcode": "86"
                        },
                        "time": time,
                        "tpl_id": 122248
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.result === 0) {
                            button.text("已发送");
                            button.removeAttr('onclick');
                        }else{
                            alert("错误" + data.result + "：" + data.errmsg);
                        }
                    }
                })
            });


            //检测验证码是否正确
           /* $("#regform").submit(function () {
                if (parseInt($("#dynpwd").val()) === SMSCode) {
                    return true;
                } else {
                    alert("验证码有误");
                    return false;
                }
            });*/

        })

    </script>
</head>

<body>
<!--头-->
<div style="background-color:  #26A027">
    <div class="wrap pd">
        <p id="logo">
            <a href="${pageContext.request.contextPath}/index"><img
                    src="${pageContext.request.contextPath}/image/logo.png"></a>
        </p>
        <p class="title">新用户注册</p>
        <p class="fun"><i>已有账号？</i>
            <a href="${pageContext.request.contextPath}/login">登录</a>
        </p><br class="clear">
    </div>
</div>
<!--头End-->
<div class="full bgreg">
    <div class="wrap regbg">
        <form id="regform" action="${pageContext.request.contextPath}/register/success" method="post">
            <p class="item">
                <i>手机号
                    <em>用于登录/找回密码/心理咨询业务</em>
                </i>
                <input type="text" id="mobile" name="phone" maxlength="11">
            </p>
            <p class="item">
                <i>登录密码
                    <em>由<b>字母和数字</b>组成（6-20位）</em>
                </i>
                <input type="password" name="password" id="password">
            </p>
            <%--<p class="item mcode">
                <i>手机验证码</i>
                <input type="text" name="dynpwd" id="dynpwd" maxlength="6">
                <a href="javascript:void(0);" class="send">发送验证码</a>
            </p>--%>
            <p class="item">
                <br>
                <input type="submit" id="btn-u-next" value="完成注册">
                <input type="hidden" name="name" value="${user.name}">
                <input type="hidden" name="sex" value="${user.sex}">
                <input type="hidden" name="borndate" value="${user.borndate}">
                <input type="hidden" name="degree" value="${user.degree}">
                <input type="hidden" name="role" value="${user.role}">
                <input type="hidden" name="address" value="${user.address}">
                <input type="hidden" name="qualification" value="${user.qualification}">
                <input type="hidden" name="qualificationid" value="${user.qualificationid}">
                <input type="hidden" name="introduction" value="${user.introduction}">
                <input type="hidden" name="field" value="${user.field}">
                <input type="hidden" name="idcard" value="${user.idcard}">
            </p>
        </form>
    </div>
</div>
<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->

</body>

</html>