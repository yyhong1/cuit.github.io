<%--
  Created by IntelliJ IDEA.
  User: MBH
  Date: 2019/7/15
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>家庭财务管理系统 - 您的家庭理财好助手</title>
    <jsp:include page="include/head.jsp"/>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 头部和导航区域（请不要修改） -->
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END:头部和导航区域 -->
    
    <!-- 内容主体区域 -->
    <div class="layui-body">
        <!-- -------------编写的HTML代码从这里开始------------- -->
        <div style="padding: 50px;font-size:40px;">成员额度管理
            <button type="button" class="layui-btn"style="float:right" id="add">添加新额度限制</button>
        </div>
        <table class="layui-table" lay-data="{width: 1500, height:330, url:'../limit/getAllLimit/', page:true, id:'idTest'}" lay-filter="demo">
            <thead>
            <tr>
                <th lay-data="{field:'sid', width:200, sort: true, fixed: true,align: 'center'}">ID</th>
                <th lay-data="{field:'name', width:200,align: 'center'}">成员名</th>
                <th lay-data="{field:'consumption', width:200, sort: true,align: 'center'}">已使用额度</th>
                <th lay-data="{field:'amount', width:200,align: 'center'}">设定额度</th>
                <th lay-data="{field:'startDate', width:220,align: 'center'}">起始日期</th>
                <th lay-data="{field:'endDate', width:220, sort: true,align: 'center'}">结束日期</th>
                <th lay-data="{fixed: 'right', width:220, align:'center', toolbar: '#barDemo'}">操作</th>
            </tr>
            </thead>
        </table>

        <!-- -------------END：编写的HTML代码不超过这-------------- -->
    </div>
    <!-- 内容主体区域结束 -->
    <!-- 底部固定区域 -->
    <div class="layui-footer">
        家庭理财管理系统
    </div>
    <!-- END:底部固定区域 -->
</div>
<!-- 导入代码库文件 -->
<jsp:include page="include/jser.jsp"/>
<!-- END:代码库导入 -->
<!-- -------------在这里编写页面的js代码------------- -->
<script type="text/html" id="barDemo">
    <!--<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>-->
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.on('tool(demo)', function(obj){
            var data = obj.data;

            if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }else if(obj.event === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    util.httpRequest.post("delete", {
                        "sid": data.sid
                    }, function (msg) {//向服务端发送删除指令
                      if (msg.code === 200) {
                          layer.msg(msg.info, {
                              offset: '100px'
                              , icon: 1
                              , time: 2000
                           });
                              // function () {
                          //     location.reload();
                          // });
                          obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                          // layer.close(index);
                          location.reload();
                      }
                  });
                });
            }
        });
    });
    

    $("#add").click(function () {
        $(window).attr('location', '../limit/page');
    });
</script>
<!-- -------------END:在这里编写页面的js代码------------- -->
</body>
</html>