<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--引入BootStrap的css样式--%>
    <link href="/crud/static/bootstrap-3.4.1-dist/css/bootstrap.css" rel="stylesheet">
    <%--引入jquery样式--%>
    <script src="/crud/js/jquery.min.js"></script>
<%--引入BootStrap的js样式--%>
    <script src="/crud/static/bootstrap-3.4.1-dist/js/bootstrap.js" rel="script"></script>
</head>
<body>
<!-- 员工添加模块开始 -->
<div class="modal fade" tabindex="-1" role="dialog" id="empAddModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="form1">
                    <div class="form-group">
                        <label for="emp_add_name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10" id="empName">
                            <input type="text" class="form-control" id="emp_add_name" name="empName" placeholder="例如:张三">
                            <span id="empNameSpan" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_add_email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" id="email">
                            <input type="email" class="form-control" id="emp_add_email" name="email" placeholder="xxxx@xx.com">
                            <span id="emailSpan" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio1" value="男" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="女">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="select_dept" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<%--员工添加模块结束--%>
<!-- 编辑员工信息 -->
<div class="modal fade" tabindex="-1" role="dialog" id="empUpdateModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更新员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="form2">
                    <div class="form-group">
                        <label for="emp_add_name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10" id="empName1">
                            <input type="text" class="form-control" id="emp_add_name1" name="empName" placeholder="例如:张三">
                            <span id="empNameSpan1" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_add_email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" id="email1">
                            <input type="email" class="form-control" id="emp_add_email1" name="email" placeholder="xxxx@xx.com">
                            <span id="emailSpan1" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender"  value="女">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="update_dept" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" >保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<%--编辑员工信息模块结束--%>

<div class="container">
    <%--标题行--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-primary" id="btn_emp_add">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12" id="employee_list">
            <table class="table table-hover" >
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>departmentName</th>
                    <th>操作</th>
                </tr>
            </table>
        </div>
    </div>
    <%--分页条--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <div class="col-md-6" id="page_info_nav">

        </div>
    </div>
