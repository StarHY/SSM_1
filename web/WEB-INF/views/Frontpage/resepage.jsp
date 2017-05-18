<%--
  Created by IntelliJ IDEA.
  User: 不曾有黑夜
  Date: 2017/4/28
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预约页面</title>
</head>
<link rel="stylesheet" href="/static/css/bootstrap.css">
<link rel="stylesheet" href="/static/css/animate.css">
<link rel="stylesheet" href="/static/css/TopBtm.css">
<link rel="stylesheet" href="/static/css/resepages.css">
<link rel="stylesheet" href="/static/css/select2.min.css">
<link rel="stylesheet" href="/static/css/bootstrap-table.css">
<link rel="stylesheet" href="/static/css/select2.min.css">
<link rel="stylesheet" href="/static/css/sweetalert.css">
<link rel="stylesheet" href="/static/css/table/table.css">
<link rel="stylesheet" href="/static/css/bootstrap-switch/bootstrap-switch.min.css">
<link rel="stylesheet" href="/static/css/bootstrap-validate/bootstrapValidator.min.css">
<link rel="stylesheet" href="/static/css/bootstrap-dateTimePicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet/less" href="/static/css/bootstrap-dateTimePicker/datetimepicker.less">
<body>
    <%--预约页面--%>
    <div class="main">
        <%--导航栏--%>
        <div class="nav nav-first">
            <ul class="nav-left-ul">
                <c:choose>
                    <c:when test="${sessionScope.frontUser != null}">
                        <c:if test="${sessionScope.frontUser.userName != null}">
                            <li id="placelogin">欢迎您，${sessionScope.frontUser.userName}</li>
                            <a href="userpage" class="right-ul"><li>我的中心</li></a>
                            <a href="outusers"><li>退出</li></a>
                            <div class="clearfix"></div>
                        </c:if>
                        <c:if test="${sessionScope.frontUser.userName == null}">
                            <li id="placelogin">欢迎您，${sessionScope.frontUser.userPhone}</li>
                            <a href="userpage" class="right-ul"><li>我的中心</li></a>
                            <a href="outusers"><li>退出</li></a>
                            <div class="clearfix"></div>
                        </c:if>
                    </c:when>

                    <c:otherwise>
                        <li id="placelogin">欢迎您，请登录</li>
                        <a href="reg" id="loginreg"><li>登录/注册</li></a>
                        <a href="javaScript:;" class="right-ul"><li>我的中心</li></a>
                        <div class="clearfix"></div>
                    </c:otherwise>
                </c:choose>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="nav nav-two" id="navbar-two">
            <ul class="nav-two-ul">
                <a href="home"><li>首页</li></a>
                <a href="factorypage"><li>商家</li></a>
                <a href="resepage"><li class="actives">预约</li></a>
                <a href="javaScript:;"><li>配件商城</li></a>
                <a href="javaScript:;"><li>保养项目</li></a>
            </ul>
        </div>
        <%--主内容区--%>
        <div class="content">
            <div class="form-box">
                <div class="form-box2 wow fadeInLeft animated">
                    <div class="body-form1">
                        <div class="form-content">
                            <form role="form" class="form-horizontal" id="addForm">
                                <input id="addUserId" type="hidden" name="userId"/>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" style="width: auto;">保养&nbsp;|&nbsp;维修：</label>
                                    <div class="col-sm-7">
                                        <select  class="js-example-tags form-control" name="maintainOrFix">
                                            <option value="保养">保养</option>
                                            <option value="维修">维修</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">车主姓名：</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="addUserName" value="${sessionScope.frontUser.userName}" placeholder="请输入车主姓名" name="userName" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">车主电话：</label>
                                    <div class="col-sm-7">
                                        <input type="number" id="addUserPhone" value="${sessionScope.frontUser.userPhone}" placeholder="请输入车主电话" name="userPhone" class="form-control" style="width:100%"/>
                                    </div>
                                </div>
                                <div id="addCompanyBox" class="form-group">
                                    <label class="col-sm-3 control-label">选择公司：</label>
                                    <div class="col-sm-7">
                                        <select   id="addCompany"class="js-example-tags company" name="companyId" style="width:100%">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">汽车品牌：</label>
                                    <div class="col-sm-7">
                                        <select  id="addCarBrand" class="js-example-tags carBrand" name="brandId" style="width:100%">
                                        </select>
                                    </div>
                                </div>
                                <div id="addModelDiv" style="display: none" class="form-group">
                                    <label class="col-sm-3 control-label">汽车车型：</label>
                                    <div class="col-sm-7">
                                        <select   id="addCarModel"class="js-example-tags carModel" name="modelId" style="width:100%">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">汽车颜色：</label>
                                    <div class="col-sm-7">
                                        <select  id="addCarColor" class="js-example-tags carColor" name="colorId" style="width:100%">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">汽车车牌：</label>
                                    <div class="col-sm-7">
                                        <select  id="addCarPlate" class="js-example-tags carPlate" name="plateId" style="width:100%">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">车牌号码：</label>
                                    <div class="col-sm-7">
                                        <input  type="number" name="carPlate" placeholder="请输入车牌号码" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">到店时间：</label>
                                    <div class="col-sm-7">
                                        <input id="addArriveTime" placeholder="请选择到店时间" onclick="getDate('addArriveTime')"
                                               readonly="true" type="text" name="arriveTime"
                                               class="form-control datetimepicker"/>
                                    </div>
                                </div>
                                <div class="modal-footer">

                                    <button id="addButton" style="width: 200px;" type="button" onclick="addSubmit()" class="btn btn-success">添加
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="form-wechat">
                    <div class="wechat-right" id="wechat-right">
                        <div class="erm-img  wow fadeInLeft animated">
                            <img src="/static/img/Frontpage/2wei.jpg"/>
                        </div>
                        <span style="font-size: 16px;padding-left:8px;float:left;color: white;">扫描二维码，微信预约，方便快捷</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <%--底部--%>
        <div class="t-bottom">
            <span style="font-size:19px;">© 2011-2016 赣州宏图预科班 版权所有 ｜ 赣ICP备11018683-3</span>
        </div>
    </div>

