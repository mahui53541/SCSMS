<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">   
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>   
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>成绩查询</title>
<script>
$(function(){
	 $('#transcript').datagrid({    
		    url:'${pageContext.request.contextPath}/queryTranscript',  
		    fitColumns:true,	//自动适应列
           	fit:true,			//表格宽高自适应
            nowrap:false,
            striped:true,		//斑马线效果
			singleSelect:true,	//单行选中
            loadmsg:'请等待...',	//加载等待时显示
            height:100,
            /* toolbar:'#btn', */
		    columns:[[    
		        {field:'name',title:'课程名称',width:100,align:'center'},    
		        {field:'grade',title:'成绩',width:100,align:'center'} ,
		        {field:'time',title:'时间',width:100,align:'center'} ,
		        {field:'credits',title:'绩点',width:100,align:'center'} 
		    ]]
		}); 
	})
</script>
</head>
<body>
<table id="transcript"></table>
</body>
</html>