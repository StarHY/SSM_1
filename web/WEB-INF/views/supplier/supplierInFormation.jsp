<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>供应商管理</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/bootstrap-table.css">
    <link rel="stylesheet" href="/static/css/select2.min.css">
    <link rel="stylesheet" href="/static/css/sweetalert.css">
    <link rel="stylesheet" href="/static/css/table/table.css">
    <link rel="stylesheet" href="/static/css/bootstrap-validate/bootstrapValidator.min.css">
</head>
<body>
<%@include file="../backstage/contextmenu.jsp"%>

<div class="container">
    <div class="panel-body" style="padding-bottom:0px;"  >
        <table id="table">
            <thead>
            <tr>
                <th data-radio="true"></th>
                <th data-field="supplyName">
                    供应商名称
                </th>
                <th data-field="supplyTel">
                    供应商联系电话
                </th>
                <th data-field="supplyPricipal">
                    供应商负责人
                </th>
                <th data-field="supplyAddress">
                    供应商地址
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </th>
                <th data-field="supplyWeChat">
                    供应商微信号
                </th>
                <th data-field="supplyCreatedTime"data-formatter="formatterDateTime">
                    创建时间
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </th>
                <th data-field="supplyType.supplyTypeName">
                    供应商类型
                </th>
                <th data-field="company.companyName">
                    供应商所属公司
                </th>
                <th data-field="supplyStatus" data-formatter="statusFormatter">
                    记录状态
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </th>
            </tr>
            </thead>
        </table>
        <div id="toolbar" class="btn-group">
            <shiro:hasAnyRoles name="系统超级管理员,系统普通管理员,公司超级管理员,公司普通管理员">
                    <button id="btn_add" type="button" class="btn btn-default" onclick="showAdd();">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                    </button>
             </shiro:hasAnyRoles>
            <shiro:hasAnyRoles name="系统超级管理员,系统普通管理员,公司超级管理员,公司普通管理员">
                <button id="btn_edit" type="button" class="btn btn-default" onclick="showEdit();">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
            </shiro:hasAnyRoles>
            <shiro:hasAnyRoles name="系统超级管理员,系统普通管理员,公司超级管理员,公司普通管理员">
                <button id="searchDisable" type="button" class="btn btn-danger" onclick="searchDisableStatus();">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询禁用类型
                </button>
            </shiro:hasAnyRoles>
            <shiro:hasAnyRoles name="系统超级管理员,系统普通管理员,公司超级管理员,公司普通管理员">
                <button id="searchRapid" type="button" class="btn btn-success" onclick="searchRapidStatus();">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询激活类型
                </button>
            </shiro:hasAnyRoles>
            <shiro:hasAnyRoles name="系统超级管理员,系统普通管理员,公司超级管理员,公司普通管理员">
                <div class="input-group" style="width:300px;float:left;padding:0;margin:0 0 0 -1px;">
                    <div class="input-group-btn">
                        <button type="button" id="ulButton" class="btn btn-default" style="border-radius:0px;" data-toggle="dropdown">
                            供应商/供应商类型/所属公司
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu pull-right">
                            <li><a onclick="onclikLi(this)">供应商</a></li>
                            <li class="divider"></li>
                            <li><a onclick="onclikLi(this)">供应商类型</a></li>
                            <li class="divider"></li>
                            <li><a onclick="onclikLi(this)">所属公司</a></li>
                            <li class="divider"></li>
                            <li><a onclick="onclikLi(this)"></a></li>
                        </ul>
                    </div><!-- /btn-group -->
                    <input id="ulInput" class="form-control" onkeypress="if(event.keyCode==13) {blurredQuery();}">
                        <a href="javaScript:;" onclick="blurredQuery()"><span class="glyphicon glyphicon-search search-style"></span></a>
                    </input>
                </div><!-- /input-group -->
            </shiro:hasAnyRoles>
        </div>
    </div>
</div>

<!-- 添加弹窗 -->