</body>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/jquery.cxselect.min.js"></script>
<script src="/static/js/wow.js"></script>
<script src="/static/js/rese.js"></script>
<script src="/static/js/jquery.formFill.js"></script>
<script src="/static/js/select2/select2.js"></script>
<script src="/static/js/sweetalert/sweetalert.min.js"></script>
<script src="/static/js/bootstrap-select/bootstrap-select.js"></script>
<script src="/static/js/bootstrap-dateTimePicker/bootstrap-datetimepicker.min.js"></script>
<script src="/static/js/bootstrap-dateTimePicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="/static/js/backstage/main.js"></script>
<script src="/static/js/bootstrap-switch/bootstrap-switch.js"></script>
<script src="/static/js/bootstrap-validate/bootstrapValidator.js"></script>
<script>

    function addApp() {
        $.post("/addApp",$("#form1").serialize(),function (data) {
            if(data.result=="success"){
                alert(data.message);
            }else{
                alert(data.message)
            }
        })
    }
    $(function () {
        validator('addForm'); // 初始化验证
        initSelect2("company", "请选择公司", "/company/queryAllCompany");
        initSelect2("carBrand", "请选择品牌", "/carBrand/queryAllCarBrand");
        initSelect2("carColor", "请选择颜色", "/carColor/queryAllCarColor");
        initSelect2("carPlate", "请选择车牌", "/carPlate/queryAllCarPlate");
    })

    function validator(formId) {
        $('#' + formId).bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                userName: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 6,
                            message: '用户名长度必须在1到6位之间'
                        }
                    }
                },
                userPhone: {
                    message: '用户手机号失败',
                    validators: {
                        notEmpty: {
                            message: '用户手机号码不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '手机号码必须为11位'
                        },
                        regexp: {
                            regexp: /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
                            message: '请输入正确的手机号'
                        }
                    }
                },
                companyId: {
                    message: '选择公司验证失败',
                    validators: {
                        notEmpty: {
                            message: '公司不能为空'
                        }
                    }
                },
                brandId: {
                    message: '汽车品牌验证失败',
                    validators: {
                        notEmpty: {
                            message: '汽车品牌不能为空'
                        }
                    }
                },
                colorId: {
                    message: '汽车颜色验证失败',
                    validators: {
                        notEmpty: {
                            message: '汽车颜色不能为空'
                        }
                    }
                },
                modelId: {
                    message: '汽车车型验证失败',
                    validators: {
                        notEmpty: {
                            message: '汽车车型不能为空'
                        }
                    }
                },
                carPlate: {
                    message: '车牌号码验证失败',
                    validators: {
                        notEmpty: {
                            message: '车牌号码不能为空'
                        }, stringLength: {
                            min: 6,
                            max: 6,
                            message: '车牌号码必须为6位'
                        },
                    }
                },
                plateId: {
                    message: '汽车车牌验证失败',
                    validators: {
                        notEmpty: {
                            message: '车牌不能为空'
                        }
                    }
                },
                arriveTime: {
                    message: '到店时间验证失败',
                    validators: {
                        notEmpty: {
                            message: '到店时间不能为空'
                        }
                    }
                }
            }
        })
                .on('success.form.bv', function (e) {
                    if (formId == "addForm") {
                        formSubmit("/appointment/add", formId);

                    }
                })
    }
    function addSubmit(){

        $("#addForm").data('bootstrapValidator').validate();
        if ($("#addForm").data('bootstrapValidator').isValid()) {
            $("#addButton").attr("disabled","disabled");
        } else {
            $("#addButton").removeAttr("disabled");
        }
    }

    function formSubmit(url, formId){
        $.post(url,
                $("#" + formId).serialize(),
                function (data) {
                    if (data.result == "success") {
                        alert("添加成功！");
                    } else if (data.result == "fail" ) {
                        alert("添加失败");
                    }
                }, "json");
    }
</script>
</html>
