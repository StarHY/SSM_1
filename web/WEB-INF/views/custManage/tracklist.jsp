<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/11
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>跟踪回访管理</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/bootstrap-table.css">
    <link rel="stylesheet" href="/static/css/select2.min.css">
    <link rel="stylesheet" href="/static/css/sweetalert.css">
    <link rel="stylesheet" href="/static/css/table/table.css">
    <link rel="stylesheet" href="/static/js/plugins/layui/css/layui.css" media="all">
</head>
<body>
<%@include file="../backstage/contextmenu.jsp" %>

<div class="container">
    <div class="panel-body" style="padding-bottom:0px;">
        <!--show-refresh, show-toggle的样式可以在bootstrap-table.js的948行修改-->
        <!-- table里的所有属性在bootstrap-table.js的240行-->
        <table id="table">
            <thead>
            <tr>
                <th data-checkbox="true"></th>
                <th data-field="admin.userName">回访人</th>
                <th data-field="trackContent">回访问题</th>
                <th data-field="serviceEvaluate">本次服务评价</th>
                <th data-field="user.userName">跟踪回访用户</th>
                <th data-field="trackCreatedTime" data-formatter="formatterDate">跟踪回访创建时间</th>
            </tr>
            </thead>
        </table>
        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-default" onclick="showAdd();">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default" onclick="showEdit();">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <div class="input-group" style="width:350px;float:left;padding:0;margin:0 0 0 -1px;">
                <div class="input-group-btn">
                    <button type="button" id="ulButton" class="btn btn-default" style="border-radius:0px;"
                            data-toggle="dropdown">回访人<span class="caret"></span></button>
                    <ul class="dropdown-menu pull-right">
                        <li><a onclick="onclikLi(this)">回访人</a></li>
                        <li class="divider"></li>
                        <li><a onclick="onclikLi(this)">回访问题</a></li>
                        <li class="divider"></li>
                        <li><a onclick="onclikLi(this)">本次服务评价</a></li>
                        <li class="divider"></li>
                        <li><a onclick="onclikLi(this)">跟踪回访用户</a></li>
                    </ul>
                </div><!-- /btn-group -->
                <input id="ulInput" class="form-control" onkeypress="if(event.keyCode==13) {blurredQuery();}">
                <a href="javascript:;" onclick="blurredQuery()"><span
                        class="glyphicon glyphicon-search search-style"></span></a>
                </input>
            </div><!-- /input-group -->
        </div>
    </div>
</div>

<!-- 添加弹窗 -->
<div class="modal fade" id="addWindow" aria-hidden="true" style="overflow:auto; ">
    <div class="modal-dialog" style="width: 750px;height: auto;">
        <div class="modal-content" style="overflow:hidden;">
            <form class="form-horizontal" id="addForm" method="post">
                <div class="modal-header" style="overflow:auto;">
                    <h4>请填写跟踪回访管理信息</h4>
                </div>
                <br/>
                <div class="form-group">
                    <label class="col-sm-3 control-label">回访人：</label>
                    <div class="col-sm-7">
                        <select id="addAdminName" name="userId" class="form-control js-data-example-ajax admin"
                                style="width:100%">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">回访问题：</label>
                    <div class="col-sm-7">
                        <textarea type="text" name="trackContent" placeholder="请输入回访问题内容" style="height: 100px;"
                                  class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">跟踪回访创建时间：</label>
                    <div class="col-sm-7">
                        <input id="start" name="trackCreatedTime" readonly class="layui-input" />
                        <%--onclick="layui.laydate({elem: this, min: laydate.now(), format: 'yyyy-MM-dd hh:mm:ss', max: '2099-06-16 23:59:59'})"--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">本次服务评价：</label>
                    <div class="col-sm-7">
                        <input type="text" name="serviceEvaluate" placeholder="请输入本次服务评价（1-10分）" class="form-control"></input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">跟踪回访用户：</label>
                    <div class="col-sm-7">
                        <select id="addUserName" name="trackUser" class="form-control js-data-example-ajax user"
                                style="width:100%">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-8">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                        <button id="addButton" class="btn btn-sm btn-success" type="button" onclick="addSubmit()">保 存</button>
                    </div>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 修改弹窗 -->
<div class="modal fade" id="editWindow" aria-hidden="true">
    <div class="modal-dialog" style="width: 750px;height: auto;">
        <div class="modal-content">
            <form class="form-horizontal" id="editForm" method="post">
                <input type="hidden" name="trackId" define="TrackList.trackId" />
                <div class="modal-header" style="overflow:auto;">
                    <h4>请修改跟踪回访管理信息</h4>
                </div>
                <br/>
                <div class="form-group">
                    <label class="col-sm-3 control-label">回访人：</label>
                    <div class="col-sm-7">
                        <select id="editAdminName" name="userId" class="form-control js-data-example-ajax admin"
                                style="width:100%">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">回访问题：</label>
                    <div class="col-sm-7">
                        <textarea type="text" name="trackContent" define="TrackList.trackContent"
                                  placeholder="请输入回访问题内容" style="height: 100px;"
                                  class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">跟踪回访创建时间：</label>
                    <div class="col-sm-7">
                        <input id="editStart" name="trackCreatedTime" readonly define="TrackList.trackCreatedTime" class="layui-input">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">本次服务评价：</label>
                    <div class="col-sm-7">
                        <input type="text" name="serviceEvaluate" define="TrackList.serviceEvaluate" placeholder="请输入本次服务评价（1-10分）" class="form-control"></input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">跟踪回访用户：</label>
                    <div class="col-sm-7">
                        <select id="editUserName" name="trackUser" class="form-control js-data-example-ajax user"
                                style="width:100%">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-8">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                        <button id="editButton" class="btn btn-sm btn-success" type="button" onclick="editSubmit()">保 存</button>
                    </div>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/bootstrap-table/bootstrap-table.js"></script>
<script src="/static/js/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script src="/static/js/jquery.formFill.js"></script>
<script src="/static/js/select2/select2.js"></script>
<script src="/static/js/sweetalert/sweetalert.min.js"></script>
<script src="/static/js/contextmenu.js"></script>
<script src="/static/js/backstage/custManage/tracklist.js"></script>
<script src="/static/js/bootstrap-validate/bootstrapValidator.js"></script>
<script src="/static/js/plugins/layui/layui.js" charset="utf-8"></script>
<script src="/static/js/backstage/main.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        var start = {
            format: 'yyyy-MM-dd hh:mm:ss',
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-12-30 23:59:59', //最大日期
            istime: true,
            istoday: false,
            festival: true
        };

        document.getElementById('start').onclick = function () {
            start.elem = this;
            laydate(start);
        }

        var editStart = {
            format: 'yyyy-MM-dd hh:mm:ss',
            max: '2099-12-30 23:59:59', //最大日期
            istime: true,
            istoday: false,
            festival: true
        };

        document.getElementById('editStart').onclick = function () {
            editStart.elem = this;
            laydate(editStart);
        }
    });
</script>
</body>
</html>
