<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>家庭财务管理系统 - 您的家庭理财好助手</title>
    <jsp:include page="include/head.jsp"/>
    <!-- 登录界面样式 -->
    <link rel="stylesheet" href="${rootPath}css/login.css">
    <link rel="stylesheet" href="${rootPath}css/admin.css">
    <link rel="stylesheet" href="${rootPath}css/layer.css">
    <script src="${rootPath}js/sha256.js"></script>
    <!-- END：登录界面样式 -->
</head>
<body class="layui-layout-body" layadmin-themealias="default">
<div class="layui-layout layui-layout-admin">
    <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login"
         style="display: none;padding: 20px 0; ">
        <div class="layadmin-user-login-main" style="width:600px;">
            <div class="layadmin-user-login-box layadmin-user-login-header">
                <h2>家庭财务管理系统 - 登记家庭</h2>
                <p>您的所有信息我们会为您保密，请放心填写</p>
            </div>
            <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-md6">
                        <fieldset class="layui-elem-field">
                            <legend>个人信息</legend>
                            <div class="layui-field-box">
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-username"
                                           for="LAY-user-reg-name"></label>
                                    <input autocomplete="off" type="text" name="name" id="LAY-user-reg-name"
                                           lay-verify="required"
                                           placeholder="姓名" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                                           for="LAY-user-reg-password"></label>
                                    <input autocomplete="off" type="password" name="password" id="LAY-user-reg-password"
                                           lay-verify="pass"
                                           placeholder="密码" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                                           for="LAY-user-reg-repass"></label>
                                    <input autocomplete="off" type="password" name="rePass" id="LAY-user-reg-repass"
                                           lay-verify="pass"
                                           placeholder="确认密码" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-date"
                                           for="LAY-user-reg-birthday"></label>
                                    <input autocomplete="off" type="text" name="birthday" id="LAY-user-reg-birthday"
                                           lay-verify="date"
                                           placeholder="选择生日" class="layui-input">
                                </div>
                                <div class="layui-form-item layui-bg-white"
                                     style="border:1px solid #E6E6E6;border-radius: 2px;">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-male"></label>
                                    <div class="layui-input-inline"
                                         style="padding-left: 40px;color:#c2c2c2;">
                                        <label style="line-height: 38px;padding-right: 20px;">性别</label>
                                        <input type="radio" name="sex" value="0" title="男" checked>
                                        <input type="radio" name="sex" value="1" title="女">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-read"
                                           for="LAY-user-reg-occupation"></label>
                                    <input autocomplete="off" type="text" name="occupation" id="LAY-user-reg-occupation"
                                           lay-verify="required"
                                           placeholder="职业" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
                                           for="LAY-user-reg-phone"></label>
                                    <input autocomplete="off" type="text" name="phone" id="LAY-user-reg-phone"
                                           lay-verify="phone"
                                           placeholder="手机号" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-face-smile"
                                           for="LAY-user-reg-role"></label>
                                    <input autocomplete="off" type="text" name="role" id="LAY-user-reg-role"
                                           lay-verify="required"
                                           placeholder="家庭角色(爸爸、儿子)" class="layui-input">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="layui-col-md6">
                        <fieldset class="layui-elem-field">
                            <legend>个人信息</legend>
                            <div class="layui-field-box">
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-rmb"
                                           for="LAY-user-reg-salary"></label>
                                    <input autocomplete="off" type="text" name="salary" id="LAY-user-reg-salary"
                                           lay-verify="salary"
                                           placeholder="大致年收入" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-flag"
                                           for="LAY-user-reg-motto"></label>
                                    <input autocomplete="off" type="text" name="motto" id="LAY-user-reg-motto"
                                           lay-verify="motto"
                                           placeholder="人生目标" class="layui-input">
                                </div>
                            </div>
                        </fieldset>
                        <fieldset class="layui-elem-field">
                            <legend>家庭信息</legend>
                            <div class="layui-field-box">
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-home"
                                           for="LAY-user-reg-fname"></label>
                                    <input autocomplete="off" type="text" name="fname" id="LAY-user-reg-fname"
                                           lay-verify="required"
                                           placeholder="家庭名称" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-location"
                                           for="LAY-user-reg-faddress"></label>
                                    <input autocomplete="off" type="text" name="faddress" id="LAY-user-reg-faddress"
                                           lay-verify="required"
                                           placeholder="家庭地址" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <label class="layadmin-user-login-icon layui-icon layui-icon-speaker"
                                           for="LAY-user-reg-fmotto"></label>
                                    <input autocomplete="off" type="text" name="fmotto" id="LAY-user-reg-fmotto"
                                           lay-verify="fmotto"
                                           placeholder="家庭宣言" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <input type="checkbox" name="isExpose" lay-skin="primary" title="允许他人查看家庭信息"
                                           checked="">
                                    <div class="layui-unselect layui-form-checkbox layui-form-checked"
                                         lay-skin="primary">
                                        <span>公开</span><i class="layui-icon layui-icon-ok"></i></div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>

                <div class="layui-form-item">
                    <input type="checkbox" name="agreement" lay-skin="primary" title="同意用户协议"
                           checked="">
                    <div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary">
                        <span>同意用户协议</span><i
                            class="layui-icon layui-icon-ok"></i></div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="user-reg-submit">开始使用家庭财务管理系统
                    </button>
                </div>
                <div class="layui-trans layui-form-item layadmin-user-login-other">
                    <label>社交账号注册</label>