</div>
<script type="application/javascript">
    var totalPage=0;
    $(function (){
        to_page(1)
    })
    /*展示员工数据信息*/
    function build_page_employee(response){
        $("#employee_list table").empty()
        var EmployeeList=response.extend.pageInfo.list;
        $.each(EmployeeList,function (index,employee){
            var empIdTd=$("<td></td>").append(employee.empId)
            var empName=$("<td></td>").append(employee.empName)
            var email=$("<td></td>").append(employee.email)
            var gender=$("<td></td>").append(employee.gender)
            var deptName=$("<td></td>").append(employee.department.deptName)
            var pencilBtn= $("<button id='empUpdateButton'></button>").addClass("btn-primary btn-sm").append("<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>").append("编辑")
            var deleteBtn= $("<button></button>").addClass("btn-danger btn-sm").append("<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>").append("删除")
            var divBtn=$("<td></td>").append(pencilBtn).append(" ").append(deleteBtn)
            var empTr=$("<tr></tr>")
                .append(empIdTd)
                .append(empName).
                append(email).append(gender)
                .append(deptName)
                .append(divBtn)
                .appendTo($("#employee_list table"))
        })
    }

    /*显示分页信息*/
    function  build_page_info(response){
        $("#page_info_area").empty()
        $("#page_info_area").append("当前第"+response.extend.pageInfo.pageNum+"页，总共"+response.extend.pageInfo.pageSize+"条记录，一共有"+response.extend.pageInfo.total+"页")
    }
    /*显示分页条信息，点击分页进行跳转*/
    function  build_page_nav(response){
        /*获取最外层的容器*/
        var divNav=$("#page_info_nav")
        divNav.empty()
        /*获取nav标签*/
        var nav=$("<nav aria-label='Page navigation'></nav>")
        /*创建ul标签*/
        var ul=$("<ul></ul>").addClass("pagination")
        /*创建首页和前一页icon*/
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页")).attr("href","#")
        var preIcon=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(response.extend.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled")
            preIcon.addClass("disabled")
        }else{
            /*为首页添加单击事件，跳转页面*/
            firstPageLi.click(function(){
                to_page(1)
            })
        }
        /*为上一页添加单击事件*/
        preIcon.click(function (){
            var pageNo=response.extend.pageInfo.pageNum
            if(pageNo>1)
            to_page(pageNo-1)
        })
        /*添加到ul标签中*/
        ul.append(firstPageLi).append(preIcon)
        $.each(response.extend.pageInfo.navigatepageNums,function (index,item){
            var pageLi=$("<li></li>").append($("<a></a>").attr("href","#").append(item));
            if(item==response.extend.pageInfo.pageNum){
                 pageLi=pageLi.addClass("active");
            }
            ul.append(pageLi)
            pageLi.click(function (){
                to_page(item)
            })
        })
        var nextIcon=$("<li></li>").append($("<a></a>").append("&raquo;"))
        var lastPageLi=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"))
        /*为末页添加单击事件*/
        lastPageLi.click(function (){
            to_page(response.extend.pageInfo.pages)
        })
        /*为下一页添加单击事件*/
        nextIcon.click(function(){
            var pageNo=response.extend.pageInfo.pages;
            var currentPage=response.extend.pageInfo.pageNum;
            if(currentPage!=pageNo)
            to_page(currentPage+1)
        })

        ul.append(nextIcon)
        ul.append(lastPageLi);
        nav.append(ul)
        divNav.append(nav)
    }

    /*点击新增按钮触发事件*/
    $("#btn_emp_add").click(function (){
        //弹出对话框之前，动态的获取部门信息
        $.ajax({
            url:"/crud/emps",
            type:"POST",
            success:function (response){
                //添加信息到对话框上
                addEmployee(response,$("#select_dept"))
            }
        })
        //弹出对话框
        $('#empAddModal').modal({
            backdrop:'static'
        })
    })
    //点击编辑按钮触发事件
    $(document).on("click","#empUpdateButton",function (){
        $.ajax({
            url:"/crud/emps",
            type:"POST",
            success:function (response){
                //添加信息到对话框上
                addEmployee(response,$("#update_dept"))
            }
        })
        //弹出对话框
        $('#empUpdateModal').modal({
            backdrop:'static'
        })
        //回显数据
       var allTd=($("#empUpdateButton").parent().parent().children("td"))
       var allInput=$("#form2 input");
        var valuelist=new Array(6);
        //遍历给数组赋值
        $.each(allTd,function(index,item){
            console.log(index)
            //将td里面的员工信息封装到数组里面
            if(index>=1&&index<valuelist.length){
                valuelist[index]=$(item).text()
            }
        })
        console.log(valuelist)
        //将数组的值赋给Input标签上
        $.each(allInput,function(index,item){
            console.log(item.name)
            if(index<valuelist.length-1)
            $(item).val(valuelist[index+1])
        })
    })

    //添加信息到对话框上
    function addEmployee(response,useSelect){
        var select=useSelect
        select.empty()
        $.each(response.extend.department,function(index,item){
            $("<option></option>").attr("value",item.deptId).append(item.deptName).appendTo(select);
        })
    }

    /*发送ajax的分页请求*/
    function to_page(pageNo){
        $.ajax({
            url:"/crud/emps",
            data:"pageNo="+pageNo,
            type:"GET",
            success:function (response){
                totalPage=response.extend.pageInfo.pages;
                /*显示员工信息*/
                build_page_employee(response)
                /*显示分页信息*/
                build_page_info(response)
                /*显示分页条信息*/
                build_page_nav(response)
            }
        })
    }

    /*点击保存之前应该清空模态框的缓存数据和表单上次提交存在的状态*/
    $('#empAddModal').on('hidden.bs.modal', function (e) {
        $("#emp_add_name").parent().removeClass("has-success has-error")
        $("#emp_add_name").parent().removeAttr("status")
        $("#empNameSpan").text("")
        $("#emp_add_email").parent().removeClass("has-success has-error")
        $("#emp_add_email").parent().removeAttr("status")
        $("#emailSpan").text("")
        document.querySelector('#form1').reset();
    })

    //校验用户输入的表单数据是否正确
    function validate_add_form(){
       var empName=$("#emp_add_name").parent().attr("status")
        var email=$("#emp_add_email").parent().attr("status")
        //当用户名和密码都是success状态的时候才能提交表单
        if(empName=="success"&&email=="success"){
            return true;
        }
        return false;
    }
    $("#emp_add_name").change(function (){
        $("#emp_add_name").parent().removeClass("has-success has-error")
        //    拿到要校验的字段
        var empName=$("#emp_add_name").val();
        var isRepeatName=false;
        //前端检验用户名的时候，需要先确认后端用户名是否存在
        $.ajax({
            url:"/crud/findEmployeeName",
            data:"empName="+empName,
            method:"GET",
            async:false,
            success:function (response){
                if(response.code==200){
                    isRepeatName=true;
                }
            }
        })
        var regName=/(^[a-z0-9_-]{6,16}$)||(^[\u2E80-\u9FFF]+$){2,5}/
        if(!regName.test(empName)||isRepeatName){
            $("#emp_add_name").parent().addClass("has-error")
            if(isRepeatName){
                $("#empNameSpan").text("用户名已存在")
            }else{
                $("#empNameSpan").text("用户名不合法")
            }
            $("#emp_add_name").parent().attr("status","false")
            return;
        }
        $("#emp_add_name").parent().addClass("has-success")
        $("#empNameSpan").text("用户名合法")
        $("#emp_add_name").parent().attr("status","success")
    })
    $("#emp_add_email").change(function (){
        $("#emp_add_email").parent().removeClass("has-success has-error")
        var email=$("#emp_add_email").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regEmail.test(email)){
            $("#emp_add_email").parent().addClass("has-error")
            $("#emailSpan").text("邮箱不合法")
            $("#emp_add_email").parent().attr("status","false")
            return;
        }
        $("#emp_add_email").parent().addClass("has-success")
        $("#emailSpan").text("邮箱合法")
        $("#emp_add_email").parent().attr("status","success")
    })

    /*发送保存用户信息的ajax请求*/
    $("#emp_save").click(function(){
        //校验表单数据
        if(!validate_add_form()){
            return false;
        }
        //获取请求的参数
        var data=$("form").serialize()
        $.ajax({
            url:"/crud/addEmps",
            data:data,
            type:"POST",
            success:function (response){
               if(response.count==1){
                   alert("添加用户成功!")
               }
            }
        })
        //请求完成之后关闭模态框
        $('#empAddModal').modal('hide')
        //跳转到最后一页
        to_page(totalPage+1);
    })

</script>
</body>
</html>

