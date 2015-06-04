<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="ttmanage.action.I.TTManageSearchActionI"%>
<%@page import="tool.DateTimeUtil" %>

<link rel="stylesheet" type="text/css" href="themes/softed/style.css">
<script language="JavaScript" type="text/javascript" src="include/js/ListView.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/general.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/Inventory.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/json.js"></script>
<!-- vtlib customization: Javascript hook -->
<script language="JavaScript" type="text/javascript" src="include/js/vtlib.js"></script>
<!-- END -->
<script language="JavaScript" type="text/javascript" src="include/js/en_us.lang.js?"></script>
<script language="JavaScript" type="text/javascript" src="modules//.js"></script>
<script language="JavaScript" type="text/javascript" src="modules/Products/Products.js"></script>
<script language="javascript" type="text/javascript" src="include/scriptaculous/prototype.js"></script>
<script type='text/javascript' src='modules/com_vtiger_workflow/resources/jquery-1.2.6.js'></script>
<script type='text/javascript'>
</script>

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
TTManageSearchActionI sch=(TTManageSearchActionI)wac.getBean("TTManageSearchActionImp");
List list0=sch.TTManageCreateadduser_getAll();
List user=(List)request.getAttribute("user");
String ifalert2=StringUntil.getParameter(request,"ifalert2",null);
String userName=StringUntil.getParameter(request,"username","");
if(user==null||user.isEmpty()){
	if(ifalert2==""){
		list0=sch.TTManageCreateadduser_getAll();
	}
	else{
		list0.clear();
	}
}     
else{
	list0=user;
}

%>

		<script type="text/javascript" src="include/jquery/jquery-1.8.3.js"></script>
        <link rel="stylesheet" href="js/jspPageing/pagination.css" type="text/css"></link>
        <script type="text/javascript" src="js/jspPageing/jquery.pagination.js"></script>
        
        <script type="text/javascript">
               
            // When document has loaded, initialize pagination and form
            $(document).ready(function(){
               pagination('Searchresult', // table ID
                          'Pagination',    // divID
			      {
					items_per_page:20,      
					num_display_entries:5,  
					current_page:0,          
					num_edge_entries:3,      
					link_to:"#",
					prev_text:"Pre",          
					next_text:"Next",
					ellipse_text:"...",
					prev_show_always:true,
					next_show_always:true,
					callback:pageselectCallback
					}); 
                 
            });
        </script>


<script type="text/javascript">
function set_focus() {
	$('search_txt').focus();
}
function check(id,name) {
	window.opener.document.getElementById("user_id").value=id;
    window.opener.document.getElementById("user_name").value=name;
}
</script>

<body  onload=set_focus() class="small" marginwidth=0 marginheight=0 leftmargin=0 topmargin=0 bottommargin=0 rightmargin=0>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mailClient mailClientBg">
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td class="moduleName" width="80%" style="padding-left:10px;">User</td>	                    					
				</tr>
			</table>
			<div id="status" style="position:absolute;display:none;right:135px;top:15px;height:27px;white-space:nowrap;"><img src="themes/softed/images/status.gif"></div>
			<table width="100%" cellpadding="5" cellspacing="0" border="0"  class="homePageMatrixHdr">
				<tr>
					<td style="padding:10px;" >
						<form action="<%=basePath %>TTManageCreateadduser_getuser.action" method="get" >
						<table width="100%" cellpadding="5" cellspacing="0">
						<tr>
							<td width="20%" class="dvtCellLabel"><img src="themes/softed/images/basicSearchLens.gif"></td>
							<td class="dvtCellLabel" align="right">User</td>
							<td width="30%" class="dvtCellLabel">
							<input type="text" name="username" id="search_txt" value="<%=userName%>" class="txtBox"> 
							</td>
							<td width="20%" class="dvtCellLabel">
								<input type="submit" name="search" value=" &nbsp;立即查找&nbsp; "class="crmbutton small create">
							</td>
						</tr>
						</table>
						</form>
					</td>
				</tr>
			</table>

			<div id="ListViewContents">
				<!-- BEGIN: main -->
<form name="selectall" method="POST">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="small">
	<tr>
		<td>&nbsp;</td>	
		<td style="padding-right:10px;" align="right"></td></tr>
   	<tr>
	    <td style="padding:10px;" colspan=3>
		<div style="overflow:auto;height:348px;">
		<table style="background-color: rgb(204, 204, 204);" class="small" border="0" cellpadding="5" cellspacing="1" width="100%">
		<thead>
    	<tr>
    	  <td class="lvtCol">No.</td>
   		  <td class="lvtCol">User</td>
   		  <td class="lvtCol">Description</td>
   		</tr>
  		</thead>
		<tbody>

<%
Date date=new Date();
int i;
for(i=0;i<list0.size();i++){
    Object[] product= (Object[])list0.get(i);
    String str="";
    //sch.TTManageCreateadduser_checkIfAvailable(new Integer(product[0].toString()),DateTimeUtil.date2Str(date));
%>		
			<tr bgcolor=white onMouseOver="this.className='lvtColDataHover'" onMouseOut="this.className='lvtColData'"  >
<td><%if(str!="Not available."){%>
<a href="javascript:window.close();" onclick="check('<%=product[0] %>','<%=product[1].toString() %>')">
<%=product[0].toString() %>
</a>
<%}
else{
	out.print(product[0].toString());
}%></td>

<td><%if(str!="Not available."){%>
<a href="javascript:window.close();" onclick="check('<%=product[0] %>','<%=product[1].toString() %>')">
<%=product[1].toString() %>
</a>
<%}
else{
	out.print(product[1].toString());
}%></td>  
 
<td><span class="STYLE1"><%=str %></span></td>   
              		 
            </tr>
<%}%>                   		
		</tbody>
	    </table>
		</div>
	    </td>
	</tr>
</table>
</form>
			</div>
		</td>
	</tr>
	
</table>
 ${ifalert}
 ${ifalert2}
</body>
 
