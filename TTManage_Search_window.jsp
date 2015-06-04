<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.StringUntil"%>
<%@page import="tool.Constants"%>
<%@page import="tool.StringUntilDatabase"%>

<%
request.setCharacterEncoding("UTF-8");
response.setHeader("Pragma","No-Cache");
response.setHeader("Cache-Control","No-Cache");
response.setDateHeader("Expires", 0);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser tu=(TUser)session.getAttribute(Constants.LOGINUSER) ;
if(!StringUntil.chickLogin().equals(""))
{
  out.print(StringUntil.chickLogin());
  return; 
}
String menu_Fid=StringUntil.getParameter(request,Constants.menu_Fid,"");         // main menu
String page_menu_ID=StringUntil.getParameter(request,Constants.page_menu_ID,""); // page
String FunctionID=StringUntil.getParameter(request,Constants.FunctionID,"");     // function

String  ttId=StringUntil.getParameter(request,"ttId","");                        // ticket
String title=StringUntil.getParameter(request,"title","");                       // title
String zptype=StringUntil.getParameter(request,"zptype","");
String oldChargeId=StringUntil.getParameter(request,"oldChargeId","");
%>
${ifalert }
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <base target="_self" />
		<base href="<%=basePath%>">
		<title>为【<%=title %>】Choose the supervisor </title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="include/jquery/jquery-1.8.3.js"></script>
		<link rel="stylesheet" href="jquery_ui/base/jquery.ui.all.css">
		<script src="jquery_ui/jquery.ui.core.js"></script>
		<script src="jquery_ui/jquery.ui.widget.js"></script>
		<script src="jquery_ui/jquery.ui.tabs.js"></script>
		<link rel="stylesheet" href="jquery_ui/demos.css">
		<link rel="stylesheet" href="themes/softed/style.css" type="text/css"></link>
		<script src="js/chickFrom/vanadium.js"></script>
	<link rel="stylesheet" href="js/chickFrom/css/chickFrom.css" type="text/css"></link>
		<script>
	$(function() {
        $("#function_<%=FunctionID%>").show();
		$( "#function_139" ).tabs({
			event: "mouseover"
		});
	});
	</script>
	<style type="text/css">
	body {
	background-color: #FAFAFA;
}
	</style>
	</head>
	<body style="margin: 0px;padding: 0px;">
		<%--
   Choose the supervisor
    --%>
		<div class="demo">
			<div id="function_139">
				<ul>
					<li>
						<a href="#tabs-1">Select from the same department</a>
					</li>
					<li>
						<a href="#tabs-2">Select from other department (manager)</a>
					</li>

				</ul>
				<div id="tabs-1"  class="searchUIBasic small" style="margin: 0px;padding: 0px;" >
				
					<form id="form1" target="" name="form1" method="post" action="TTManageSearchAction_zpFzr.action?<%=Constants.menu_Fid%>=<%=menu_Fid%>&<%=Constants.page_menu_ID%>=<%=page_menu_ID%>&<%=Constants.FunctionID%>=<%=FunctionID %>&zptype=<%=zptype %>&oldChargeId=<%=oldChargeId %>">
                                             <input type="hidden" name="tt.id" value="<%=ttId %>" >
                                             
						<table  border="1" class="searchUIBasic small" cellpadding="0" cellspacing="0">

							<tr height="30">
								<td width="128"   align="center">
									Supervisor:
								</td>
								<td width="329" align="left">
									<label>
										<select name="tt.chargeId" class=":required" style="width: 60%;">
												<option selected value="">Select</option>
                        	       <%=StringUntilDatabase.getUserOption("0",tu.getDepartmentId().toString(),tu.getId().toString()) %>
										</select>
									 
									</label>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									<label>
										<input type="submit" name="Submit" value="Enter" />
									</label>
								</td>
							</tr>
						</table>
					</form>

				</div>
				<div id="tabs-2" class="searchUIBasic small" style="margin: 0px;padding: 0px;">
					<form id="form1" name="form1" method="post" action="TTManageSearchAction_zpFzr.action?<%=Constants.menu_Fid%>=<%=menu_Fid%>&<%=Constants.page_menu_ID%>=<%=page_menu_ID%>
                                             &<%=Constants.FunctionID%>=<%=FunctionID %>&zptype=<%=zptype %>&oldChargeId=<%=oldChargeId %>">
					 <input type="hidden" name="tt.id" value="<%=ttId %>" >
					 <input type="hidden" name="isBm" value="1" >
						<table  border="1" class="searchUIBasic small" cellpadding="0" cellspacing="0">
                    
							<tr height="30">
								<td width="128"   align="center">
									Department:
									
								</td>
								<td width="329" align="left">
									<label>
										<select name="tt.chargeId" class=":required" style="width: 60%;">
									   <option selected value="">Select</option>
                        	       <%=StringUntilDatabase.getBmOption("0") %>
										</select>
									 
									</label>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									<label>
										<input type="submit" name="Submit" value="Enter" />
									</label>
								</td>
							</tr>
						</table>
					</form>
				</div>

			</div>

		</div>


	</body>
</html>
