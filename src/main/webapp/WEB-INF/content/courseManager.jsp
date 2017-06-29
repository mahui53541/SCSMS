<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程管理</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">   
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>   
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
 <script type="text/javascript" src="http://www.jeasyui.com/easyui/datagrid-detailview.js"></script>
 <script  type="text/javascript">
    $(function(){ 
    	$('#btn-add').linkbutton({
			iconCls:'icon-add',
			plain:true,
			size:'large',
			onClick:function(){
				addCourse()
			}
		});
		$('#btn-remove').linkbutton({
			iconCls:'icon-remove',
			plain:true,
			size:'large',
			onClick:function(){
				deleteCourse()
			}
		});
		/* $('#btn-edit').linkbutton({
			iconCls:'icon-edit',
			plain:true,
			size:'large',
			onClick:function(){
				editCourse()
			}
		}); */
		$('#prevCourse').combobox({    
		    url:'queryCourse',    
		    valueField:'number',    
		    textField:'name'  ,
		   // limitToList:true,
		    multiple:true,
		    label: '先修课程:',
			labelPosition: 'left',
			prompt: '请选择先修课程'  
		}); 
		$('#name').textbox({       
			label: '名称:',
			labelPosition: 'left',
			prompt: '请输入课程名称'      
		});
		$('#number').textbox({       
			label: '编号:',
			labelPosition: 'left',
			prompt: '请输入课程编号'      
		});
		$('#credits').textbox({       
			label: '学分:',
			labelPosition: 'left',
			prompt: '请输入课程学分'      
		});
		
		$('#zsg').dialog({
			closed:'true'
		});
		$('#uc').dialog({
			closed:'true'
		});
        $('#dg').datagrid({
            view: detailview,
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table class="ddv"></table></div>';
            },
            onExpandRow: function(index,row){   
                 var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
                 ddv.datagrid({                
                   url:'queryPrevCourse?number='+row.number,  
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,
                    loadMsg:'加载中...',
                    height:'auto',
                     columns:[[
                        {field:'number',title:'先修课程名称',width:100},
                        {field:'credits',title:'学分',width:100},
                    ]], 
                    onBeforeSelect:function(){
                        return false;
                    },
                    onResize:function(){
                        $('#dg').datagrid('fixDetailRowHeight',index);
                    },
                    onLoadSuccess:function(){
                        setTimeout(function(){
                            $('#dg').datagrid('fixDetailRowHeight',index);
                        },0);
                    }
                }); 
                $('#dg').datagrid('fixDetailRowHeight',index);
            }
        });
    })
    function addCourse(){
    	$('#zsg').dialog({
			title:'增加课程',
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
		    		var number = $("#number").val();
		    		var credits=$("#credits").val();
		    		if(name==""){
		    			$.messager.alert('警告','名称不可为空');
		    		}else if(number==""){
		    			$.messager.alert('警告','编号不可为空');	
		    		}else if(credits==""){
		    			$.messager.alert('警告','学分不可为空');	
		    		}else{
    	                $("#course").ajaxSubmit({
    	                	url: 'addCourse', 
    	                    type: "post", 
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
    }
    function deleteCourse(){
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
						      url:'${pageContext.request.contextPath}/deleteCourse',
						      data:{'number':row.number},
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
    }
/*     function editCourse(){
    	var row = $('#dg').datagrid('getSelected');
    	$('#uc').dialog({
			title:'修改课程信息',
			width:400,
			height: 400,
			closed: false,    
		    cache: false,
		    modal:true,
		    buttons:[{
		    	text:'保存',
		    	iconCls:'icon-ok',
		    	handler:function(){
		    		var name=$("#u_name").val();
		    		var number = $("#u_number").val();
		    		var credits=$("#u_credits").val();
		    		if(name==""){
		    			$.messager.alert('警告','名称不可为空');
		    		}else if(number==""){
		    			$.messager.alert('警告','编号不可为空');	
		    		}else if(credits==""){
		    			$.messager.alert('警告','学分不可为空');	
		    		}else{
		    			 $("#updateC").ajaxSubmit({
    	                	url: 'updateCourse', 
    	                    type: "post", 
    	                    success: function (data) {
    	                    	$('#uc').dialog({closed: true});
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
    } */
    </script>
</head>
<body>
    <table id="dg" style="width:700px;height:250px"
        url="queryCourse"
        title="课程管理"
        singleSelect="true" 
        fitColumns="true"
        rownumbers="true"   
        fitColumns="true"   
        fit="true"          
        nowrap="false"
        striped="true"
        singleSelect="true"
         toolbar="#btn",
        >    
    <thead>
        <tr>     
            <th field="name" align="center" width="100">课程名称</th>
            <th field="credits" align="center" width="100">学分</th>
        </tr>
    </thead>
</table>
<div id="btn">
	<a id="btn-add">添加</a>
	<a id="btn-remove">删除</a>
	<!-- <a id="btn-edit">修改</a> -->
</div>
<div id="zsg">
	<form  id="course">
    	<table>
			<tr><td><input id="name" type="text" name="name" style="width:300px"></td></tr>    	
			<tr><td><input id="number" type="text" name="number" style="width:300px" ></input></td></tr> 
			<tr><td><input id="credits" type="text" name="credits" style="width:300px"></td></tr>
			<tr><td><input id="prevCourse" name="prevCourseNum" value="" style="width:300px"> </td></tr> 
    	</table>
    </form>
</div>
    <div id="delete"><p>是否删除？</p></div>
      
</body>
</html>