/*
$(function () {
    $('#table').bootstrapTable('hideColumn', 'id');

    $("#addSelect").select2({
            language: 'zh-CN'
        }
    );

});

function showEdit(){
    var row =  $('table').bootstrapTable('getSelections');
    if(row.length >0) {
//                $('#editId').val(row[0].id);
//                $('#editName').val(row[0].name);
//                $('#editPrice').val(row[0].price);
        $("#editWindow").modal('show'); // 显示弹窗
        var ceshi = row[0];
        $("#AppointForm").fill(ceshi);
    }else{
        //layer.msg("请先选择某一行", {time : 1500, icon : 2});
        swal({
            title:"",
            text:"请先选择一行数据",
            type:"warning"})// 提示窗口, 修改成功
    }
}


//领料确认
function showConfirm(){
    var row =  $('table').bootstrapTable('getSelections');
    if(row.length >0) {
//                $('#editId').val(row[0].id);
//                $('#editName').val(row[0].name);
//                $('#editPrice').val(row[0].price)
        $("#confirm").modal('show'); // 显示弹窗
    }else{
        //layer.msg("请先选择某一行", {time : 1500, icon : 2});
        swal({
            title:"",
            text:"请先选择一行数据",
            type:"warning"})// 提示窗口, 修改成功
    }
}

//退料申请
function showApplication(){
    var row =  $('table').bootstrapTable('getSelections');
    if(row.length >0) {
//                $('#editId').val(row[0].id);
//                $('#editName').val(row[0].name);
//                $('#editPrice').val(row[0].price)
        $("#application").modal('show'); // 显示弹窗
    }else{
        //layer.msg("请先选择某一行", {time : 1500, icon : 2});
        swal({
            title:"",
            text:"请先选择一行数据",
            type:"warning"})// 提示窗口, 修改成功
    }
}

//确认退料
function showRegress(){
    var row =  $('table').bootstrapTable('getSelections');
    if(row.length >0) {
//                $('#editId').val(row[0].id);
//                $('#editName').val(row[0].name);
//                $('#editPrice').val(row[0].price);
        $("#regress").modal('show'); // 显示弹窗
    }else{
        //layer.msg("请先选择某一行", {time : 1500, icon : 2});
        swal({
            title:"",
            text:"请先选择一行数据",
            type:"warning"})// 提示窗口, 修改成功
    }

}

function showAdd(){

    $("#addWindow").modal('show');
}

function formatRepo(repo){return repo.text}
function formatRepoSelection(repo){return repo.text}

function showDel(){
    var row =  $('table').bootstrapTable('getSelections');
    if(row.length >0) {
        $("#del").modal('show');
    }else{
        $("#tanchuang").modal('show');
    }
}

function checkAdd(){
    var id = $('#addId').val();
    var name = $('#addName').val();
    var price = $('#addPrice').val();
    var reslist=$("#addSelect").select2("data"); //获取多选的值
    //alert(reslist.length)
    if(id != "" && name != "" && price != ""){
        return true;
    }else{
        var error = document.getElementById("addError");
        error.innerHTML = "请输入正确的数据";
        return false;
    }
}



//前段验证
$(document).ready(function () {
    $("#showAddFormWar").validate({
        errorElement: 'span',
        errorClass: 'help-block',

        rules: {
            materialName: {
                required: true,
                minlength: 2
            },
            materielState: {
                required: true,
                minlength: 2
            },
            materielCount: {
                required: true,
                minlength:2
            },
            maintain: {
                required: true,
                minlength:2
            },
            materiel_Receive_Time: {
                required: true,
                date:true
            }
        },
        messages: {
            materialName: "请输入物料名称",
            materielState: "请输入物料说明",
            materielCount: "请输入物料数量",
            maintain:"请输入维修保养记录",
            materiel_Receive_Time:"请输入领料时间"
        },
        errorPlacement: function (error, element) {
            element.next().remove();
            element.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
            element.closest('.form-group').append(error);
        },
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error has-feedback');
        },
        success: function (label) {
            var el = label.closest('.form-group').find("input");
            el.next().remove();
            el.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
            label.closest('.form-group').removeClass('has-error').addClass("has-feedback has-success");
            label.remove();
        },
        submitHandler: function (form) {
            alert("submitted!");
        }
    })
    $("#showEditFormWar").validate({
        errorElement: 'span',
        errorClass: 'help-block',

        rules: {
            materialName: {
                required: true,
                minlength: 2
            },
            materielState: {
                required: true,
                minlength: 2
            },
            materielCount: {
                required: true,
                minlength:2
            },
            maintain: {
                required: true,
                minlength:2
            },
            materiel_Receive_Time: {
                required: true,
                date:true
            }
        },
        messages: {
            materialName: "请输入物料名称",
            materielState: "请输入物料说明",
            materielCount: "请输入物料数量",
            maintain:"请输入维修保养记录",
            materiel_Receive_Time:"请输入领料时间",
        },
        errorPlacement: function (error, element) {
            element.next().remove();
            element.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
            element.closest('.form-group').append(error);
        },
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error has-feedback');
        },
        success: function (label) {
            var el = label.closest('.form-group').find("input");
            el.next().remove();
            el.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
            label.closest('.form-group').removeClass('has-error').addClass("has-feedback has-success");
            label.remove();
        },
        submitHandler: function (form) {
            alert("submitted!");
        }
    })
});*/