<%--                    <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>--%>
                    <a href="log" class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有家庭登入</a>
                </div>
            </div>
        </div>

        <div class="layui-trans layadmin-user-login-footer">
            <p>家庭理财管理系统</p>
        </div>
    </div>
</div>
<!-- 导入代码库文件 -->
<jsp:include page="include/jser.jsp"/>
<!-- END：代码库文件 -->
<!-- ================================在这里编写页面的js代码================================ -->
<script>
    layui.use(['form', 'element', 'layer', 'laydate'], function () {
        var form = layui.form,
            element = layui.element,
            layer = layui.layer,
            laydate = layui.laydate;
        laydate.render({
            elem: '#LAY-user-reg-birthday' //指定元素
        });
        /**
         * 验证部分数据正确性
         **/
        form.verify({
            "pass": [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ],
            "rePass": function (value, item) { //value：表单的值、item：表单的DOM对象
                var pwd = $("#LAY-user-reg-password").val();
                if (value !== pwd) {
                    return "两次输入的密码不一致";
                }
            },
            "fmotto": function (value, item) {
                if (value === "" || value === undefined) {
                    $("#LAY-user-reg-fmotto").val("暂无");
                }
            },
            "motto": function (value, item) {
                if (value === "" || value === undefined) {
                    $("#LAY-user-reg-motto").val("暂无");
                }
            },
            "salary": function (value, item) {
                var salary = parseFloat(value);
                if (isNaN(salary)) {
                    return "薪资必须是数字";
                }
                if (salary < 0) {
                    return "薪资不能低于0";
                }
                if (salary > 99999999) {
                    return "薪资不能高于一个亿";
                }
            }
        });
        /**
         * 提交请求
         * */
        form.on('submit(user-reg-submit)', function (data) {
            /* 用户协议检测 */
            if (!data.field.agreement) {
                layer.msg("您必须同意用户协议！", {
                    offset: '100px'
                    , icon: 2
                    , time: 1000
                });
                return false;
            }
            /* 封装数据对象 */
            var user = {
                "name": data.field.name,
                "password": sha256_digest(data.field.password),
                "birthday": new Date(data.field.birthday),
                "sex": parseInt(data.field.sex),
                "occupation": data.field.occupation,
                "salary": parseFloat(data.field.salary).toFixed(2),
                "phone": data.field.phone,
                "motto": data.field.motto,
                "role": data.field.role,
                "avatar": "default",
                "auid": 1,
                "isAvaliable": 1,
                "createDate": new Date()
            };
            var family = {
                "name": data.field.fname,
                "motto": data.field.fmotto,
                "address": data.field.faddress,
                "isExpose": data.field.isExpose ? 1 : 0,
                "avatar": "default"
            };
            util.httpRequest.post("rDo", {
                "user": user,
                "family": family
            }, function (msg) {
                if (msg.code === 200) {
                    window.location.href = "log";
                } else {
                    layer.msg(msg.info, {
                        offset: '100px'
                        , icon: 2
                        , time: 1000
                    });
                }
            });
            return false;
        });
    });
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>