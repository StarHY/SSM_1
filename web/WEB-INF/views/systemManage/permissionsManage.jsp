<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <title>权限管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/bootstrap-table.css">
    <link rel="stylesheet" href="/static/css/select2.min.css">
    <link rel="stylesheet" href="/static/css/sweetalert.css">
    <link rel="stylesheet" href="/static/css/table/table.css">
</head>
<style>
    .coldStatus {
        color: #999
    }
    .coldStatus .glyphicon-

</style>
<body>
<%@include file="../backstage/contextmenu.jsp"%>

<div class="container">
    <div class="panel-body" style="padding-bottom:0px;"  >
        <!--show-refresh, show-toggle的样式可以在bootstrap-table.js的948行修改-->
        <!-- table里的所有属性在bootstrap-table.js的240行-->
        <table id="table"
               data-toggle="table"
               data-toolbar="#toolbar"
               data-method="get"
               data-query-params="queryParams"
               data-pagination="true"
               data-search="true"
               data-show-refresh="true"
               data-show-toggle="true"
               data-show-columns="true"
               data-page-size="10"
               data-height="543"
               data-id-field="id"
               data-page-list="[5, 10, 20]"
               data-cach="false"
               data-click-to-select="true"
               data-single-select="true"
               data-row-style= rowstyle
        >
            <thead>
            <tr>
                <th data-radio="true" data-field="status"></th>
                <th  data-field="permissionName">权限名称</th>
                <th data-field="permissionZhname">权限中文名称</th>
                <th  data-field="permissionDes">权限描述</th>
                <th data-field="permissionStatus" data-formatter=formatterstatus>权限状态</th>
                <th data-field="module" data-formatter=formatterfun>权限所属模块</th>
                <th data-field="todoCell"  data-formatter=todoCell data-events=operateEvents>操作</th>
            </tr>
            </thead>
        </table>
        <div id="toolbar" class="btn-group">
            <button id="btn_available" type="button" class="btn btn-default" onclick="showAvailable();">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>可用权限
            </button>
            <button id="btn_disable" type="button" class="btn btn-default" onclick="showDisable();">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>禁用权限
            </button>
            <button id="btn_add" type="button" class="btn btn-default" onclick="showAdd();">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default" onclick="showEdit();">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default" onclick="showDel();">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
        </div>
    </div>
</div>

<!-- 添加弹窗 -->
<div class="modal fade" id="add" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <hr/>
            <form id="addForm" class="form-horizontal" method="post">
                <input type="reset" name="reset" style="display: none;"/>
                <div class="modal-header" style="overflow:auto;">
                    <p>添加权限</p>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">权限名称：</label>
                    <div class="col-sm-7">
                        <input type="text" name="permissionName" define="emp.name" class="form-control" maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">权限中文名称：</label>
                    <div class="col-sm-7">
                        <input type="text" name="permissionZhname" define="emp.name" class="form-control" maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">权限描述：</label>
                    <div class="col-sm-7">
                        <input type="text" name="permissionDes" define="emp.name" class="form-control" maxlength="500">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">权限所属模块：</label>
                    <div class="col-sm-7">
                        <%--<input type="text" name="modulePermission" define="emp.name" class="form-control" maxlength="500">--%>
                        <select id="addSelect" name="module.moduleId"  class="js-example-basic-multiple form-control"  style="width:300px;"></select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button id="addButton" type="submit" class="btn btn-primary btn-sm">保存</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 修改弹窗 -->
