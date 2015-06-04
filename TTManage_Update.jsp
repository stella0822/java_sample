<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
 
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="ttmanage.action.I.TTManageSearchActionI"%>
<%@page import="ttmanage.database.TTroubleticket"%>
<%@page import="ttmanage.database.TDocument"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.Constants"%>
<%@page import="ttmanage.database.TTtHistory"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

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
String page_MENU_ID="1";

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
TTManageSearchActionI sch=(TTManageSearchActionI)wac.getBean("TTManageSearchActionImp");
List list0=(List)request.getAttribute("searchtt");
TTroubleticket tt= (TTroubleticket)list0.get(0);

List list1=(List)request.getAttribute("searchtt2");

List list2=(List)request.getAttribute("searchtt3");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>Edit</title>

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


<style>
	#feedback { font-size: 1.4em; }
	#selectable .ui-selecting { background: #FECA40; }
	#selectable .ui-selected { background: #F39814; color: white; }
	#selectable { list-style-type: none; margin: 0; padding: 0; list-style:none;}
	#selectable li { margin: 3px; padding: 1px; float: left; width: 230px; height: 30px; font-size: 1em; text-align: left; list-style-type:none; list-style:none;}
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
	height: 100%;
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
		<script type="text/javascript" src="include/js/checkDate.js"></script>
		<script type="text/javascript" src="include/js/showdate.js"></script>
		<link rel="stylesheet" href="themes/softed/style.css" type="text/css"></link>
		
		<link rel="stylesheet" href="<%=basePath %>js/autopoint/autopoint.css" type="text/css"></link>
        <script src="<%=basePath %>js/autopoint/autopoint.js"></script>
 
	<script src="js/chickFrom/vanadium.js"></script>
	<link rel="stylesheet" href="js/chickFrom/css/chickFrom.css" type="text/css"></link>

		<script type="text/javascript" src="js/ajaxfileupload.js"></script>

	</head>
	<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 class=small>
		<!-- header - master tabs -->
		<%--
 menu
--%>
		<jsp:include page="../page/menu.jsp" flush="true">
        <jsp:param value="<%=page_MENU_ID %>" name="page_MENU_ID"/>
		</jsp:include><%--
 body
--%>

		<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
			<tr>
				<td width="17%" valign=top>
					&nbsp;
				</td>
				<td class="showPanelBg" valign="top" style="padding: 13px;">
					<!-- SIMPLE SEARCH -->

					<div id="searchAcc" class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px;">
						<form action="<%=basePath %>TTManageUpdate_Update.action?<%=StringUntil.menuUrl("186")%>" method="get" >
						
						
						
						<table border=0 cellspacing=0 cellpadding=0 width=95% align=center>
    <tr>
      <td><table border=0 cellspacing=0 cellpadding=3 width=100% class="small">
          <tr>
            <td class="dvtTabCache" style="width:10px" nowrap>&nbsp;</td>
            <td class="dvtSelectedCell" align=center nowrap> Information </td>
            <td class="dvtTabCache" style="width:10px">&nbsp;</td>
            <td class="dvtTabCache" style="width:100%">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td valign=top align=left ><table border=0 cellspacing=0 cellpadding=3 width=100% class="dvtContentSpace">
          <tr>
            <td align=left><table border=0 cellspacing=0 cellpadding=0 width=100%>
                <tr>
                  <td id ="autocom"></td>
                </tr>
                <tr>
                  <td style="padding:10px"><!-- General details -->
                    <table border=0 cellspacing=0 cellpadding=0 width=100% class="small">
                      <tr>
                      
                        <td  colspan=4 style="padding:5px"><div align="center">
                            <input title="Enter [Alt+S]" accessKey="S" class="crmButton small save" 
							onclick="this.form.action.value='Save'; displaydeleted(); return formValidate() " type="submit" name="button" value="  Enter  " style="width:70px" >
                            <input title="Cancel [Alt+X]" accessKey="X" class="crmbutton small cancel" onClick="deletefiles(); window.location='TTManage_Search.action?menu_Fid=68&page_menu_ID=75'" type="button" name="button" 
							value="Cancel  " style="width:70px">           
