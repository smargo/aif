[#include "/include/header.ftl"]
<style>
	#searchForm table td select{ width:143px;}
	#addfm table td select{ width:143px;}
	#updatefm table td select{ width:143px;}
	#infofm table td select{ width:143px;}
</style>
    <div id="mainPanle" region="center" style="background: #ffffff; overflow-auto">
        <div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="客户信息" style="padding:20px;overflow:auto; color:red; ">		
				<form action="${base}/product/querypro.jsp" id="searchForm" method="post">			
					<input type="hidden" name="pageSize" id="pageSize" />
					<input type="hidden" name="pageNumber" id="pageNumber"/>
					<div id="tb">
					 	<table>
					 		<tr>
					 			<td>客户编号:</td>
					 			<td><input type="text" id="custno" name="custno"/></td>
					 			<td>客户名称:</td>
					 			<td><input type="text" id="customname" name="customname"/></td>
					 			<td>证件号码:</td>
					 			<td><input type="text" id="identityno" name="identityno"/></td>
					 			<td>状态:</td>
					 			<td><!--<input type="text" id="state" name="state"/>-->
					 				<select name="state" >
						 				<option value ="">请选择</option>
						 				[#list stateList as stateList]
										  <option value ="${stateList.keyValue}">${stateList.caption}</option>
						 				[/#list]
									</select>
								</td>
					 			
					 		</tr>
					 		<tr style="height:25px;"></tr>
					 		<tr>
					 			<td>客户风险等级:</td>
					 			<td><!--<input type="text" id="custrisklevel" name="custrisklevel"/>-->
					 				<select name="custrisklevel" >
						 				<option value ="">请选择</option>
						 				[#list custrisklevelList as custrisklevelList]
										  <option value ="${custrisklevelList.keyValue}">${custrisklevelList.caption}</option>
						 				[/#list]
									</select>
					 			</td>
					 			<td>手机号:</td>
					 			<td><input type="text" id="mobile" name="mobile"/></td>
					 			<td>客户类别:</td>
					 			<td><!--<input type="text" id="custtype" name="custtype"/>-->
					 				<select name="custtype" >
						 				<option value ="">请选择</option>
						 				[#list custtypeList as custtypeList]
										  <option value ="${custtypeList.keyValue}">${custtypeList.caption}</option>
						 				[/#list]
									</select>
					 			</td>
					 		</tr>
					 		<tr style="height:25px;"></tr>
					 		
					 		<tr>
					 			<td colspan="10">
					 				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100px" iconAlign="left" iconCls="icon-search" plain="true" onclick="searchRecord(0)">查询</a>
					 				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100px" iconCls="icon-edit" plain="true" onclick="editRecord()">修改</a>
					 				<!--<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100px"s iconCls="icon-add" plain="true" onclick="newRecord()">新增</a>
					 				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100px" iconCls="icon-remove" plain="true" onclick="destroyRecord()">放弃发布</a>	-->				 				
					 			</td>
					 		</tr>
					 	</table>					
					</div>  
					<br>
					<div>
						<table id='mytb' class="easyui-datagrid" style="width:100%;height:460px;">  
					    <thead>  
					        <tr height="300px;">  
					        	<th data-options="field:'ck',checkbox:true"></th>
					        	<th style="width:50px"field="serialno" >序列号</th>
					            <th style="width:150px;"field="operating" >操作</th>
 					            <th style="width:150px;"field="custno" >客户编号</th>
					            <th style="width:100px"field="customname" >客户名称</th>
					            <th style="width:100px"field="sex" >性别</th>
					            <th style="width:100px"field="identitytype" >证件类型</th>  
					            <th style="width:150px"field="identityno" >证件号码</th>  
					            <th style="width:100px"field="mobile" >手机号</th>
					            <th style="width:100px"field="custrisklevel" >客户风险等级</th>
					            <th style="width:100px"field="amlexplain" >反洗钱备注</th>
					            <th style="width:100px"field="state" >状态</th>
					            <th style="width:100px"field="identityinvaliddate" >证件有效期</th>  
					            <th style="width:100px"field="riskevaluatetime" >风险评测时间</th>  
					            <th style="width:100px"field="birthday">出生日期</th>
					            <!--<th style="width:100px"field="nationality" >国籍</th>  -->
					            <th style="width:100px"field="marriage">婚姻</th>
					            <th style="width:100px"field="officephone" >办公电话</th>
					            <th style="width:100px"field="homephone" >家庭电话</th>
					            <th style="width:100px"field="address" >地址</th>
					            <th style="width:100px"field="zip" >邮编</th>
					            <th style="width:100px"field="vocation" >职业</th>
					            <th style="width:100px"field="education" >学历</th>
					            <th style="width:100px"field="income" >年收入</th>
					            <th style="width:100px"field="summary" >客户备注</th>
					        </tr>                                    
					    </thead>
					</table> 
					</div>	 																
				</form>
				<div id="pg" class="easyui-pagination" style="background:#efefef;border:1px solid #ccc;align">
				</div>
			</div>
		</div>
    </div>
    
  	
  	
  	 <!--详情窗 开始-->  
	<div id="infodlg" class="easyui-dialog" style="width:auto;height:auto;padding:10px 20px;top:3px" closed="true" buttons="#infodlg-buttons" >
	 	<form id="infofm" method="post" >
			<table>
				<tr>
		 			<td>客户编号:</td>
		 			<td><input disabled type="text" id="custno" name="custno" disabled/></td>
		 			<td>状态:</td>
		 			<td><!--<input type="text" id="state" name="state"/>-->
		 				<select disabled name="state" >
			 				<option value ="">请选择</option>
			 				[#list stateList as stateList]
							  <option value ="${stateList.keyValue}">${stateList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			</td>
		 			<td>客户类别:</td>
		 			<td><!--<input type="text" id="custtype" name="custtype"/>-->
		 				<select disabled name="custtype" >
			 				<option value ="">请选择</option>
			 				[#list custtypeList as custtypeList]
							  <option value ="${custtypeList.keyValue}">${custtypeList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			
		 		</tr>
		 		<tr style="height:25px;"></tr>
		 		<tr>
		 			<td>客户名称:</td>
		 			<td><input disabled type="text" id="customname" name="customname"/></td>
		 			<td>性别:</td>
		 			<td><!--<input type="text" id="sex" name="sex"/>-->
		 				<select disabled name="sex" >
			 				<option value ="">请选择</option>
			 				[#list sexList as sexList]
							  <option value ="${sexList.keyValue}">${sexList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			<td>证件号码:</td>
		 			<td><input disabled type="text" id="identityno" name="identityno"/></td>
		 			<td>证件类型:</td>
		 			<td><!--<input type="text" id="identitytype" name="identitytype"/>-->
		 				<select disabled name="identitytype" >
			 				<option value ="">请选择</option>
			 				[#list identitytypeList as identitytypeList]
							  <option value ="${identitytypeList.keyValue}">${identitytypeList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td>手机号:</td>
		 			<td><input disabled type="text" id="mobile" name="mobile"/></td>
		 			<td>办公电话:</td>
		 			<td><input disabled type="text" id="officephone" name="officephone"/></td>
		 			<td>家庭电话:</td>
		 			<td><input disabled type="text" id="homephone" name="homephone"/></td>
		 			
		 		</tr>
		 		<tr style="height:25px;"></tr>
		 		<tr>
		 			<td>证件有效期:</td>
		 			<td><input disabled type="text" id="identityinvaliddate" name="identityinvaliddate"/></td>
		 			<td>出生日期:</td>
		 			<td><input disabled type="text" id="birthday" name="birthday"/></td>
		 		</tr>
		 		<tr>
		 			<!--<td>国籍:</td>
		 			<td><input disabled type="text" id="nationality" name="nationality"/></td>-->
		 			<td>婚姻:</td>
		 			<td><!--<input type="text" id="marriage" name="marriage"/>-->
		 				<select disabled name="marriage" >
			 				<option value ="">请选择</option>
			 				[#list marriageList as marriageList]
							  <option value ="${marriageList.keyValue}">${marriageList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			<td>地址:</td>
		 			<td><input disabled type="text" id="address" name="address"/></td>
		 			<td>邮编:</td>
		 			<td><input disabled type="text" id="zip" name="zip"/></td>
		 		</tr>
		 		<tr>
		 			<td>职业:</td>
		 			<td><!--<input type="text" id="vocation" name="vocation"/>-->
		 				<select disabled name="vocation" >
			 				<option value ="">请选择</option>
			 				[#list vocationList as vocationList]
							  <option value ="${vocationList.keyValue}">${vocationList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			<td>学历:</td>
		 			<td>
		 				<select disabled name="education" >  
		 				<option value ="">请选择</option>
		 				[#list educationList as educationList]
						  <option value ="${educationList.keyValue}">${educationList.caption}</option>
		 				[/#list]
						</select>
		 			</td>
		 			<td>年收入:</td>
		 			<td><input disabled type="text" id="income" name="income"/></td>
		 		</tr>
		 		
		 		<tr>
		 			
		 			<td>客户风险等级:</td>
		 			<td><!--<input type="text" id="custrisklevel" name="custrisklevel"/>-->
		 				<select disabled name="custrisklevel" >
			 				<option value ="">请选择</option>
			 				[#list custrisklevelList as custrisklevelList]
							  <option value ="${custrisklevelList.keyValue}">${custrisklevelList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			<td>反洗钱备注:</td>
		 			<td>
		 				<input disabled type="text" id="amlexplain" name="amlexplain"/>
		 			</td>
		 			<td>客户备注:</td>
		 			<td><input disabled type="text" id="summary" name="summary"/></td>
		 		</tr>
			</table>
		</form>
	</div>
	
	
	<div id="infodlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#infodlg').dialog('close')" style="width:90px">关闭</a>
	</div>
	<!--详情窗结束-->
    
    
	<!--修改窗 开始-->  
	<div id="updatedlg" class="easyui-dialog" style="width:auto;height:auto;padding:10px 20px" closed="true" buttons="#updatedlg-buttons" >
	 	<form id="updatefm" method="post" novalidate>
			<table>
				<tr>
					<input type="hidden" id="custno" name="custno"/>
		 			<td>客户编号:</td>
		 			<td><input type="text" id="custnonone" name="custnonone" disabled/></td>
		 			<td>状态:</td>
		 			<td><!--<input type="text" id="state" name="state"/>-->
		 				<select name="state" >
			 				<option value ="">请选择</option>
			 				[#list stateList as stateList]
							  <option value ="${stateList.keyValue}">${stateList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			</td>
		 			<td>客户类别:</td>
		 			<td><!--<input type="text" id="custtype" name="custtype"/>-->
		 				<select name="custtype" >
			 				<option value ="">请选择</option>
			 				[#list custtypeList as custtypeList]
							  <option value ="${custtypeList.keyValue}">${custtypeList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			<td>客户名称:</td>
		 			<td><input type="text" id="customname" name="customname" maxlength=16/></td>
		 		</tr>
		 		<tr style="height:25px;"></tr>
		 		<tr>
		 			<td>性别:</td>
		 			<td><!--<input type="text" id="sex" name="sex"/>-->
		 				<select name="sex" >
			 				<option value ="">请选择</option>
			 				[#list sexList as sexList]
							  <option value ="${sexList.keyValue}">${sexList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			<td>证件号码:</td>
		 			<td><input type="text" id="identityno" name="identityno" maxlength=18 onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" onpaste="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')"/></td>
		 			<td>证件类型:</td>
		 			<td><!--<input type="text" id="identitytype" name="identitytype"/>-->
		 				<select name="identitytype" >
			 				<option value ="">请选择</option>
			 				[#list identitytypeList as identitytypeList]
							  <option value ="${identitytypeList.keyValue}">${identitytypeList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			<td>学历:</td>
		 			<td>
		 				<select name="education" >
			 				<option value ="">请选择</option>
			 				[#list educationList as educationList]
							  <option value ="${educationList.keyValue}">${educationList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 		</tr>
		 		<tr style="height:25px;"></tr>
		 		<tr>
		 			<td>手机号:</td>
		 			<td><input type="text" id="mobile" name="mobile" maxlength=11 onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
		 			<td>办公电话:</td>
		 			<td><input type="text" id="officephone" name="officephone" maxlength=22 onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
		 			<td>家庭电话:</td>
		 			<td><input type="text" id="homephone" name="homephone" maxlength=22 onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
		 			<td>年收入:</td>
		 			<td><input type="text" id="income" name="income" maxlength=9 onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
		 		</tr>
		 		<tr style="height:25px;"></tr>
		 		<tr>
		 			<td>证件有效期:</td>
		 			<td><input type="text" id="identityinvaliddate" name="identityinvaliddate" onClick="WdatePicker({dateFmt:'yyyyMMdd'})"/></td>
		 			<td>出生日期:</td>
		 			<td><input type="text" id="birthday" name="birthday" onClick="WdatePicker({dateFmt:'yyyyMMdd'})"/></td>
		 			<!--<td>国籍:</td>
		 			<td><input type="text" id="nationality" name="nationality" maxlength=3/></td>-->
		 			<td>婚姻:</td>
		 			<td><!--<input type="text" id="marriage" name="marriage"/>-->
		 				<select name="marriage" >
			 				<option value ="">请选择</option>
			 				[#list marriageList as marriageList]
							  <option value ="${marriageList.keyValue}">${marriageList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 		</tr>
		 		
		 		<tr style="height:25px;"></tr>
		 		<tr>
		 			<td>地址:</td>
		 			<td><input type="text" id="address" name="address" maxlength=16/></td>
		 			<td>邮编:</td>
		 			<td><input type="text" id="zip" name="zip" maxlength=10 onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
		 			<td>职业:</td>
		 			<td><!--<input type="text" id="vocation" name="vocation"/>-->
		 				<select name="vocation" >
			 				<option value ="">请选择</option>
			 				[#list vocationList as vocationList]
							  <option value ="${vocationList.keyValue}">${vocationList.caption}</option>
			 				[/#list]
						</select>
		 			</td>
		 			<td>客户风险等级:</td>
		 			<td><!--<input type="text" id="custrisklevel" name="custrisklevel"/>-->
		 				<select name="custrisklevel" >
			 				<option value ="">请选择</option>
			 				[#list custrisklevelList as custrisklevelList]
							  <option value ="${custrisklevelList.keyValue}">${custrisklevelList.caption}</option>
			 				[/#list]
						</select>
		 		</tr>
		 		<tr style="height:25px;"></tr>
		 		<tr>
		 			<td>反洗钱备注:</td>
		 			<td>
		 				<input type="text" id="amlexplain" name="amlexplain" maxlength=33/>
		 			</td>
		 			<td>客户备注:</td>
		 			<td><input type="text" id="summary" name="summary" maxlength=33/></td>
		 		</tr>
		 		<tr style="height:25px;"></tr>
			</table>					
		</form>
	</div>
	<div id="updatedlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateRecord()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#updatedlg').dialog('close')" style="width:90px">取消</a>
	</div>
		
	<!--修改窗 结束-->  
  
	<script type="text/javascript">
		searchRecord(0);
		//初始化分页
		$('#pg').pagination({ 
			total:${page.total}, 
			pageSize:${page.pageSize},
			pageNumber:${page.pageNumber},
			onSelectPage : function(pageNumber, pageSize){
				$(this).pagination('loading');
				$("#pageNumber").val(pageNumber);
				$("#pageSize").val(pageSize);		
				//$('#searchForm').submit();
				searchRecord(1);
				$(this).pagination('loaded');
			},
			onRefresh : function(pageNumber, pageSize){
				$(this).pagination('loading');
				$("#pageNumber").val(pageNumber);
				$("#pageSize").val(pageSize);		
				//$('#searchForm').submit();
				searchRecord(1);
				$(this).pagination('loaded');
			},
			onChangePageSize : function(pageSize){
				$(this).pagination('loading');
				$("#pageNumber").val(1);
				$("#pageSize").val(pageSize);		
				//$('#searchForm').submit();
				searchRecord(1);
				$(this).pagination('loaded');
			}
		});
		
	   
		
		//查询订单
		function searchRecord(flag){
			if(flag === 0){
				$("#pageNumber").val(1);
			}
			var formData = getFormData('searchForm');
			$.ajax({
				url : "${base}/custinfo/querycustinfobypage.jsp",
				data :formData,
				datatype: "json",
                type: "POST",
                traditional: true,
				success : function(data) {
					if(data==-1){
							$.messager.alert("提示","您无相应权限，请联系管理员!");
							return;
						}
					var dataInfo = data.infoList;
					if(dataInfo!=null){
						for(var i=0;i<dataInfo.length;i++){
							var custnoList="\""+dataInfo[i].custno+"\"";
							dataInfo[i].operating = "<a href='javascript:void(0)'  class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='infoRecord("+custnoList+")'><span class='l-btn-left l-btn-icon-left' style='margin-top: 0px;'><span class='l-btn-text'></span><span class='l-btn-icon icon-search'>&nbsp;</span>详情</a>";
	                	}
	                	$('#mytb').datagrid('loadData', dataInfo);
					}else{
						var json = $.parseJSON('{"total":0,"rows":[]}');
						$('#mytb').datagrid('loadData',json);
						$('#mytb').datagrid('insertRow',{
								index: 0,	// 索引从0开始
								row: {
									
								}
							});
							
						$("tr[datagrid-row-index='0']").css({"visibility":"hidden"});	
					}
					$('#pg').pagination({
						total:data.total, 
						pageSize:data.pageSize,
						pageNumber:data.pageNumber
					});
				},
				error:function(){
                	$.messager.alert("提示","加载失败，请稍候再试!");
                	return;
			    }
			});
		}
		
		//修改弹窗
		//var custno;
		function editRecord(){
			var row = $('#mytb').datagrid('getSelected');
			$('#updatefm').form('reset');
			if (row){
				$.ajax({
					type:'POST',
					url : "${base}/custinfo/toupdatecustinfo.jsp",
					data : {custno:row.custno},
					success : function(data) {
						if(data==-1){
							$.messager.alert("提示","您无相应权限，请联系管理员!");
							return;
						}
						
						$('#updatedlg').dialog({
						    title : '修改',
						    modal : true
						});
						$('#updatedlg').dialog('open');
						
						var json = eval(data);
						var custInfo = json.custInfo;
						$('#updatefm').form('load',{
							custno:custInfo.custno,
							custnonone:custInfo.custno,
							state:custInfo.state,
							custtype:custInfo.custtype,
							customname:custInfo.customname,
							sex:custInfo.sex,
							identityno:custInfo.identityno,
							identitytype:custInfo.identitytype,
							mobile:custInfo.mobile,
							officephone:custInfo.officephone,
							homephone:custInfo.homephone,
							identityinvaliddate:custInfo.identityinvaliddate,
							birthday:custInfo.birthday,
							nationality:custInfo.nationality,
							marriage:custInfo.marriage,
							address:custInfo.address,
							zip:custInfo.zip,
							vocation:custInfo.vocation,
							education:custInfo.education,
							income:custInfo.income,
							custrisklevel:custInfo.custrisklevel,
							amlexplain:custInfo.amlexplain,
							summary:custInfo.summary
						});
						
					//客户类别
					var custtype = json.custtypeList;
					$('#updatefm #custtype').empty();
	                $('#updatefm #custtype').append("<option value=''>请选择</option>");
	                for (var i=0;i<custtype.length; i++) {
	                	if(custInfo.custtype==custtype[i].keyValue){
	                   		$('#updatefm #custtype').append($("<option selected value='" + custtype[i].keyValue + "'>" + custtype[i].caption + "</option>"));
	                		
	                	}else{
	                		$('#updatefm #custtype').append($("<option value='" + custtype[i].keyValue + "'>" + custtype[i].caption + "</option>"));
	                	}
	                }
	                
	                //客户风险等级
					var custrisklevel = json.custrisklevelList;
					$('#updatefm #custrisklevel').empty();
	                $('#updatefm #custrisklevel').append("<option value=''>请选择</option>");
	                for (var i=0;i<custrisklevel.length; i++) {
	                	if(custInfo.custrisklevel==custrisklevel[i].keyValue){
	                   		$('#updatefm #custrisklevel').append($("<option selected value='" + custrisklevel[i].keyValue + "'>" + custrisklevel[i].caption + "</option>"));
	                		
	                	}else{
	                		$('#updatefm #custrisklevel').append($("<option value='" + custrisklevel[i].keyValue + "'>" + custrisklevel[i].caption + "</option>"));
	                	}
	                    
	                }
	               	
	                
	                //客户状态
	                var state = json.stateList;
	                $('#updatefm #state').empty();
	                $('#updatefm #state').append("<option value=''>请选择</option>");
	                for (var i=0;i<state.length; i++) {
	                	if(custInfo.state==state[i].keyValue){
	                   		$('#updatefm #state').append($("<option selected value='" + state[i].keyValue + "'>" + state[i].caption + "</option>"));
	                		
	                	}else{
	                		$('#updatefm #state').append($("<option value='" + state[i].keyValue + "'>" + state[i].caption + "</option>"));
	                	}
	                    
	                }
	                                 
	                //证件类型
	                var identitytype = json.identitytypeList;
	                $('#updatefm #identitytype').empty();
	                $('#updatefm #identitytype').append("<option value=''>请选择</option>");
	                for (var i=0;i<identitytype.length; i++) {
	                	if(custInfo.identitytype==identitytype[i].keyValue){
	                   		$('#updatefm #identitytype').append($("<option selected value='" + identitytype[i].keyValue + "'>" + identitytype[i].caption + "</option>"));
	                		
	                	}else{
	                		$('#updatefm #identitytype').append($("<option value='" + identitytype[i].keyValue + "'>" + identitytype[i].caption + "</option>"));
	                	}
	                }
	                
	                //性别
	                var sex = json.sexList;
	                $('#updatefm #sex').empty();
	                $('#updatefm #sex').append("<option value=''>请选择</option>");
	                for (var i=0;i<sex.length; i++) {
	                	if(custInfo.sex==sex[i].keyValue){
	                		$('#updatefm #sex').append($("<option selected value='" + sex[i].keyValue + "'>" + sex[i].caption + "</option>"));
	                	}else{
	                		$('#updatefm #sex').append($("<option value='" + sex[i].keyValue + "'>" + sex[i].caption + "</option>"));
	                	}
	                }
	                
	                //职业
	                var vocation = json.vocationList;
	                $('#updatefm #vocation').empty();
	                $('#updatefm #vocation').append("<option value=''>请选择</option>");
	                for (var i=0;i<vocation.length; i++) {
	                    if(custInfo.vocation==vocation[i].keyValue){
	                		$('#updatefm #vocation').append($("<option selected value='" + vocation[i].keyValue + "'>" + vocation[i].caption + "</option>"));
	                	}else{
	                		$('#updatefm #vocation').append($("<option value='" + vocation[i].keyValue + "'>" + vocation[i].caption + "</option>"));
	                	}
	                }
	                //学历
	                var education = json.educationList;
	                $('#updatefm #education').empty();
	                $('#updatefm #education').append("<option value=''>请选择</option>");
	                for (var i=0;i<education.length; i++) {
	                    if(custInfo.education==education[i].keyValue){
	                		$('#updatefm #education').append($("<option selected value='" + education[i].keyValue + "'>" + education[i].caption + "</option>"));
	                	}else{
	                		$('#updatefm #education').append($("<option value='" + education[i].keyValue + "'>" + education[i].caption + "</option>"));
	                	}
	                }
	                
	                //婚姻
	                var marriage = json.marriageList;
	                $('#updatefm #marriage').empty();
	                $('#updatefm #marriage').append("<option value=''>请选择</option>");
	                for (var i=0;i<marriage.length; i++) {
	                    if(custInfo.marriage==marriage[i].keyValue){
	                		$('#updatefm #marriage').append($("<option selected value='" + marriage[i].keyValue + "'>" + marriage[i].caption + "</option>"));
	                	}else{
	                		$('#updatefm #marriage').append($("<option value='" + marriage[i].keyValue + "'>" + marriage[i].caption + "</option>"));
	                	}
	                }
	                
					}
				});
				
			}else{
				$.messager.alert("提示","请选择要修改的订单！");
			}
		}
		
			   
		//修改保存
		//首先获取到表单的所有值
		function getFormData(formid) {
		    return $('#'+formid).serializeObject();
		}
		function updateRecord(){
			$.messager.confirm("操作提示", "您确定要修改吗？", function (data) {
				if (data) {
					var formData = getFormData('updatefm');
					$.ajax({
						type:'POST',
						url : "${base}/custinfo/updateaccorequest.jsp",
						data :formData,
						success : function(data) {
							if(data=="success"){
								$.messager.alert("提示","修改产品成功！");
								$('#updatedlg').dialog('close')
								searchRecord(0);
							}else{
								$.messager.alert("提示","修改产品失败！");
							}
						}
					});
			
				}else{
						return;
					 }
			});	
			
		}
		
		//详情弹窗
		function infoRecord(custnoList){
			//var row = $('#mytb').datagrid('getSelected');
			$('#infofm').form('reset');
			if (custnoList){
				$('#infodlg').dialog('open').dialog('setTitle','详情');
				$.ajax({
					type:'POST',
					url : "${base}/custinfo/queryinfobyid.jsp",
					data : {custno:custnoList},
					success : function(data) {
						var json = eval(data);
						var custInfo = data.custInfo;
						$('#infofm').form('load',{
							custno:custInfo.custno,
							state:custInfo.state,
							custtype:custInfo.custtype,
							customname:custInfo.customname,
							sex:custInfo.sex,
							identityno:custInfo.identityno,
							identitytype:custInfo.identitytype,
							mobile:custInfo.mobile,
							officephone:custInfo.officephone,
							homephone:custInfo.homephone,
							identityinvaliddate:custInfo.identityinvaliddate,
							birthday:custInfo.birthday,
							nationality:custInfo.nationality,
							marriage:custInfo.marriage,
							address:custInfo.address,
							zip:custInfo.zip,
							vocation:custInfo.vocation,
							education:custInfo.education,
							income:custInfo.income,
							custrisklevel:custInfo.custrisklevel,
							amlexplain:custInfo.amlexplain,
							summary:custInfo.summary
						});
						
						//客户类别
					var custtype = json.custtypeList;
					$('#updatefm #custtype').empty();
	                $('#updatefm #custtype').append("<option value=''>请选择</option>");
	                for (var i=0;i<custtype.length; i++) {
	                	if(custInfo.custtype==custtype[i].keyValue){
	                   		$('#updatefm #custtype').append($("<option selected value='" + custtype[i].keyValue + "'>" + custtype[i].caption + "</option>"));
	                		
	                	}else{
	                		$('#updatefm #custtype').append($("<option value='" + custtype[i].keyValue + "'>" + custtype[i].caption + "</option>"));
	                	}
	                }
	                
	                //客户风险等级
					var custrisklevel = json.custrisklevelList;
					$('#infofm #custrisklevel').empty();
	                $('#infofm #custrisklevel').append("<option value=''>请选择</option>");
	                for (var i=0;i<custrisklevel.length; i++) {
	                	if(custInfo.custrisklevel==custrisklevel[i].keyValue){
	                   		$('#infofm #custrisklevel').append($("<option selected value='" + custrisklevel[i].keyValue + "'>" + custrisklevel[i].caption + "</option>"));
	                		
	                	}else{
	                		$('#infofm #custrisklevel').append($("<option value='" + custrisklevel[i].keyValue + "'>" + custrisklevel[i].caption + "</option>"));
	                	}
	                    
	                }
	               	
	                
	                //客户状态
	                var state = json.stateList;
	                $('#infofm #state').empty();
	                $('#infofm #state').append("<option value=''>请选择</option>");
	                for (var i=0;i<state.length; i++) {
	                	if(custInfo.state==state[i].keyValue){
	                   		$('#infofm #state').append($("<option selected value='" + state[i].keyValue + "'>" + state[i].caption + "</option>"));
	                		
	                	}else{
	                		$('#infofm #state').append($("<option value='" + state[i].keyValue + "'>" + state[i].caption + "</option>"));
	                	}
	                    
	                }
	                                 
	                //证件类型
	                var identitytype = json.identitytypeList;
	                $('#infofm #identitytype').empty();
	                $('#infofm #identitytype').append("<option value=''>请选择</option>");
	                for (var i=0;i<identitytype.length; i++) {
	                	if(custInfo.identitytype==identitytype[i].keyValue){
	                   		$('#infofm #identitytype').append($("<option selected value='" + identitytype[i].keyValue + "'>" + identitytype[i].caption + "</option>"));
	                		
	                	}else{
	                		$('#infofm #identitytype').append($("<option value='" + identitytype[i].keyValue + "'>" + identitytype[i].caption + "</option>"));
	                	}
	                }
	                
	                //性别
	                var sex = json.sexList;
	                $('#infofm #sex').empty();
	                $('#infofm #sex').append("<option value=''>请选择</option>");
	                for (var i=0;i<sex.length; i++) {
	                	if(custInfo.sex==sex[i].keyValue){
	                		$('#infofm #sex').append($("<option selected value='" + sex[i].keyValue + "'>" + sex[i].caption + "</option>"));
	                	}else{
	                		$('#infofm #sex').append($("<option value='" + sex[i].keyValue + "'>" + sex[i].caption + "</option>"));
	                	}
	                }
	                
	                //职业
	                var vocation = json.vocationList;
	                $('#infofm #vocation').empty();
	                $('#infofm #vocation').append("<option value=''>请选择</option>");
	                for (var i=0;i<vocation.length; i++) {
	                    if(custInfo.vocation==vocation[i].keyValue){
	                		$('#infofm #vocation').append($("<option selected value='" + vocation[i].keyValue + "'>" + vocation[i].caption + "</option>"));
	                	}else{
	                		$('#infofm #vocation').append($("<option value='" + vocation[i].keyValue + "'>" + vocation[i].caption + "</option>"));
	                	}
	                }
	                
	                //婚姻
	                var marriage = json.marriageList;
	                $('#infofm #marriage').empty();
	                $('#infofm #marriage').append("<option value=''>请选择</option>");
	                for (var i=0;i<marriage.length; i++) {
	                    if(custInfo.marriage==marriage[i].keyValue){
	                		$('#infofm #marriage').append($("<option selected value='" + marriage[i].keyValue + "'>" + marriage[i].caption + "</option>"));
	                	}else{
	                		$('#infofm #marriage').append($("<option value='" + marriage[i].keyValue + "'>" + marriage[i].caption + "</option>"));
	                	}
	                }
	
					}
				});
				
			}else{
				$.messager.alert("提示","请选择要修改的订单！");
			}
		}
	
	</script>