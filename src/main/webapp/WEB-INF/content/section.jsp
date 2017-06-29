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
<title>选课</title>
<script>
	$(function(){
		$('#tc').dialog({    
	 	    closed:true
	 	}); 
		$('#stu').dialog({
			closed:true
		});
		$('#enrolledstu').datagrid({
			closed:true
		});
	 	 $('#dg').datagrid({    
		    url:'${pageContext.request.contextPath}/querySection',  
		    fitColumns:true,	//自动适应列
           	fit:true,			//表格宽高自适应
            nowrap:false,
            striped:true,		//斑马线效果
			singleSelect:true,	//单行选中
            loadmsg:'请等待...',	//加载等待时显示
            height:100,
            /* toolbar:'#btn', */
		    columns:[[    
		        {field:'sectionSn',title:'编号',width:100,hidden:true},    
		        {field:'name',title:'名称',width:100,align:'center'},    
		        {field:'teacher',title:'教师',width:100,align:'center'} ,
		        {field:'time',title:'时间',width:100,align:'center'} ,
		        {field:'day',title:'周次',width:100,align:'center'} ,
		        {field:'room',title:'教室',width:100,align:'center'},
		        {field:'capacity',title:'容量',width:100,align:'center'},
		        {field:'credits',title:'学分',width:100,align:'center'},
		        {field:'select_btn',title:'选课',width:100,align:'center',
		        	formatter:function(value,row,index){
		        		var btn="<button onclick=selectSection("+row.sectionNo+",'"+row.name+"'"+")>选课</button>";
		        		return btn
		        	}
		        },
		        {field:'query_btn',title:'查看已选学生',width:100,align:'center',
		        	formatter:function(value,row,index){
		        		var btn="<button onclick=queryEnrolledStudents("+row.sectionNo+")>查看</button>";
		        		return btn
		        	}
		        }
		    ]]
		});  
	 	
	})
	function selectSection(sectionNo,name){
		var text="确定选择"+name+"这门课程吗？"
		$("#tc").text(text)
		$('#tc').dialog({
			title: '选课确认',
		    width: 300,
		    height: 150,
		    closed: false,
		    cache: false,
		    modal: true,
		    buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					$.ajax({
					      url:'${pageContext.request.contextPath}/selectSection',
					      data:{'sectionNo':sectionNo}, 
					      method:'POST',
					      success:function(res){
					    	  console.log(res)
					    	  $('#tc').dialog('close')
					    	  $("#dg").datagrid("reload");
					    	  $.messager.alert('提示信息',res); 
					      }						    
					})
				}					

			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){$('#tc').dialog('close');}
			}]
		}) 
	};
	function queryEnrolledStudents(sectionNo){
		$('#stu').dialog({
			title: '已选学生',
		    width: 400,
		    height: 500,
		    closed: false,
		    cache: false,
		    modal: true
		}) ;
		$('#enrolledstu').datagrid({    
		    url:'${pageContext.request.contextPath}/queryEnrolledStudents?sectionNo='+sectionNo,  
		    fitColumns:true,	//自动适应列
           	fit:true,			//表格宽高自适应
            nowrap:false,
            striped:true,		//斑马线效果
			singleSelect:true,	//单行选中
            loadmsg:'请等待...',	//加载等待时显示
            height:100,
            closed:false,
            /* toolbar:'#btn', */	
            columns:[[    
		        {field:'ssn',title:'学号',width:100,hidden:true}, 
		        {field:'name',title:'姓名',width:100},
		        {field:'degree',title:'年级',width:100}, 
		        {field:'major',title:'专业',width:100}
			]]
		});  
		
	}
	
</script>
</head>
<body>
<table id="dg"></table>  
<div id="tc"></div>
<div id="stu">
	<table id="enrolledstu"></table>
</div>  
</body>
</html>