<%
Integer ii=0;
ii=tt.getStatus();
if(ii==20)
{
 %>
							<input title="ForwardToFAQ" class="crmbutton small save"
							onclick="convertToFAQ('<%=tt.getTitle() %>',' ','<%=tt.getId() %>')"
							type="button" name="button" value="  ForwardToFAQ  " style="width:70px;" >
<%} %>     
                          </div></td>
                      </tr>
                      <!-- included to handle the edit fields based on ui types -->
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>Information</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px" >
                        <td width=20% class="dvtCellLabel" align=right>
						<font color="red"></font> No. </td>
                        <td align=left class="dvtCellInfo">
							 <input name="tt.ttNo" value="<%=tt.getTtNo() %>" readonly style="width: 190px">
                        </td>
                         
                      
                     
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font> Title </td>
                        <td align=left colspan="3" class="dvtCellInfo">
							 <input name="tt.title" value="<%=tt.getTitle() %>" style="width: 190px">
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right>  Status </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<select name="tt.status" tabindex="" class="small" style="display:block; width:90%">
                        	<%=StringUntilDatabase.getDepartmenOption("4",tt.getStatus().toString()) %>
                        	</select>
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font> Priority </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<select name="tt.priority" tabindex="" class="small" style="display:block; width:90%">
                        	<%=StringUntilDatabase.getDepartmenOption("5",tt.getPriority().toString()) %>
                        	</select>
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font> Product Name </td>
                        <td width="30%" align=left class="dvtCellInfo">
							 
				<input name="tt.proId" id="product_id" type="hidden" value="<%=tt.getProId() %>">
				<input readonly name="product_name" id="product_name" type="text" value="<%=StringUntilDatabase.getProNameByID(tt.getProId()) %>" class=":required" style="width: 190px" >&nbsp;
				<img tabindex="" src="themes/softed/images/select.gif" alt="Select" title="Select" LANGUAGE=javascript onclick='return window.open("TTManage_Create_addpro.action","test","width=640,height=640,resizable=0,scrollbars=0,top=150,left=200");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
				<input type="image" src="themes/softed/images/clear_field.gif" alt="Clear" title="Clear" LANGUAGE=javascript onClick="this.form.product_id.value=''; this.form.product_name.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			
                        </td>
						<td width=20% class="dvtCellLabel" align=right>Supervisor </td>
                        <td width=30% align=left class="dvtCellInfo">
                        
				<input name="tt.chargeId" id="user_id" type="hidden" value="<%=tt.getChargeId() %>">
				<input readonly name="user_name" id="user_name" type="text" value="<%=StringUntilDatabase.getUserRnameByID(tt.getChargeId()) %>">&nbsp;
				<img tabindex="" src="themes/softed/images/select.gif" alt="Select" title="Select" LANGUAGE=javascript onclick='return window.open("TTManage_Create_adduser.action","test","width=640,height=640,resizable=0,scrollbars=0,top=150,left=200");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
				<input type="image" src="themes/softed/images/clear_field.gif" alt="Clear" title="Clear" LANGUAGE=javascript onClick="this.form.user_id.value=''; this.form.user_name.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			
					  </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font> Contact </td>
                        <td width="30%" align=left class="dvtCellInfo">
							 <input name="tt.contactName" value="<%=tt.getContactName() %>" style="width: 190px">
							
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font> Phone </td>
                        <td width="30%" align=left class="dvtCellInfo">
							 <input name="tt.contactPhonenum" value="<%=tt.getContactPhonenum() %>" functionId="function_194" readonly style="width: 190px">
                        </td>
                      </tr>
                      <tr style="height:25px">
                      <td width="20%" class="dvtCellLabel" align=right> Company </td>
                        <td width="30%" align=left class="dvtCellInfo">
                        
				<input name="tt.corpId" id="corp_id" type="hidden" value="<%=tt.getCorpId() %>">
				<input readonly name="corp_name" id="corp_name" type="text" value="<%=StringUntilDatabase.getCorpNameByid(tt.getCorpId()) %>" >&nbsp;
				<img tabindex="" src="themes/softed/images/select.gif" alt="Select" title="Select" LANGUAGE=javascript onclick='return window.open("TTManage_Create_addcorp.action","test","width=640,height=640,resizable=0,scrollbars=0,top=150,left=200");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
				<input type="image" src="themes/softed/images/clear_field.gif" alt="Clear" title="Clear" LANGUAGE=javascript onClick="this.form.corp_id.value=''; this.form.corp_name.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			
						</td>
                        <td width="20%" class="dvtCellLabel" align=right> Creator </td>
                        <td width="30%" align=left class="dvtCellInfo">
							 <input name="tt.createId" value="<%=StringUntilDatabase.getUserRnameByID(tt.getCreateId()) %>" readonly style="width: 190px">
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font> Time </td>
                        <td width="30%" align=left class="dvtCellInfo">
							 <input name="tt.createTime" value="<%=tt.getCreateTime() %>" readonly style="width: 190px">
                        </td>
                      </tr>
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>Detail</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right>
						<font color="red">*</font> Description </td>
                        <td colspan=3 class="dvtCellInfo">
							 <textarea class="detailedViewTextBox" onFocus="this.className='detailedViewTextBoxOn'" name="tt.description" 
						 onBlur="this.className='detailedViewTextBox'"><%=tt.getDescription() %></textarea>
                        </td>
                      </tr>
					  <!--Attach-->
					   <tr>
                        <td colspan=4 class="detailedViewHeader"><b>Attach</b> </td>
                      </tr>
                       <tr style="height:25px">

										<td width=20% class="dvtCellLabel" align=right >
										<font color="red"></font> Attach List </td>
										<td colspan=3 valign="top" class="dvtCellInfo" >