<div id="addWindow" class="modal fade" style="overflow-y:scroll" data-backdrop="static" >
    <div class="modal-dialog">
        <div class="modal-content" >
            <span class="glyphicon glyphicon-remove closeModal" data-dismiss="modal"></span>
            <form role="form" class="form-horizontal" id="addForm">
                <div class="modal-header" style="overflow:auto;">
                    <h4>添加供应商信息</h4>
                </div>
                <div style="margin-left: auto;width:90%;margin-left:auto;margin-right:auto">
                    <div>
                        <div class="form-group col-md-6 pull-left" >
                            <label class="col-md-4 control-label">供应商名称：</label>
                            <div class="col-md-8">
                                <input id="addSupplyName" name="supplyName" type="text" placeholder="请输入供应商名称" class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">联系电话：</label>
                            <div class="col-md-8">
                                <input type="number" id="addSupplyTel" placeholder="请输入联系电话" name="supplyTel" class="form-control" style="width:100%"/>
                            </div>
                        </div>
                        <p class="clearfix"></p>
                    </div>
                    <div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商负责人：</label>
                            <div class="col-md-8">
                                <input type="text"  name="supplyPricipal" placeholder="请输入供应商负责人" class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商地址：</label>
                            <div class="col-md-8">
                                <input type="text" name="supplyAddress" placeholder="请输入供应商地址" class="form-control">
                            </div>
                        </div>
                        <p class="clearfix"></p>
                    </div>
                    <div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商微信号：</label>
                            <div class="col-md-8">
                                <input type="text"  name="supplyWeChat" placeholder="请输入供应商微信号" class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商类型：</label>
                            <div class="col-md-8">
                                <select id="addSupplyType" class="js-example-tags supplyType" name="supplyTypeId" style="width:100%"></select>
                            </div>
                        </div>
                        <p class="clearfix"></p>
                    </div>
                    <div>
                        <%--<div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商所属公司：</label>
                            <div class="col-md-8">
                                <select id="addCompany" class="js-example-tags company" name="companyId" style="width:100%">
                            </select>
                            </div>
                        </div>--%>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">支付宝账号：</label>
                            <div class="col-md-8">
                                <input type="number"  name="supplyAlipay" placeholder="请输入支付宝账号" class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">银行卡全称：</label>
                            <div class="col-md-8">
                                <input type="text" placeholder="请输入银行卡全称" name="supplyBank" class="form-control">
                            </div>
                        </div>
                       <p class="clearfix"></p>
                    </div>
                    <div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">持卡人姓名：</label>
                            <div class="col-md-8">
                                <input type="text" placeholder="请输入持卡人姓名"  name="supplyBankAccount"   class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">银行卡卡号：</label>
                            <div class="col-md-8">
                                <input type="number" placeholder="请输入银行卡卡号" name="supplyBankNo"  class="form-control">
                            </div>
                        </div>
                    </div>
                    <p class="clearfix"></p>
                    <div class="modal-footer" >
                         <span id="addError"></span>
                         <button type="button" class="btn btn-default" data-dismiss="modal">关闭 </button>
                         <button id="addButton" type="button" onclick="addSubmit()" class="btn btn-success">添加</button>
                         <input type="reset" name="reset" style="display: none;"/>
                    </div>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 修改弹窗 -->
<div id="editWindow" class="modal fade" style="overflow-y:scroll" data-backdrop="static" >
    <div class="modal-dialog"  style="width:90%">
        <div class="modal-content">
            <span class="glyphicon glyphicon-remove closeModal" data-dismiss="modal"></span>
            <form role="form" class="form-horizontal" id="editForm">
                <input type="hidden" name="supplyId" define="supply.supplyId"/>
                <input type="hidden"name="supplyStatus" define="supply.supplyStatus">
                <div class="modal-header" style="overflow:auto;">
                    <h4>修改供应商信息</h4>
                </div>
                <div>
                    <div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商名称：</label>
                            <div class="col-md-8">
                                <input type="text" name="supplyName" define="supply.supplyName" placeholder="请输入供应商名称"  class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">联系电话：</label>
                            <div class="col-md-8">
                                <input type="number" define="supply.supplyTel" placeholder="请输入联系电话" name="supplyTel" class="form-control" style="width:100%"/>
                            </div>
                        </div>
                        <p class="clearfix"></p>
                    </div>
                    <div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商负责人：</label>
                            <div class="col-md-8">
                                <input type="text" define="supply.supplyPricipal"   name="supplyPricipal" class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商地址：</label>
                            <div class="col-md-8">
                                <input type="text" define="supply.supplyAddress" name="supplyAddress" class="form-control">
                            </div>
                        </div>
                        <p class="clearfix"></p>
                    </div>
                    <div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商微信号：</label>
                            <div class="col-md-8">
                                <input type="text" define="supply.supplyWeChat" name="supplyWeChat"  class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">供应商类型：</label>
                            <div class="col-md-8">
                                <select id="editSupplyType" class="js-example-tags supplyType" name="supplyTypeId" style="width:100%"></select>
                            </div>
                        </div>
                        <p class="clearfix"></p>
                    </div>
                    <div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">支付宝账号：</label>
                            <div class="col-md-8">
                                <input type="number" define="supply.supplyAlipay"  name="supplyAlipay"  class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">银行卡全称：</label>
                            <div class="col-md-8">
                                <input type="text" define="supply.supplyBank" name="supplyBank" class="form-control">
                            </div>
                        </div>
                        <p class="clearfix"></p>
                    </div>
                    <div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">持卡人姓名：</label>
                            <div class="col-md-8">
                                <input type="text" define="supply.supplyBankAccount"  name="supplyBankAccount"   class="form-control">
                            </div>
                        </div>
                        <div class="form-group col-md-6 pull-left">
                            <label class="col-md-4 control-label">银行卡卡号：</label>
                            <div class="col-md-8">
                                <input type="number" define="supply.supplyBankNo" name="supplyBankNo"  class="form-control">
                            </div>
                        </div>
                        <p class="clearfix"></p>
                    </div>
                    <p class="clearfix"></p>
                    <div class="modal-footer" >
                         <span id="editError"></span>
                         <button type="button" class="btn btn-default"data-dismiss="modal">关闭</button>
                         <button id="editButton" type="button" onclick="editSubmit()" class="btn btn-success">保存</button>
                     </div>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除弹窗 -->
<div class="modal fade" id="del" aria-hidden="true">
    <div class="modal-dialog" >
        <form action="/table/edit" method="post">
            <div class="modal-content">
                <input type="hidden" id="delNoticeId"/>
                <div class="modal-footer" style="text-align: center;">
                    <h2>确认删除吗?</h2>
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="sumbit" class="btn btn-primary" onclick="del()">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 提示弹窗 -->
<div class="modal fade" id="tanchuang" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                提示
            </div>
            <div class="modal-body">
                请先选择某一行
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
            </div>
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
<script src="/static/js/bootstrap-validate/bootstrapValidator.js"></script>
<script src="/static/js/backstage/main.js"></script>
<script src="/static/js/backstage/supplier/supplierInFormation.js"></script>
</body>
</html>