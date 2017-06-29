<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>

	<script>
	function addTab(title,url){
		if ($('#tab').tabs('exists', title)){
			$('#tab').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tab').tabs('add',{
				title:title,
				content:content,
				closable:true
			});
		}
	}
	</script>
	
</head>
<body>
<div id="cc" class="easyui-layout" style="width:100%;height:900px;">   
    <div data-options="region:'north',split:true" style="height:150px;">
    	<div style="width:40%;margin-left:30%;float: left;text-align: center">
    		<p style="font-size: 60px; margin-top:20px;margin-bottom:0px;">选课系统</p>
    	</div>
    </div> 
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>  
    <div data-options="region:'west',title:'菜单栏',split:true" style="width:150px;">
    
    	<ul id="tree" class="easyui-tree">   
	       <li>    
	           <span><a href="#" onclick="addTab('选课','section')">选课</a></span>   
	       </li>   
	       <li>   
	           <span><a href="#" onclick="addTab('成绩查询','transcript')">成绩查询</a></span>   
	       </li>
	       <li>
	       	   <span><a href='#' onclick="addTab('教师管理','professorManager')">教师管理</a></span>
	       </li>  
	       <li>
	       	   <span><a href='#' onclick="addTab('课程管理','courseManager')">课程管理</a></span>
	       </li>  
		</ul>
    </div>   
    <div data-options="region:'center',title:false" style="padding:5px;background:#eee;">
    	<div id="tab" class="easyui-tabs" style="width:100%;height:600px;" data-options="fit:true,border:false">   
			<div title="Welcome" style="padding:20px;display:none;">   
		        <h1>欢迎进入选课系统</h1>    
		    </div>
		</div>
    </div>   
</div>  
</body>
</html>