<script type="text/javascript"> 
function check_radio(type)
{
	switch(type){
		case 1:
			$("#level1").attr("checked","checked");
			$("#faqLevel").val("1");
			break;
		case 2:
			$("#level2").attr("checked","checked");
			$("#faqLevel").val("2");
			break;
		case 3:
			$("#level3").attr("checked","checked");
			$("#faqLevel").val("3");
			break;
	}
}
function convertToFAQ(title,des,ttid)
{
	$('#mb').attr('style','z-index: 4;');
	$("#tt_titleFAQ").val(title);
	$("#tt_desFAQ").val(des);
	$('#faqGroup').show(100);
	$("#faq_ttid").val(ttid);
}


// Upload
	function ajaxFileUpload()
	{ 
		
	if ($("#file").val()!="") {
    var m="";
		$("#loading").show();
         $.ajaxFileUpload
		 (
			{
				url:'upload.action',
				secureuri:false,
				fileElementId:'file',
				dataType: 'json',
				success: function (data, status)  //服务器成功响应处理函数
				{
				     m=data.message;
					if(typeof(data.error) != 'undefined')
					{
						if(data.error != '')
						{
							alert(data.error);
						}else
						{
							alert(data.message);
						}
						return ;
					}
				 	$("#loading").hide();
					if ( m.lastIndexOf(".")!=-1  ) 
					{  
						 var href= $("#downA").attr("href");
						 var fileNames=m.split(",");
						 $("#downA").attr("href",href+fileNames[1]);
						  var path2=fileNames[1].split(".");
						  var h="<li id=\""+path2[0]+"\" class='ui-state-default'>【"+fileNames[0]+"】<a href='#'  onclick=\"delUpload('"+fileNames[1]+"','"+fileNames[0]+"');return false;\" >删除</a></li>";
						  
						  $("#selectable").append(h);
						   
 
						  $("#fileNamelist").val($("#fileNamelist").val()+fileNames[1]+",");
						  $("#fileNamelist2").val($("#fileNamelist2").val()+fileNames[0]+","); 
						  
 	}else
					{
					  $("#f1").text(m);
				     } 
				},
				error: function (data, status, e)
				{
					alert(e);
				}
			}
			)
	}else
		{
			 //$("#form1").submit();

	    }
		return false;
	}

