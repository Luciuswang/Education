<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="seeion.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台管理 </title>
<link href="Css/Style1.css" rel="stylesheet" type="text/css" />
</head>
<%Dim ID
ID=	trim(request("ID"))
if ID="" then
ID="FileName"
end if
 %>
<script language="JavaScript">
function checkFileEx(){
 var  value=MyForm.File1.value;
  var ExtentName = value.toLowerCase().substr(value.length-4)
  if(!(ExtentName == ".png" || ExtentName == ".jpg" || ExtentName == ".gif" || ExtentName == ".bmp" )){
      alert("上传文件类型错误！");
     return false;
   } 
   else 
   {
   document.form.submit.click();   
   }
}
 </Script> 
<script language="javascript">
<!--
function ShowProgress() {
	var ProgressID = (new Date()).getTime() % 1000000000;
	var Form = document.MyForm;
	Form.action = "UpLoad.asp?ProgressID=" + ProgressID+"&id=<%=ID%>";
}
//-->
</script><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-size: 12px;
}
-->
</style>
<body>
<%if not request("value")<>"" then%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<form onSubmit="return ShowProgress();" action="Upload.asp" enctype="multipart/form-data" method="post" name="MyForm">
        <tr>
          <td id="objFiles" align="left"><input type="file" name="File1" style="background:#FFFFFF; border:1px solid #999; width:250px;">&nbsp;&nbsp;&nbsp;<input type="button" name="upload" value="上传"  style="background:url(images/but.gif);width:73px;height:21px;border:0px; color:#333333;"  onclick="checkFileEx();"> <input   type="submit"   id="submit"   style="display:none;">  
          允许上传格式：jpg|gif|png|bmp</td>
        </tr>
	</form>
      </table><%else%><table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td align="left"><input name="<%= ID %>" type="text" class="input3" value="<%=request("value")%>" title="：：：双击查看：：：" ondblclick="window.open('../<%=request("value")%>','_blank')" style="cursor:pointer;" />
      <input type="button" value="删除" class="but" onclick="window.open('deletefile.asp?file=../<%=request("value")%>','_blank');parent.form.<%=trim(request.QueryString("id"))%>.value='';self.location='UpLoadPic.asp?id=<%=trim(request.QueryString("id"))%>';" /></td></tr></table><%end if%>

</body>
</html>