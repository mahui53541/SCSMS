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
<title>课程管理</title>
<script>
	$(function(){
		/* $.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/queryProfessor",
			dataType:"json",
			success:function(res){
			}
		}) */
		$('#btn-add').linkbutton({
			iconCls:'icon-add',
			plain:true,
			size:'large',
			onClick:function(){
				addProfessor()
			}
		});
		$('#btn-remove').linkbutton({
			iconCls:'icon-remove',
			plain:true,
			size:'large',
			onClick:function(){
				deleteProfessor()
			}
		});
		$('#btn-edit').linkbutton({
			iconCls:'icon-edit',
			plain:true,
			size:'large',
			onClick:function(){
				editProfessor()
			}
		});
		$('#name').textbox({       
			label: '姓名:',
			labelPosition: 'left',
			prompt: '请输入教师姓名'      
		});
		$('#ssn').textbox({    
			label: '工号:',
			labelPosition: 'left',
			prompt: '请输入教师工号' 
		}); 
		$('#zsg').dialog({
			closed:'true'
		});
		 $('#dg').datagrid({    
			    url:'${pageContext.request.contextPath}/queryProfessor',  
			    fitColumns:true,	//自动适应列
	           	fit:true,			//表格宽高自适应
	            nowrap:false,
	            striped:true,		//斑马线效果
				singleSelect:true,	//单行选中
	            loadmsg:'请等待...',	//加载等待时显示
	            height:100,
	            toolbar:'#btn',
			    columns:[[    
			    	{field:'ssn',title:'编号',width:100,align:'center'},  
			        {field:'name',title:'教师名称',width:100,align:'center'},    
			        {field:'title',title:'职称',width:100,align:'center'} ,
			        {field:'department',title:'学院',width:100,align:'center'} 
			    ]]
			}); 
	})
	function addProfessor(){
		$('#name').textbox('setValue','');
		$('#ssn').textbox('setValue','');
		$('#ssn').textbox('textbox').attr('readonly',false);
		$('#title').combobox('setValue','教授');//一定要先value后text,否则text与value值会相同全为value值  
		$('#title').combobox('setText', '教授');  
		$('#department').combobox('setValue','能源、材料与物理学部');//一定要先value后text,否则text与value值会相同全为value值  
		$('#department').combobox('setText', '能源、材料与物理学部');
		$('#zsg').dialog({
			title:'增加教师',
			width:400,
			height: 400,
			closed: false,    
		    cache: false,
		    modal:true,
		    buttons:[{
		    	text:'保存',
		    	iconCls:'icon-ok',
		    	handler:function(){
		    		var name=$("#name").val();
		    		var ssn = $("#ssn").val();
		    		var title=$("#title").val();
		    		var department=$("#department").val();
		    		if(name==""){
		    			$.messager.alert('警告','姓名不可为空');
		    		}else if(ssn==""){
		    			$.messager.alert('警告','工号不可为空');	
		    		}else if(title==""){
		    			$.messager.alert('警告','职称不可为空');	
		    		}else if(department==""){
		    			$.messager.alert('警告','学院不可为空');	
		    		}else{
    	                $("#professor").ajaxSubmit({
    	                	url: 'addProfessor', 
    	                    type: "post", 
    	                    dataType: "json",
    	                    success: function () {
    	                    	$('#zsg').dialog({closed: true});
    	                    	$.messager.alert('完成','添加成功！');	
    	                    	$('#dg').datagrid( 'reload'); 
    	                    }
    	                   
    	                });
		    		}
		    	}
		    },{
		    	text:'关闭',
		    	iconCls:'icon-cancel',
		    	handler:function(){
		    		$('#zsg' ).dialog({closed: true});
		    	}
		    }]
		})
		};
	function deleteProfessor(){
		var row = $('#dg').datagrid('getSelected');
		if(row){
			$('#delete').dialog({
				title: '删除',
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
						      url:'${pageContext.request.contextPath}/deleteProfessor',
						      data:{'ssn':row.ssn},
						      method:'POST',
						      success:function(){
						    	  $('#delete').dialog('close')
						    	   $("#dg").datagrid("reload");
						    	  $.messager.alert('提示信息','删除成功');
						      }						    
						})
					}					

				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){$('#delete').dialog('close');}
				}]
			})
		}
	};
	function editProfessor(){
		var row = $('#dg').datagrid('getSelected');
		
		$('#name').textbox('setValue',row.name);
		$('#ssn').textbox('setValue',row.ssn);
		$('#ssn').textbox('textbox').attr('readonly',true);
		$('#title').combobox('setValue',row.title);//一定要先value后text,否则text与value值会相同全为value值  
		$('#title').combobox('setText', row.title);  
		$('#department').combobox('setValue',row.department);//一定要先value后text,否则text与value值会相同全为value值  
		$('#department').combobox('setText', row.department);
		$('#zsg').dialog({
			title:'修改教师资料',
			width:400,
			height: 400,
			closed: false,    
		    cache: false,
		    modal:true,
		    buttons:[{
		    	text:'保存',
		    	iconCls:'icon-ok',
		    	handler:function(){
		    		var name=$("#name").val();
		    		var ssn = $("#ssn").val();
		    		var title=$("#title").val();
		    		var department=$("#department").val();
		    		if(name==""){
		    			$.messager.alert('警告','姓名不可为空');
		    		}else if(ssn==""){
		    			$.messager.alert('警告','工号不可为空');	
		    		}else if(title==""){
		    			$.messager.alert('警告','职称不可为空');	
		    		}else if(department==""){
		    			$.messager.alert('警告','学院不可为空');	
		    		}else{
    	                $("#professor").ajaxSubmit({
    	                	url: 'updateProfessor', 
    	                    type: "post", 
    	                    success: function (data) {
    	                    	console.log(data)
    	                    	$('#zsg').dialog({closed: true});
    	                    	$.messager.alert('完成','修改成功！');	
    	                    	$('#dg').datagrid( 'reload'); 
    	                    }
    	                   
    	                });
		    		}
		    	}
		    },{
		    	text:'关闭',
		    	iconCls:'icon-cancel',
		    	handler:function(){
		    		$('#zsg' ).dialog({closed: true});
		    	}
		    }]
		})
	}