<div class="modal fade" id="edit" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <hr/>
            <form id="editForm" class="form-horizontal" method="post">
                <input type="reset" name="reset" style="display: none;"/>
                <input type="text" name="permissionId" define="permission.permissionId" style="display:none">
                <div class="modal-header" style="overflow:auto;">
                    <p>修改权限</p>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">权限名称：</label>
                    <div class="col-sm-7">
                        <input type="text" name="permissionName" define="permission.permissionName" class="form-control" maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">权限中文名称：</label>
                    <div class="col-sm-7">
                        <input type="text" name="permissionZhname" define="permission.permissionZhname" class="form-control" maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">权限描述：</label>
                    <div class="col-sm-7">
                        <input type="text" name="permissionDes" define="permission.permissionDes" class="form-control" maxlength="500">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button id="editButton" type="submit" class="btn btn-primary btn-sm">保存</button>
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
<script src="/static/js/form/jquery.validate.js"></script>
<script src="/static/js/backstage/systemManage/permissionsManage.js"></script>
<script src="/static/js/backstage/main.js"></script>
</body>
<script>
    $(function(){
        todoCellEvent();
        initSelect("#addSelect", "/module/queryAll" ,"moduleId", "moduleName");
    })

    function initSelect(selectId, url, name, value){
        $.get(url, function (data) {
            $(selectId).empty();//清空下拉框
            $.each(data, function (i, item) {
                $("#addSelect").append("<option value='" + data[i][name] + "'>&nbsp;" + data[i][value]+ "</option>");
            });
        })
    }

    function todoCell(element, row ,index){
        var statusIconClass =  row.permissionStatus === 'Y'? '': '';

        var viewbtn = '<div style="color:#428bca">' +
                '<a class="edit"  href="javascript:void(0)"><i class="glyphicon glyphicon-edit" ></i></a>' +
                '&nbsp;&nbsp;&nbsp;'+
                '<a class="updstatus" href="javascript:void(0)"><i class="glyphicon glyphicon-remove" ></i></a>' +
                '</div> ';
        return viewbtn;
    }

    function todoCellEvent(){
        window.operateEvents = {
            'click .edit': function (e, value, row, index) {
                var permission = row;
                $("#edit").modal('show'); // 显示弹窗
                $("#editForm").fill(permission);
            },
            'click .updstatus': function (e, value, row, index) {
                $("#table").bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
                var msg;
                var coldMsg = "您确定要禁用此权限吗";
                var returnMsg = "您确定要启用此权限吗";
                var sucMsg;
                if(row.permissionStatus === 'Y' ){
                    msg = coldMsg;
                    sucMsg = "禁用成功";
                }else {
                    msg=returnMsg;
                    sucMsg="启用成功";
                }

                swal(
                        {title:"",
                            text:msg,
                            type:"warning",
                            showCancelButton:true,
                            confirmButtonColor:"#DD6B55",
                            confirmButtonText:"我确定",
                            cancelButtonText:"再考虑一下",
                            closeOnConfirm:false,
                            closeOnCancel:false
                        },
                        function(isConfirm){
                            if(isConfirm)
                            {
                                swal({title:"",
                                    text:sucMsg,
                                    type:"success",
                                    confirmButtonText:"确认",
                                },function(){
                                    $.get("/permission/updateStatus?id="+ row.permissionId+"&curstatus="+row.permissionStatus,function(data) {
                                        console.log("remove success");
                                        var s;
                                        row.permissionStatus === 'Y'? s='N': s='Y';
                                        row.permissionStatus = s;
                                        $("#table").bootstrapTable("updateRow",{
                                            index: index,
                                            row: row
                                        });
                                    })
                                })
                            }
                            else{
                                swal({title:"",
                                    text:"已取消",
                                    confirmButtonText:"确认",
                                    type:"error"})
                            }
                        })
            }
        };
    }

    function rowstyle(row, index){
        if(row.permissionStatus === 'N'){
            return  {
                classes: 'coldStatus',
                css: {}
            };
        }
        return {
            classes: ''
        }
    }

    function formatterfun(element, row ,index){
        return element!=null? element.moduleName: "<p style='color:#999'>暂无模块</p>";
    }

    function formatterstatus(element, row, index) {
        return element=== 'Y'? '<p>可用</p>':
                '<p>不可用</p>'
    }




</script>
</html>