function deletefiles(){
var list=($("#fileNamelist").val()).split(",");
var i;
for(i=0;i<list.length-1;i++){
     delUpload( list[i]);
}
		}

       function delUpload(path,path0)
       {
               $.post("FileAction_del.action",{
                        "path":"interim/upload/"+path
                   },function(data){
                       var path2=path.split(".");
                       $("#"+path2[0]).remove();
                       
                       var str1=$("#fileNamelist").val();
                       var str2=$("#fileNamelist2").val();
                       path=path+",";
                       path0=path0+",";
                       str1=str1.split(path)[0]+str1.split(path)[1];
                       str2=str2.split(path0)[0]+str2.split(path0)[1];
					$("#fileNamelist").val(str1);
					$("#fileNamelist2").val(str2);
                         });
           

        }

function deletedoc(doc_newname,doc_oldname,t)
{
	$('#mb').attr('style','z-index: 4;');
	$('#deleteGroup').show(100);
	//alert(doc_oldname);
	//alert(doc_newname);
	$('#deletename').val(doc_oldname);
	$('#delete_realname').val(doc_newname);
}  

function delUpload2(path)
{
        $.post("FileAction_del.action",{
                 "path":"upload/"+path
            },function(data){
                var path2=path.split(".");
                $("#"+path2[0]).remove();

                  });
        
        $('#deleteGroup,#mb').hide(100);
        
        $.post("FileAction_deldoc.action",{
            "docpath":path
       },function(data){
alert(data);
             });

 }

function saveComments(id)
{
	var str=$('#forSaveComments').val();
	$.post("TTManageUpdate_UpdateComments.action",{
        "comments":str,"ttIdComments":"<%=tt.getTtNo() %>","ttId":id
   },function(data){
       var str=data.split("*");
       alert(str[1]);
       $('#comments_div').html(str[0]);
       $('#forSaveComments').val(" ");
         });
}

</script>
<ul id="selectable">
<%
int i;
String pathstr;
String[] pathstr2=new String[2];
for(i=0;i<list1.size();i++){
	TDocument tt2= (TDocument)list1.get(i);
	pathstr=tt2.getNewName().toString();
	pathstr2=pathstr.split("\\.");
	pathstr=pathstr2[0];
%>
<li id="<%=pathstr %>" class='ui-state-default'>【<a href='download.action?fileName=<%=tt2.getNewName() %>' ><%=tt2.getOldName() %></a>】<a href='#' onclick="deletedoc('<%=tt2.getNewName() %>','<%=tt2.getOldName() %>','<%=tt.getTtNo()%>');return false" >删除</a></li>
<%} %>
</ul>
<input type="hidden" id="fileNamelist" value="" name="doc.newName">
<input type="hidden" id="fileNamelist2" value="" name="doc.oldName">
</td>
                   </tr>
               <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right><font color="red"></font> Attach </td>
                        <td colspan=3 class="dvtCellInfo">
                         <s:file id="file" name="file" ></s:file> 
                         <input name="" type="button" value="Upload" style="height: 18.5px" onclick="ajaxFileUpload();"> 
                         <img src="img/loading.gif" id="loading" style="display: none;">
						 <label id="f1"></label>
                        </td>
                      </tr>
                   
                   
                   
                   
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>Solution</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right><font color="red"></font> Solution </td>
                        <td colspan=3 class="dvtCellInfo">
							 <textarea class="detailedViewTextBox" onFocus="this.className='detailedViewTextBoxOn'" name="tt.solution" 
						 onBlur="this.className='detailedViewTextBox'" ><%=tt.getSolution() %></textarea>
                        </td>
                      </tr>
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan=4 class="dvInnerHeader"><b>Comment</b> </td>
                      </tr>
                      <tr>
                        <td colspan=4 class="dvtCellInfo"><div id="comments_div" style="overflow: auto;height:200px;width:100%;">
                            <%=tt.getComment() %>
                          </div></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>Comment</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right><font color="red"></font> Addition </td>
                        <td colspan=3 class="dvtCellInfo">
						
						 <textarea class="detailedViewTextBox" onFocus="this.className='detailedViewTextBoxOn'" id="forSaveComments" 
						 onBlur="this.className='detailedViewTextBox'"></textarea>
						 <div align="center">
                            <input title="Enter [Alt+S]" accessKey="S" class="crmButton small save" 
							onClick="saveComments('<%=tt.getId() %>')" type="button" name="button" value=" Enter    " style="width:75px">
                          </div>
                          
                        </td>
                      </tr>
                      <!-- Added to display the Product Details in Inventory-->
					  <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>History</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr  >
                       <td colspan=4    > 
					     <table border=0 cellspacing=1 cellpadding=3 width=100% class="lvt small">
						 <tr>
                      <td width="20%" class="lvtCol"><a href='javascript:;'  class='listFormHeaderLinks'>Time</a></td>
                      <td width="20%" class="lvtCol"><a href='javascript:;'  class='listFormHeaderLinks'>User</a></td>
                      <td class="lvtCol"><a href='javascript:;'  class='listFormHeaderLinks'>Comment</a></td>
                     
                    </tr>