</script>
</head>
<body>
	<div id="btn">
		<a id="btn-add">添加</a>
		<a id="btn-remove">删除</a>
		<a id="btn-edit">修改</a>
	</div>
	<table id="dg"></table>
	<div id="zsg">
		<form  id="professor">
    	<table>
			<tr><td><input id="name" type="text" name="name" style="width:300px"></td></tr>    	
			<tr><td><input type="text"  name="ssn" style="width:300px" id="ssn"></input></td></tr> 
			<tr><td>
				<select id="title" class="easyui-combobox"  data-options="label:'职称',labelPosition: 'left',prompt: '请选择职称'" name="title" style="width:300px;">   
				    <option value="教授">教授</option>   
				    <option>副教授</option>   
				    <option>讲师</option>   
				    <option>助教</option>   
				</select>
			</td></tr> 
			<tr><td>
				<select id="department" class="easyui-combobox"  data-options="label:'学院',labelPosition: 'left',prompt: '学院'" name="department" style="width:300px;">   
				    <option value="能源、材料与物理学部">能源、材料与物理学部</option>   
				    <option>矿业工程学院</option>   
				    <option>安全工程学院</option>   
				    <option>力学与土木工程学院</option>
				    <option>机电工程学院</option>
				    <option>信息与控制工程学院</option>
				    <option>资源与地球科学学院</option>
				    <option>化工学院</option>
				    <option>环境与测绘学院</option>
				    <option>电气与动力工程学院</option>
				    <option>数学学院</option>
				    <option>计算机科学与技术学院</option>
				    <option>管理学院</option>
				    <option>公共管理学院</option>
				    <option>马克思主义学院</option>
				    <option>外国语言文化学院</option>
    				<option>建筑与设计学院</option>
    				<option>体育学院</option>
    				<option>孙越崎学院</option>
    				<option>国际学院  </option>
				</select>
			</td></tr> 
    	</table>
    </form>
	</div>
    <div id="delete"><p>是否删除？</p></div>
</body>
</html>