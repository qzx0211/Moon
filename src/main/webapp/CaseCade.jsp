<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/9/15
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script>

        $(function () {

            $.ajax({
                url:"${pageContext.request.contextPath}/cascade/showProvince",
                type:"GET",
                dataType:"json",
                success:function (provinces) {
                    for (var i=0;i<provinces.length;i++){
                        var  option=$("<option value="+provinces[i].code+">"+provinces[i].name+"</option>");
                        $("#province").append(option);
                    }
                    $.ajax({
                        url:"${pageContext.request.contextPath}/cascade/showCitys",
                        type:"GET",
                        data:"provincecode="+110000,
                        dataType:"json",
                        success:function (citys) {
                            //每次添加新的城市之前先要清空
                            $("#city").empty();
                            for (var i=0;i<citys.length;i++){
                                var option=$("<option value="+citys[i].code+">"+citys[i].name+"</option>");
                                $("#city").append(option);
                            }

                            $.ajax({
                                url:"${pageContext.request.contextPath}/cascade/showAreas",
                                type:"GET",
                                data:"citycode="+110100,
                                dataType:"json",
                                success:function (areas) {
                                    $("#area").empty();
                                    for (var i=0;i<areas.length;i++){
                                        var  option=  $("<option>"+areas[i].name+"</option>");
                                        $("#area").append(option);
                                    }
                                }
                            });
                        }
                    });

                }
            });


            $("#province").change(function () {

                var provincecode=$("#province option:selected").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/cascade/showCitys",
                    type:"GET",
                    data:"provincecode="+provincecode,
                    dataType:"json",
                    success:function (citys) {

                        $("#city").empty();
                        for (var i=0;i<citys.length;i++){
                            var option=$("<option value="+citys[i].code+">"+citys[i].name+"</option>");
                            $("#city").append(option);
                        }

                        $.ajax({
                            url:"${pageContext.request.contextPath}/cascade/showAreas",
                            type:"GET",
                            data:"citycode="+citys[0].code,
                            dataType:"json",
                            success:function (areas) {
                                $("#area").empty();
                                for (var i=0;i<areas.length;i++){
                                    var  option=  $("<option>"+areas[i].name+"</option>");
                                    $("#area").append(option);
                                }
                            }
                        });
                    }
                });
            });

            $("#city").change(function () {

                var  citycode=$("#city option:selected").val();

                $.ajax({
                    url:"${pageContext.request.contextPath}/cascade/showAreas",
                    type:"GET",
                    data:"citycode="+citycode,
                    dataType:"json",
                    success:function (areas) {
                        $("#area").empty();
                        for (var i=0;i<areas.length;i++){
                            var  option=  $("<option>"+areas[i].name+"</option>");
                            $("#area").append(option);
                        }
                    }
                });
            })
        })
    </script>
</head>
<body>
    <select id="province">

    </select>
    <select id="city">

    </select>
    <select id="area">

    </select>
</body>
</html>