$(function() {

    var roles = "系统超级管理员,系统普通管理员,公司超级管理员,公司普通管理员,汽车公司接待员,汽车公司总技师,汽车公司技师,汽车公司学徒,汽车公司销售人员,汽车公司财务人员,汽车公司采购人员,汽车公司库管人员,汽车公司人力资源管理部";
    $.post("/user/isLogin/"+roles, function (data) {
        if(data.result == 'success') {
            $("#addSelect").select2({ language: 'zh-CN'});
            initTable('recordTable', '/dispatching/noDispRecordByPager'); // 初始化表格
            $("#recordTable").bootstrapTable("hideColumn","workInfo")
            initSelect2("addemp", "请选择员工", "/dispatching/emps"); // 初始化select2, 第一个参数是class的名字, 第二个参数是select2的提示语, 第三个参数是select2的查询url
        } else if(data.result == 'notLogin'){
            swal({title:"",
                    text:data.message,
                    confirmButtonText:"确认",
                    type:"error"}
                ,function(isConfirm){
                    if(isConfirm){
                        top.location = "/user/loginPage";
                    }else{
                        top.location = "/user/loginPage";
                    }
                })
        } else if(data.result == 'notRole'){
            swal({title:"",
                text:data.message,
                confirmButtonText:"确认",
                type:"error"})
        }
    })
});


function initTable(tableId, url) {

    //先销毁表格
    $('#' + tableId).bootstrapTable('destroy');
    //初始化表格,动态从服务器加载数据
    $("#" + tableId).bootstrapTable({
        method: "get",  //使用get请求到服务器获取数据
        url: url, //获取数据的Servlet地址
        striped: false,  //表格显示条纹
        pagination: true, //启动分页
        pageSize: 10,  //每页显示的记录数
        pageNumber:1, //当前第几页
        pageList: [10, 15, 20, 25, 30],  //记录数可选列表
        showRefresh: true,  //显示刷新按钮
        strictSearch: true,
        clickToSelect: true,  //是否启用点击选中行
        uniqueId: "checkinId",                     //每一行的唯一标识，一般为主键列
        sortable: true,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        toolbar : "#toolbar",// 指定工具栏
        sidePagination: "server", //表示服务端请求

        //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
        //设置为limit可以获取limit, offset, search, sort, order
        queryParamsType : "undefined",
        queryParams: function queryParams(params) {   //设置查询参数
            var param = {
                pageNumber: params.pageNumber,
                pageSize: params.pageSize,
                orderNum : $("#orderNum").val()
            };
            return param;
        },
    });
}


function todoCell(element, row, index){
    var accInfo = '<a style="margin-right:30px;float:left;margin-bottom: 8px;"><span onclick = "showInfo(\''+ row.record.recordId +'\')" class="glyphicon glyphicon-list-alt"><span style="position: inherit;bottom: 2px;margin-left:5px;">查看明细</span></span></a>'
    var dispatcher = "";
    if(row.workInfo){
        dispatcher = '<a style="float:left"><span onclick = "showAppoint(\''+ row.record.recordId +'\')" class="glyphicon glyphicon-user"><span style="position: inherit;bottom: 2px;margin-left:5px;">重新指定</span></span></a>'
    } else {
        dispatcher = '<a style="float:left"><span onclick = "showAppoint(\''+ row.record.recordId +'\')" class="glyphicon glyphicon-user"><span style="position: inherit;bottom: 2px;margin-left:5px;">指定员工</span></span></a>'
    }
    return accInfo + dispatcher;
}

