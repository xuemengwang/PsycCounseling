<%--
  Created by IntelliJ IDEA.
  User: wangxuemeng
  Date: 2018/4/2
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>专家入住</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/regexpert.css">
</head>

<body>
<!--头-->
<div style="background-color:  #26A027">
    <div class="wrap pd">
        <p id="logo">
            <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/image/logo.png"></a>
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
        <br>
        <a href="${pageContext.request.contextPath}/register/user" class="ureg_info">
            提示：以下为专业咨询师入驻需提供的审核资料
            <i>求助者注册请进入&nbsp;&gt;&gt;</i>
        </a>
        <form id="regform" action="${pageContext.request.contextPath}/register/next">
            <p class="item">
                <i>姓名<em>填写身份证上的姓名</em></i>
                <input type="text" id="name" name="name" maxlength="20">
            </p>
            <p class="item">
                <i>性别</i>
                <input id="sex_0" type="radio" name="sex" value="1">
                <label for="sex_0">男</label>
                <input id="sex_1" type="radio" name="sex" value="0">
                <label for="sex_1">女</label>
            </p>
            <p class="item">
                <i>生日<em>填写身份证上的出生日期</em></i>
                <input type="date" id="borndate" name="borndate">
            </p>
            <p class="item">
                <i>身份证号码<em>仅用于入驻审核</em></i>
                <input type="number" id="idcard" name="idcard" maxlength="18">
            </p>
            <p class="item">
                <i>所在城市</i>
                <input type="text" id="address" name="address" placeholder="省/市/区">
            </p>
            <p class="item">
                <i>学历</i>
                <select id="degree" name="degree">
                    <option value="">请选择</option>
                    <option value="博士以上">博士以上</option>
                    <option value="博士">博士</option>
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="初中以下">初中以下</option>
                    <option value="其它">其它</option>
                </select>
            </p>
            <p class="item">
                <i>专业资质</i>
                <select id="qualification" name="qualification">
                    <option value="">请选择</option>
                    <option value="二级心理咨询师">二级心理咨询师</option>
                    <option value="三级心理咨询师">三级心理咨询师</option>
                    <option value="婚姻家庭咨询师三级">婚姻家庭咨询师三级</option>
                    <option value="婚姻家庭咨询师二级">婚姻家庭咨询师二级</option>
                    <option value="心理治疗师">心理治疗师</option>
                    <option value="家庭系统排列指导师">家庭系统排列指导师</option>
                    <option value="催眠治疗师">催眠治疗师</option>
                    <option value="心理学专业本科">心理学专业本科</option>
                    <option value="心理学专业研究生">心理学专业研究生</option>
                    <option value="心理学专业博士">心理学专业博士</option>
                    <option value="心理学专业博士以上">心理学专业博士以上</option>
                </select>
            </p>
            <p class="item">
                <i>专业资质证书编号</i>
                <input type="number" id="qualificationid" name="qualificationid">
            </p>
            <p class="item">
                <i>擅长领域</i>
                <select id="field" name="field">
                    <option value="">请选择</option>
                    <option value="1">婚恋</option>
                    <option value="2">健康</option>
                    <option value="3">两性</option>
                    <option value="4">职场</option>
                    <option value="5">教育</option>
                    <option value="6">性格</option>
                    <option value="7">其他</option>
                </select>
            </p>


            <p class="item">
                <i>个人简介<em>包括心理咨询行业成长背景、从业经历等</em></i>
                <textarea id="introduction" name="introduction" rows="2" cols="20" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 152px;"></textarea>
            </p>
            <p class="item">
                <br>
                <input type="hidden" name="role" value="2">
                <input type="submit" id="btn-u-reg" value="提交入驻申请">
            </p>
        </form>
    </div>
</div>
<p class="pd"></p>
<!--页脚-->
<jsp:include page="../common/footer.jsp"/>
<!--页脚End-->

</body>
</html>