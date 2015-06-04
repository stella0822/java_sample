<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
 
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="ttmanage.action.I.TTManageSearchActionI"%>
<%@page import="ttmanage.database.TTroubleticket"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.Constants"%>
<%request.setCharacterEncoding("UTF-8");
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

String menu_Fid=StringUntil.getParameter(request,Constants.menu_Fid,"75");         // main menu
String page_menu_ID=StringUntil.getParameter(request,Constants.page_menu_ID,"68"); // page
 


WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
TTManageSearchActionI sch=(TTManageSearchActionI)wac.getBean("TTManageSearchActionImp");
List list0=sch.TTManageSearchAction_getAll();

int highlight=0;

List searchtt=(List)request.getAttribute("searchtt");
String ifalert2=StringUntil.getParameter(request,"ifalert2",null);
int temp=0;
	String searchDate1="";
	String searchDate2="";
	String searchTitle="";
    String searchStatus="0";
    String searchPriority="0";
    String searchContact="";
    String searchCreateB="0";
    String searchCreater="0";
    String searchChargeB="0";
    String searchCharger="0";
//String title=StringUntil.getParameter(request,"","");
if(searchtt==null||searchtt.isEmpty()){
	if(ifalert2==""){
		list0=sch.TTManageSearchAction_getAll();
	}
	else{
		list0.clear();
		temp=1;
	}
}     
else{
	list0=searchtt;
	temp=1;
}
if(temp==1){
	searchDate1=StringUntil.getParameter(request,"date1","");
	searchDate2=StringUntil.getParameter(request,"date2","");
	searchTitle=StringUntil.getParameter(request,"searchTitle","");
    searchStatus=StringUntil.getParameter(request,"searchStatus","");
    searchPriority=StringUntil.getParameter(request,"searchPriority","");
    searchContact=StringUntil.getParameter(request,"searchContact","");
    searchCreateB=StringUntil.getParameter(request,"searchCreateB","");
    searchCreater=StringUntil.getParameter(request,"searchCreater","");
    searchChargeB=StringUntil.getParameter(request,"searchChargeB","");
    searchCharger=StringUntil.getParameter(request,"searchCharger","");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>Search</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="styles.css">
		<!-- ActivityReminder customization for callback -->
		<style type="text/css">
div.fixedLay1 {
	position: fixed;
}
</style>
		<!--[if lte IE 6]>
	<style type="text/css">div.fixedLay { position:absolute; }</style>
	<![endif]-->
		<style type="text/css">
div.drop_mnu_user {
	position: fixed;
}

body {
	background-color: #FAFAFA;
}

strong,table {
	font-size: 12px;
}
.mb {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 120%;
	z-index: -4;
	background-color: #CCCCCC;
	background-attachment: fixed;
	opacity: 0.5;
	-moz-opacity: 0.5; /* Firefox */
	filter: alpha(opacity = 50); /*ie */
}
.mb2 {
	position:absolute;
	left:300px;
	top:240px;
	width:20%;
	z-index: 5;
	background-color:white;
    
}

.mb3 {
	position:absolute;
	left:500px;
	top:260px;
	width:25%;
	z-index: 5;
	background-color:white;
    
}
.hide_overflow{  
display:none;
 
}  

</style>
		<!--[if lte IE 6]>
	<style type="text/css">div.drop_mnu_user { position:absolute; }</style>
	<![endif]-->
		<!-- End -->
		<!-- header -->
		<!-- header-vtiger crm name & RSS -->
		<!-- header -->
		<!-- header-vtiger crm name & RSS -->
		<script language="JavaScript" type="text/javascript" src="include/js/general.js?v=5.4.0"></script>
		<!-- vtlib customization: Javascript hook -->
		<script language="JavaScript" type="text/javascript"
			src="include/js/vtlib.js?v=5.4.0"></script>
		<!-- END -->
		<script type="text/javascript"
			src="include/jquery/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="include/jquery/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="include/js/checkDate2.js"></script>
		<script type="text/javascript" src="include/js/showdate.js"></script>
		<link rel="stylesheet" href="themes/softed/style.css" type="text/css"></link>
		<link rel="stylesheet" href="<%=basePath %>js/autopoint/autopoint.css" type="text/css"></link>
        <script src="<%=basePath %>js/autopoint/autopoint.js"></script>
        <link rel="stylesheet" href="js/jspPageing/pagination.css" type="text/css"></link>
        <script type="text/javascript" src="js/jspPageing/jquery.pagination.js"></script>
        
	<script src="js/chickFrom/vanadium.js"></script>
	<link rel="stylesheet" href="js/chickFrom/css/chickFrom.css" type="text/css"></link>
	
        <script type="text/javascript">
               
            // When document has loaded, initialize pagination and form
            $(document).ready(function(){
               pagination('Searchresult', // table ID
                          'Pagination',    // divID
			      {
					items_per_page:11,      
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

	</head>
	<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 class=small>
		<!-- header - master tabs -->
		<%--
 menu
--%>
		<jsp:include page="../page/menu.jsp" flush="true">
        <jsp:param value="<%=page_menu_ID %>" name="page_MENU_ID"/>
		</jsp:include><%--
 body
--%>

		<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
			<tr>
				<td width="10%" valign=top>
					&nbsp;
				</td>
				<td class="showPanelBg" valign="top" style="padding: 13px;">
					<!-- SIMPLE SEARCH -->

					<div id="searchAcc" class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px; width: 1050px">
						<form action="<%=basePath %>TTManageSearchAction2_getTt.action?<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"129")%>" method="post" >
						<table border=0 align=center cellpadding=0>
							<tr height="26px">
								<td>
									<div align="right">
										<strong>Title</strong>
									</div>
								</td>
								<td width="150px">
									<input type="text" style="display: block;" name="tt.title"
										id="" value="<%=searchTitle%>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'">
								</td>
								<td>
									<div align="right">
										<strong>Status</strong>
									</div>
								</td>
								<td width="150px">
							<select name="tt.status" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>Select</option>
                        	<%=StringUntilDatabase.getDepartmenOption("4",searchStatus ) %>
                        	</select>
								</td>
								<td>
									<div align="right">
										<strong>Priority</strong>
									</div>
								</td>
								<td width="150px">
							<select name="tt.priority" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>Select</option>
                        	<%=StringUntilDatabase.getDepartmenOption("5",searchPriority) %>
                        	</select>
								</td>
								<td>
									<div align="right">
										<strong>Contact</strong>
									</div>
								</td>
								<td width="150px">
									<input type="text" style="display: block;" name="tt.contactName"
										id="" value="<%=searchContact%>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'">
								</td>
							</tr>
							<tr>
								<td>
									<div align="right">
										<strong>Department</strong>
									</div>
								</td>
								<td width="150px">
								<script type="text/javascript">
								 function getUser(id,type,userId)
								 {
									 if(userId==undefined)
									 {
									 id=$(id).val();
									 }
									 if(id==0)
									 {
										   if(type==1)
                                           {
                                         	  $("#UsercreateId").html("");
												$("#UsercreateId").append("<option selected value='0'>All</option>");
                                          }else
                                          {
                                         	 $("#userChargeId").html("");
                                         	 $("#userChargeId").append("<option selected value='0'>All</option>") ; 
                                           }
										 $("#UsercreateId").append("<option selected value='0'>All</option>");
										 $("#userChargeId").append("<option selected value='0'>All</option>");
										 return false;
								     }
									   
									   $.get("NoChickUserAction_getUserByBm.action?pageId="+new Date().getTime(),{"bmId":id,"selectUserId":userId},function(date){
                                              if(type==1)
                                              {
                                            	  $("#UsercreateId").html("");
 												$("#UsercreateId").append("<option selected value='0'>All</option>"+date);

                                             }else
                                             {
                                            	 $("#userChargeId").html("");
                                            	 $("#userChargeId").append("<option selected value='0'>All</option>"+date) ; 
                                              }
                                           
										   });
 
                                       
							     }
							   
                                 $(function(){
                                	  getUser(<%=searchCreateB%>,1,<%=searchCreater%>);
                                	  getUser(<%=searchChargeB%>,2,<%=searchCharger%>);
                                 
                                     });
							     
								</script>
								 
							<select name="searchCreateB" tabindex="" class="small" style="display:block; width:90%" onchange="getUser(this,1);" >
							<option selected value='0' >All</option>
                        	<%=StringUntilDatabase.getBmOption(searchCreateB) %>
                        	</select>
								</td>
								<td>
									<div align="right">
										<strong>Create</strong>
									</div>
								</td>
								<td width="150px">
							<select id="UsercreateId" name="tt.createId" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>All</option>
                        	 
                        	</select>
								</td>
								<td>
									<div align="right">
										<strong>Time</strong>
									</div>
								</td>
								<td width="150px">
									<input type="text" style="display: block;" name="date1"
										id="date1" value="<%=searchDate1%>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'"
										onclick="setday(this);" readonly="readonly">
								</td>
								<td>
									<div align="right">
										<strong><<>>&nbsp;</strong>
									</div>
								</td>
								<td width="150px">
									<input type="text" style="display: block;" name="date2"
										id="" value="<%=searchDate2%>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'"
										onclick="setday(this);" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>
									<div align="right">
										<strong>Department</strong>
									</div>
								</td>
								<td width="150px">
							<select name="searchChargeB" tabindex="" class="small" onchange="getUser(this,2);" style="display:block; width:90%">
							<option selected value='0'>All</option>
                        	<%=StringUntilDatabase.getBmOption(searchChargeB) %>
                        	</select>
								</td>
								<td>
									<div align="right">
										<strong>Supervisor</strong>
									</div>
								</td>
								<td width="150px">
								 
							<select id="userChargeId" name="tt.chargeId" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>All</option>
                         
                        	</select>
								</td>
								<td>&nbsp;</td>
								
								<td class="small" align="right">
								<input id="downExcel"  name="downExcel" type="hidden" value="" >
									<button name="submit" type="submit"
										class="crmbutton small create" onclick="$('#downExcel').val('');">Search
									</button>
								</td>
									
								<td>&nbsp;</td>
								<td>
									<button functionId="function_96" name="submit" type="submit" onclick="$('#downExcel').val('1');"
										class="crmbutton small create">Download
									</button>
								</td>
							</tr>
						</table>
						</form>
						
						<!-- PUBLIC CONTENTS STARTS-->
						<div id="ListViewContents" class="small" style="width: 100%;">
							<form name="massdelete" method="POST" id="massdelete"
								onSubmit="VtigerJS_DialogBox.block();">
								<!-- List View Master Holder starts -->
								<table border=0 cellspacing=0 cellpadding=0 width=100%
									class="lvtBg">
									<tr>
										<td>
											<!-- List View's Buttons and Filters starts -->
											<table width="100%" class="layerPopupTransport">
												<tr>
													<td valign="middle">

													</td>
												</tr>
											</table>

											<table border=0 cellspacing=0 cellpadding=2 width=100%
												class="small">
												<tr>
													<!-- Buttons -->

													<td style="padding-right: 20px; margin: 0px; height: 300px"
														nowrap>

														<table border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td width="22px">
																	  <a functionId="function_153" href="TTManage_Create.action?menu_Fid=<%=menu_Fid %>"><img
																			src="themes/softed/images/btnL3Add.gif"
																			alt="Create..." width="22" height="20" border=0
																			style="margin: 0px;" 
																			/></a>
																</td>
																<td width="30px">
													 <a functionId="function_153" href="TTManage_Create.action?menu_Fid=<%=menu_Fid %>"> Create </a>
																</td>
									
																<td>
                                                                <script type="text/javascript">
																	  function massDelete()
																	  {
																		  var i=0;
	                                                                      var namestr="";
	                                                                      var num=$("input[name='selected_id'][checked='checked']");
	                                                                      //alert(num.length.toString());
	                                                                      for(i=0;i<num.length;i++){
	                                                                         namestr+=$(num[i]).val()+",";
	                                                                      }
	                                                                      //alert(namestr);
																		  $('#mb').attr('style','z-index: 4;');
																		  $('#massdeleteGroup').show(100);
																		  $('#massdeletename').val(namestr);
																		  return false;
																	  }
																	  
																	  function deletepro(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#deleteGroup').show(100);
																	  
																	 var strdel=$('#td_id_'+id).text();
																	 //alert(strdel);
																	 strdel=strdel.split("T")[2];
																	 //alert(strdel);
																	  $('#deletename').val($('#td_name_'+id).text());
																	  $('#deleteid').val(strdel);
																	  }
																	  
																	  function notAssign(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#notAssignGroup').show(100);
																	  
																	  $('#notAssignid').val(id);
																	  }
																	  
																	  function forward(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#forwardGroup').show(100);
																	  
																	  $('#forwardid').val(id);
																	  }
																</script>
																	<!--	<a href="#">
					<img src="themes/softed/images/tbarImport.gif" alt="*Upload" style="margin-bottom:-4px;"  width="22" height="20" border="0"/>Upload</a>-->
																	<input functionId="function_95" class="crmbutton small delete" type="button"
																		value="Cancel" onClick="massDelete();return false;" />
																</td>
																<td width="22px">
																	  
																</td>
																<td width="22px">
																	  
																</td>
																<td width="22px">
																  
																</td>
																</tr>
														</table>
														<!-- List View's Buttons and Filters ends -->
														<div style="margin: 0px,0px,0px,10px; height: 300px">
															<table border=0 cellspacing=1 cellpadding=3 width=100%
																class="lvt small" id="Searchresult">
																<!-- Table Headers -->
																<thead>
																<tr>
																<td class="lvtCol"></td>
																	<td class="lvtCol" width="40">
																		No.

																	</td>
																	<td class="lvtCol" width="200">
																		Title

																	</td>
																	<td class="lvtCol" width="80">
																		Create
																	</td>
																	<td class="lvtCol" width="80">
																		Supervisor

																	</td>
																	<td class="lvtCol" width="80">
																		Priority

																	</td>
																	<td class="lvtCol" width="80">
																		Status

																	</td>
																	<td class="lvtCol">
																		Operation

																	</td>
																</tr>
																</thead>
																
		 														<tbody>
<%
if(list0!=null&&list0.size()>0)
{

int i;
for(i=0;i<list0.size();i++){
    TTroubleticket tt= (TTroubleticket)list0.get(i);
    
    if((tt.getCreateId().equals(tu.getId())) // The user now is the creator
 		   ||(tt.getChargeId()!=null&&tt.getChargeId().equals(tu.getId()))  // The user now is the supervisor
 		   ||((StringUntil.getDepUserId(tt.getCreateId()))||(StringUntil.getDepUserId(tt.getChargeId())))	// The user now is the manager
 		   ||((tt.getChargeId()!=null&&tt.getChargeId()<0)&&(StringUntil.ifManager(tu.getId(),tt.getChargeId())))// The user now is the manager of the department to supervise the trouble ticket
  ){
    
    highlight=tt.getHighlight();
%>																
<tr  
<%
    if(highlight==0)
    {
%>
bgcolor="white" onMouseOver="this.className='lvtColDataHover'"
onMouseOut="this.className='lvtColData'"
<%
	}
	else if(highlight==1)
	{
 %>
bgcolor="yellow" 
 <%
 }
  %>
  id="row_38">
<td width="2%">
<input type="checkbox" NAME="selected_id" id="38" value='<%=tt.getId().toString() %>'/>
</td>
<td id="td_id_<%=tt.getId().toString() %>" ><%=tt.getTtNo().toString()%></td>
<td id="td_name_<%=tt.getId().toString() %>" >
		<div id="a_function_175" style="display: inline;">
		<a   href="TTManageCheckAction_getTtById.action?checkId=<%=tt.getId()%>&<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"175")%>"><%=tt.getTitle().toString()%>
		</a> </div>
		<div id="text_function_175" style="display: inline;"><%=tt.getTitle().toString()%> </div>
		  
</td>
<td><%=StringUntilDatabase.getUserRnameByID(tt.getCreateId())%></td>
<td><% 
             if(tt.getChargeId()!=null&&tt.getChargeId()<0)
             {
           out.print( StringUntilDatabase.getGroupNameByID(StringUntil.isNull(tt.getChargeId()).replace("-",""),"")); 
             }else
             {
           out.print( StringUntil.isNull(StringUntilDatabase.getUserRnameByID(tt.getChargeId()))); 
          }%>
</td>
<td><%=StringUntilDatabase.getTextByid(tt.getPriority())%></td>
<td><%=StringUntilDatabase.getTextByid(tt.getStatus())%></td>
<td>
 
    　<div functionId="function_204" style="display: inline;"> <a   href="TTManageUpdateAction_getTtById.action?checkId=<%=tt.getId()%>&<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"204")%>">Edit | </a> </div> 
   <div functionId="function_95"  style="display: inline"><a  href='#' onclick="deletepro('<%=tt.getId().toString() %>');return false">Cancel |</a></div>
      
 <%

 // Receive
 if(tt.getStatus().equals(16)&&  // the ticket is created and has no supervisor
		   (
//		   (tt.getCreateId().equals(tu.getId())&&(tt.getChargeId()==null||tt.getChargeId()==0)) // The user is creator
//		   ||
		   ((tt.getChargeId()!=null&&tt.getChargeId()!=0&tt.getChargeId()<0)
		   &&(StringUntil.ifManager(tu.getId(),tt.getChargeId())))// The supervisor is the department and the user is the manager of this department
	         )||(tt.getStatus().equals(17)                                      // The ticket has a supervisor but has not been received
			 &&(tt.getChargeId()!=null&&tt.getChargeId().equals(tu.getId())))  // The user is the supervisor
 )
 {
	%>  
<a functionId="function_98"  href="TTManageSearchAction_SelfAssign.action?checkId=<%=tt.getId()%>&<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"98")%>">Receive | </a> 
 <%}
 
  if(tt.getStatus().equals(16)&&  // the ticket is created and has no supervisor
		   (
//		   (tt.getCreateId().equals(tu.getId())&&(tt.getChargeId()==null||tt.getChargeId()==0)) // The user is creator
//		   ||
		   ((tt.getChargeId()!=null&&tt.getChargeId()!=0&tt.getChargeId()<0)
		   &&(StringUntil.ifManager(tu.getId(),tt.getChargeId())))// The supervisor is the department and the user is the manager of this department
	         )
 )
 {
	%>    
<a functionId="function_139"  href="#" onclick="showTT_WIND(1,<%=tt.getId()%>,139,'<%=tt.getTitle().toString()%>','<%=tt.getChargeId() %>');return false;">Assign | </a>
 <%}
 
  if(tt.getChargeId()!=null&& // it has supervisor
		  tt.getChargeId().equals(tu.getId()) // the user is the supervisor
		  &&tt.getStatus()==17)               // the ticket has supervisor but has not been received
  {
	  %>
		<a functionId="function_99"  href="#" onclick="notAssign('<%=tt.getId().toString() %>');return false">Ignore | </a> 
		<a functionId="function_136"  href="#" onclick="showTT_WIND(2,<%=tt.getId()%>,139,'<%=tt.getTitle().toString()%>','<%=tt.getChargeId() %>');return false">Forward | </a> 
	　<%
  }
  
  if(tt.getStatus()==18&&                     // the ticket is in process
	 tt.getChargeId().equals(tu.getId()) // the user is the supervisor
  )
  {
	  %>
	    <!--<a functionId="function_167"  href="#" onclick="TreatmentSuccess(<%=tt.getId().toString() %>);return false">Successful | </a> 
	    --><a functionId="function_168"  href="#" onclick="showTT_WIND(3,<%=tt.getId()%>,139,'<%=tt.getTitle().toString()%>','<%=tt.getChargeId() %>');return false">Unsuccessful | </a> 
	  <%
  }
  
  // if the priority is urgent, it can be highlighted
  if(tt.getPriority()==24)
  {
	  if(tt.getHighlight()==1)
	  {
		 %>
		 <a functionId="function_138"  href="TTManageSearchAction_NoHighlight.action?checkId=<%=tt.getId()%>&<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"138")%>">Unhighlight | </a> 
		 <%
	  }else
	  {
         %>
        <a functionId="function_137"  href="TTManageSearchAction_Highlight.action?checkId=<%=tt.getId()%>&<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"137")%>">Highlight | </a> 
         <%
	  }
 }
  if(tt.getStatus().equals(20)){
  %><a functionId="function_204"  href="#" onclick="scoreTT('<%=tt.getId()%>');return false">Feedback |
   </td> 
   </tr>
  <%
  }
  }}
}%>

															</tbody>
															</table>
														</div>
														<table border=0 cellspacing=0 cellpadding=2 width=100%>
															<tr>
																<td style="padding-right: 20px" nowrap>
																	<input functionId="function_95" class="crmbutton small delete" type="button"
																		value="Cancel" onClick="massDelete();return false;" />

																</td>
																<td align="right" width=40%></td>
																<td align="right" width=40%></td>
															</tr>
														</table><%--
Operation
                 --%><script type="text/javascript">

                 function scoreTT(id)
				  {
				  $('#mb').attr('style','z-index: 4;');
				  $('#scoreTTGroup').show(100);
				  $('#scoreTTid').val(id);
				  }
                 
                 // Open the operation window
                // Assign the supervisor
              function showTT_WIND(type,id,functionId,title,oldChargeId)
              {
            	   var url="TTManage_Search_window.action?"+
                     "&<%=Constants.menu_Fid%>=<%=menu_Fid%>"+
                     "&<%=Constants.page_menu_ID%>=<%=page_menu_ID%>"+
                     "&<%=Constants.FunctionID%>="+functionId+
                     "&ttId="+id+
                     "&title="+title+
                     "&zptype="+type+
                     "&oldChargeId="+oldChargeId;
                   url=encodeURI(url);
			 // window.open(url,"test","width=500,height=560,resizable=0,scrollbars=0,top=45%,left=45%");
			     var width=500;
			     var height=500
			     if(functionId==139)
			     {
			    	 width=500;
			    	 height=150;
				 }
              openwindow(url,"",width,height);   
                }   
              function openwindow(url,name,iWidth,iHeight)
              {
              var url; 
              var name; 
              var iWidth; 
              var iHeight;
              var iTop = (window.screen.availHeight-30-iHeight)/2;
              var iLeft = (window.screen.availWidth-10-iWidth)/2; 
              window.showModalDialog(url,{doc:document,win:parent},'edge=raised;dialogHeight='+iHeight+'px;dialogWidth='+iWidth+'px;center=1;status=0;scroll=no;resizable=0;scrollbars=0');
              window.location.reload(); 
                 }           
                 </script>
													</td>
												</tr>
												<tr>
													<td>
														<table width="100%">
															<tr>
																<td>
			   <div id="Pagination" class="pagination">
                   <!-- subpage -->
               </div>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>

											 
										</td>

									</tr>
								</table>
							</form>
						</div>
					</div>
				</td>
				<td width="10%">
				</td>
			</tr>
		</table>
		
 <!--
Feedback
 --><div id="mb"  class="mb" style="display: none;"><%--
 layer
 --%>
 </div> 
   <div id="scoreTTGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="scoreTTSaveForm" action="<%=basePath %>TTManageSearchAction_ScoreTT.action?<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"95")%>" method="post" >
    <br />
    <input type="hidden" id="scoreTTid" name="ts.ttid" value=""/>
	&nbsp; &nbsp; &nbsp;
	Total (5): &nbsp; &nbsp; &nbsp;
	<input type="text" id="score" name="ts.score" value="3"/><br /><br />
	&nbsp; &nbsp; &nbsp;
	Professional: &nbsp; &nbsp; &nbsp;
	<input type="text" id="rate1" name="ts.rate1" value="3"/><br /><br />
	&nbsp; &nbsp; &nbsp;
	Timeliness: &nbsp; &nbsp; &nbsp;
	<input type="text" id="rate2" name="ts.rate2" value="3"/><br /><br />
	&nbsp; &nbsp; &nbsp;
	Attitude: &nbsp; &nbsp; &nbsp;
	<input type="text" id="rate3" name="ts.rate3" value="3"/><br /><br />
	<br /><br />
	
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="Cancel" onclick="$('#scoreTTGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input functionId="function_95" id="editMenuSave" class="save" type="submit" value="Enter"/>
  </form>
  </div>
		
  <!--
Delete
 --><div id="mb"  class="mb" style="display: none;"><%--
 Layer
 --%>
 </div> 
   <div id="deleteGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="deleteMenuSaveForm" action="<%=basePath %>TTManageSearchAction_Delete.action?<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"95")%>" method="post" >
    <br />
    <input type="hidden" id="deleteid" name="tt.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	Title: &nbsp; &nbsp; &nbsp;
	<input type="text" id="deletename" name="tt.title" value=""/><br /><br />
	<br /><br />
	
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="Cancel" onclick="$('#deleteGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input functionId="function_95" id="editMenuSave" class="save" type="submit" value="Delete"/>
  </form>
  </div> 
   <!--
Bulk Delete
 --><div id="mb"  class="mb" style="display: none;"><%--
 layer
 --%>
 </div> 
   <div id="massdeleteGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="massdeleteMenuSaveForm" action="<%=basePath %>TTManageSearchAction_MassDelete.action?<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"95")%>" method="post" >
    <br />
    <input type="hidden" id="massdeletename" name="tt.title" value=""/>
  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
    Are you sure to delete all the tickets?
	 <br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="Cancel" onclick="$('#massdeleteGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input functionId="function_95"  id="massdeleteMenuSave" class="save" type="submit" value="Delete"/>
  </form>
  </div>  
 
   <!--
Ignore
 --><div id="mb"  class="mb" style="display: none;"><%--
 layer
 --%>
 </div> 
   <div id="notAssignGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="" action="TTManageSearchAction_NotAssign.action?<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"99")%>" method="post" >
    <br />
    <input type="hidden" id="notAssignid" name="checkId" value=""/>
	&nbsp; &nbsp; &nbsp;
	<br /><br />
	
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="Cancel" onclick="$('#notAssignGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="" class="save" type="submit" value="Enter"/>
  </form>
  </div> 
 
   <!--
Forward
 --><div id="mb"  class="mb" style="display: none;"><%--
 Layer
 --%>
 </div> 
   <div id="forwardGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="" action="TTManageSearchAction_Forward.action?<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"136")%>" method="post" >
    <br />
    <input type="hidden" id="forwardid" name="checkId" value=""/>
	&nbsp; &nbsp; &nbsp;
	Description: &nbsp; &nbsp; &nbsp;<br />
	<textarea id="forwardReason" name="forwardReason"></textarea><br /><br />
	<br /><br />
	
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="Cancel" onclick="$('#forwardGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="" class="save" type="submit" value="Enter"/>
  </form>
  </div><%-- 
      Successful
    --%>
    <script type="text/javascript">
      function TreatmentSuccess(id)
      {
    	  $('#mb').attr('style','z-index: 4;');
		  $('#TreatmentSuccess').show(100);
		  $('#TreatmentSuccess #ttId').val(id);
       }
    </script>
    <div id="TreatmentSuccess" class="mb3" style="padding: 20px;display: none;">  
   <form id="" action="TTManageSearchAction_TreatmentSuccess.action?<%=StringUntil.menuUrl(page_menu_ID,menu_Fid,"167")%>" method="post" >
    <br /><%--
        ticket no.
    --%><input type="hidden" id="ttId" name="tt.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	Solution: &nbsp; &nbsp; &nbsp;<br />
	<div style="height: 170px;width: 300px;">
	<textarea id="ttSolution" name="tt.solution" class=":required" style="width: 300px;height:150px "></textarea>
	
	</div>
	<br /> 
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="Cancel" onclick="$('#TreatmentSuccess,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="" class="save" type="submit" value="Enter"/>
  </form>
  </div>
  

 
	
<script type="text/javascript">
 
  
 </script>


		<%--
body
--%>
		<jsp:include page="../page/down.jsp" flush="true"></jsp:include>
	</body>
</html>
 
 
	  ${ifalert}
	  ${ifalert2}
<script type="text/javascript">


/*privilege management */
$(function(){
　 var fIds="<%=StringUntil.getMenuSid3(new Integer(page_menu_ID))%>";

           
			 if(fIds.indexOf('175')>-1)
			  {
				 $("div[id='a_function_175']").remove()
				 
			  }else
			  {
				  $("div[id='text_function_175']").remove()
			  }	
			    
	 	  fIds=fIds.split(",");
 
	  for(var i=0;i<fIds.length;i++)
	   {
		 if(fIds[i]!='')
		 {
			 $("body [functionId='function_"+fIds[i]+"']").remove();  
	     }
	   }



	  
	   
});



</script>