function showInfo(recordId){
    infoTableSet('accInfoTable', '/dispatching/recordDetails?recordId='+ recordId); // 初始化表格
    $("#accInfoTable").bootstrapTable({

    })
    $("#accsInfo").modal("show");


}

// 重写了
function showAppoint(recordId){
    $("#appointModal").modal('show'); // 显示弹窗
    var record = {recordId:recordId};
    $("#appointForm").fill(record);
}

function formatterUser(ele, row, index) {
    if(ele.user!= null){
        return ele.user.userName;
    }
    return "暂无指派";
}
//面板
function hasDispatcher(){
    initTable('recordTable', '/dispatching/dispRecordByPager'); // 初始化表格
    $("#recordTable").bootstrapTable("showColumn","workInfo")

}
function noDispatcher(){
    initTable('recordTable', '/dispatching/noDispRecordByPager'); // 初始化表格

    $("#recordTable").bootstrapTable("hideColumn","workInfo")
}

function infoFormatter(ele, row, index){
    var htmlTest = [];
    /*类型  名称 数量 预计天数*/
    var maintainFix = row.maintainFix;
    if(maintainFix){
        htmlTest.push("<div ><span class='col-md-4'>类型:</span>")
        htmlTest.push("<span class='col-md-6'>"+ maintainFix.maintainOrFix +"</span></div>")

        htmlTest.push("<div><span class='col-md-4'>名称:</span>")
        htmlTest.push("<span class='col-md-6'>"+ maintainFix.maintainName +"</span></div>")

        htmlTest.push("<div><span class='col-md-4'>工时费:</span>")
        htmlTest.push("<span class='col-md-6'>"+ maintainFix.maintainManHourFee +"</span></div>")

        htmlTest.push("<div><span class='col-md-4'>预计完成工时:</span>")
        htmlTest.push("<span class='col-md-6'>"+maintainFix.maintainHour +"</span></div>")

    }

    return htmlTest.join("");
}


function infoTableSet(tableId, url) {

    //先销毁表格
    $('#' + tableId).bootstrapTable('destroy');
    //初始化表格,动态从服务器加载数据
    $("#" + tableId).bootstrapTable({
        method: "get",  //使用get请求到服务器获取数据
        url: url, //获取数据的Servlet地址
        striped: false,  //表格显示条纹
        pagination: true, //启动分页
        pageSize: 10,  //每页显示的记录数
        pageNumber:1, //当前第几页
        pageList: [10, 15, 20, 25, 30],  //记录数可选列表
        strictSearch: true,
        clickToSelect: true,  //是否启用点击选中行
        uniqueId: "maintainDetailId",                     //每一行的唯一标识，一般为主键列
        sortable: true,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server", //表示服务端请求
        showHeader: false,
        //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
        //设置为limit可以获取limit, offset, search, sort, order
        queryParamsType : "undefined",
        queryParams: function queryParams(params) {   //设置查询参数
            var param = {
                pageNumber: params.pageNumber,
                pageSize: params.pageSize,
                orderNum : $("#orderNum").val()
            };
            return param;
        },
    });
}

function submitDispatcher() {
    $.post("/dispatching/insert",
        $("#appointForm").serialize(),
        function (data) {
            if (data.result == "success") {
                $("#appointModal").modal('hide'); // 关闭指定的窗口
                $('#recordTable').bootstrapTable("refresh"); // 重新加载指定数据网格数据
                swal({
                    title:"",
                    text: data.message,
                    type:"success"})// 提示窗口, 修改成功
            } else if (data.result == "fail") {
                swal({
                    title:"",
                    text: data.message,
                    type:"error"})
            }
        }, "json"
    );
}


/*//指派员工
function showAppoint(){
    var row =  $('table').bootstrapTable('getSelections');
    if(row.length >0) {
//                $('#editId').val(row[0].id);
//                $('#editName').val(row[0].name);
//                $('#editPrice').val(row[0].price);
        $("#appoint").modal('show'); // 显示弹窗
        var ceshi = row[0];
        $("#AppointForm").fill(ceshi);
    }else{
        //layer.msg("请先选择某一行", {time : 1500, icon : 2});
        swal({
            title:"",
            text:"请先选择一行数据",
            type:"warning"})// 提示窗口, 修改成功
    }
}*/

