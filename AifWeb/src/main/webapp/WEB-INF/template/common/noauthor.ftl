
[#include "/include/header.ftl"]

<style>
	.datagrid-cell{ height:35px; line-height:30px;width:200px;font-size:14px;}
	.searchTb td{font-size:15px;}
	.datagrid-header .datagrid-cell span {
		font-size: 15px;		
	}
	.datagrid-header td, .datagrid-body td, .datagrid-footer td {
		border-width: 0px 0px 1px 0px;
		border-style: dotted;
		margin: 0;
		padding: 0;
	}
	.searchTdWidth{width:250px;}
</style>

    <div id="mainPanle" region="center" style="background: #ffffff; overflow-auto">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >                       
			<div style="padding:20px;overflow:hidden; color:red; " >		
									
					<div id="tb" align="center" style="margin-top:100px;font-size:16px;">
					 	对不起，您没有权限访问，请与系统管理员联系！					
					</div>  
		
									
			</div>												
		</div>				
    </div>
    

[#include "/include/footer.ftl"]