<%
int j;
for(j=0;j<list2.size();j++){
	TTtHistory tt2= (TTtHistory)list2.get(j);
%>
					  <tr bgcolor=white onMouseOver="this.className='lvtColDataHover'" onMouseOut="this.className='lvtColData'" id="row_38">
                      <td><%=tt2.getUpdateDate() %></td>
                      <td><%=StringUntilDatabase.getUserRnameByID(tt2.getUpdateUserId()) %></td>
                      <td><%=tt2.getComment() %></td>
					   </tr>
<%} %>					    
					     </table>
					   
                        </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
						
						
						
						</form>
						
					</div>
				</td>
				<td width="17%">
				</td>
			</tr>
		</table>


 <!--
Delete
 --><div id="mb"  class="mb" style="display: none;">
 </div> 
   <div id="deleteGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <br />
    <input type="hidden" id="delete_realname" name="delete_realname" value=""/>
	&nbsp; &nbsp; &nbsp;
	&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;Attach Name: &nbsp; &nbsp; &nbsp;
	<input type="text" disabled="disabled" id="deletename" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;Are you sure to delete the attach?
	 <br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="Cancel" onclick="$('#deleteGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="deleteMenuSave" class="save" type="submit" value="Delete" onclick="delUpload2($('#delete_realname').val())"/>
  </div> 


<!--
FAQ
 --><div id="mb"  class="mb" style="display: none;">
 </div> 
   <div id="faqGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
 <form id="" action="<%=basePath %>FAQAction_save.action" method="post" >
   <br />
   	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;Title: &nbsp;&nbsp;&nbsp;
   	<input type="text" id="tt_titleFAQ" name="faq.title"/><br /><br />
   	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;Keyword: 
   	<input type="text" id="keyFAQ" name="faq.keyword"/><br /><br />
   	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;Addition: &nbsp;<br />
   	&nbsp;&nbsp;<textarea id="tt_desFAQ" name="faq.text"></textarea><br /><br />
   	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;Level: 
   	<input type="hidden" id="faqLevel" name="faq.sharingLevel" value="1"/>
   	<input type="hidden" id="faq_ttid" name="faq.ttid" value=""/>
   	<input type="radio" id="level1" name="level" checked onclick="check_radio(1)">&nbsp; &nbsp; &nbsp;Individual
   	<input type="radio" id="level2" name="level" onclick="check_radio(2)">&nbsp; &nbsp; &nbsp;Department
   	<input type="radio" id="level3" name="level" onclick="check_radio(3)">&nbsp; &nbsp; &nbsp;Public<br /><br />
     &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
	<input class="delete" type="button" value="Cancel" onclick="$('#faqGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="deleteMenuSave" class="save" type="submit" value="Enter" onclick=""/>
</form>
  </div>
		<%--
body
--%>
		<jsp:include page="../page/down.jsp" flush="true"></jsp:include>
	</body>
</html>
<script type="text/javascript">
var test = function ()
{   
	  
	     var fIds="<%=tu.getFuncitonS()%>";
	    
	      fIds=fIds.split(",");
	      for(var i=0;i<fIds.length;i++)
	       {
	         $("body [functionId='function_"+fIds[i]+"']").removeAttr("disabled");
	         $("body [functionId='function_"+fIds[i]+"']").removeAttr("readonly");
	       } 
}
 $(function(){
	   setTimeout(test,10); 
 });
</script>
