<%@page pageEncoding="UTF-8" contentType="text/html; UTF_8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!--引入BootStrap的css样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <!--引入BootStrap与JQGRID整合的css样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot-jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <!--引入jquery的js文件-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.3.1.min.js"></script>
    <!--引入bootstrap的js文件-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <!--引入BootStrap与JQGRID整合的国际化文件-->
    <script src="${pageContext.request.contextPath}/boot-jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <!--引入BootStrap与JQGRID整合过后的js文件-->
    <script src="${pageContext.request.contextPath}/boot-jqgrid/js/trirand/jquery.jqGrid.min.js"></script>

    <script type="application/javascript">
        $(function () {
            $("#table").jqGrid({
                styleUI:"Bootstrap",
                url:"${pageContext.request.contextPath}/supplier/select",
                datatype:"json",
                autowidth:true,
                pager:"#pager",
                rowNum:"3",
                rowList:["3","6","9"],
                viewrecords:true,
                editurl:"${pageContext.request.contextPath}/supplier/edit",
                colNames:["供应商ID","供应商名称","负责人","联系电话","操作"],
                colModel:[
                    {name:"id"},
                    {name:"name",editable:true},
                    {name:"leader",editable:true},
                    {name:"phone",editable:true},
                    {name:"option",formatter:function(cellvalue, options, rowObject){
                            return  "<a class='btn btn-primary' onclick=\"del('"+rowObject.id+"')\">删除</a>&nbsp;&nbsp;<a class='btn btn-danger' onclick=\"update('"+rowObject.id+"')\">修改</a>";
                        }}
                ]
            });

            //给对应的按钮添加单击事件
            //添加
            $("#add").click(function() {
                //给对应的目标JQGRID表格做添加操作
                $("#table").jqGrid('editGridRow', "new", {
                    height : 400,
                    reloadAfterSubmit : true  //添加过后是否进行刷新
                });
            });
        });
        function update(rowid) {
            //获取选中行的rowid
            if (rowid != null)
            //调用修改的方法
                $("#table").jqGrid('editGridRow', rowid, {
                    height : 400,
                    reloadAfterSubmit : true
                });
            else
                alert("请选中一行");
        }

        // function mohuchaxun(name,name2) {
        //     //获取选中行的rowid
        //     if (rowid != null)
        //     //调用修改的方法
        //         $("#table").jqGrid('editGridRow', rowid, {
        //             height : 400,
        //             reloadAfterSubmit : true
        //         });
        //     else
        //         alert("请选中一行");
        // }

        function del(rowid) {
            //改行的ID
            if (rowid != null)
                $("#table").jqGrid('delGridRow', rowid, {
                    reloadAfterSubmit: true
                });
            else
                alert("请选中一行");
        }
    </script>

</head>
<body>
<div class="panel-heading">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">仓库管理系统</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" class="glyphicon glyphicon-user">欢迎</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户名:${sessionScope.name} <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人资料</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/xiaohui">安全退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="row">
        <div class="panel-group col-md-2" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading" id="headingTwo">
                    <h4 class="panel-title">                         <!--保证面板之间可以进行对应的交互-->
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                            库存管理
                            <span class="caret pull-right"></span>
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">库存列表</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">库存类别</a></li>
                    </ul>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" id="headingThree">
                    <h4 class="panel-title">                         <!--保证面板之间可以进行对应的交互-->
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                            出入库管理<span class="caret pull-right"></span>
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">管理列表</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">添加列表</a></li>
                    </ul>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" id="headingFour">
                    <h4 class="panel-title">                         <!--保证面板之间可以进行对应的交互-->
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                            人员管理<span class="caret pull-right"></span>
                        </a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse">
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">人员列表</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">添加人员</a></li>
                    </ul>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" id="headingFive">
                    <h4 class="panel-title">                         <!--保证面板之间可以进行对应的交互-->
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                            基础数据<span class="caret pull-right"></span>
                        </a>
                    </h4>
                </div>
                <div id="collapseFive" class="panel-collapse collapse">
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">供应商信息管理</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">客户信息管理</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">货物信息管理</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">仓库信息管理</a></li>
                    </ul>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" id="headingSix">
                    <h4 class="panel-title">                         <!--保证面板之间可以进行对应的交互-->
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                            系统维护<span class="caret pull-right"></span>
                        </a>
                    </h4>
                </div>
                <div id="collapseSix" class="panel-collapse collapse">
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">人员列表</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-justified">
                        <!--可选项-->
                        <li><a href="#">添加人员</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">供应商信息管理</div>
                <div class="panel-body">
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <select class="form-control" id="status1" name="name">
                                <option value="suoyou">所有</option>
                                <option value="name">名称</option>
                                <option value="leader">负责人</option>
                                <option value="phone">电话</option>
                            </select>
                            <input type="text" class="form-control" placeholder="搜索" name="name2">
                        </div>
                        <button type="submit" class="btn btn-default btn-success">搜索</button>
                    </form>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button id="add" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span>添加供应商</button>
                <br/><br/>
                <table id="table"></table>
                <div id="pager"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>