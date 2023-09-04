<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网站所在服务器信息</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size:12px;
}
.button{font-size:12px; background:url(button.gif); border:1px solid #BDC5CA; height:23px;  color:#333333}
.STYLE3 {font-size: 12px; font-weight: bold; }
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" id="css" href="images/style.css">
<style type="text/css">
<!--
.STYLE6 {color: #000000}
-->
</style>
</head>
<body>
<%
Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function
Function IsObjInstalled(strClassString)
 On Error Resume Next
 IsObjInstalled = False
 Err = 0
 Dim xTestObj
 Set xTestObj = Server.CreateObject(strClassString)
 If 0 = Err Then IsObjInstalled = True
 Set xTestObj = Nothing
 Err = 0
End Function
Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function
%>
<%
	Dim theInstalledObjects(17)
    theInstalledObjects(0) = "MSWC.AdRotator"
    theInstalledObjects(1) = "MSWC.BrowserType"
    theInstalledObjects(2) = "MSWC.NextLink"
    theInstalledObjects(3) = "MSWC.Tools"
    theInstalledObjects(4) = "MSWC.Status"
    theInstalledObjects(5) = "MSWC.Counters"
    theInstalledObjects(6) = "IISSample.ContentRotator"
    theInstalledObjects(7) = "IISSample.PageCounter"
    theInstalledObjects(8) = "MSWC.PermissionChecker"
    theInstalledObjects(9) = "Scripting.FileSystemObject"
    theInstalledObjects(10) = "adodb.connection"
    
    theInstalledObjects(11) = "SoftArtisans.FileUp"
    theInstalledObjects(12) = "SoftArtisans.FileManager"
    theInstalledObjects(13) = "JMail.SMTPMail"
    theInstalledObjects(14) = "CDONTS.NewMail"
    theInstalledObjects(15) = "Persits.MailSender"
    theInstalledObjects(16) = "LyfUpload.UploadFile"
    theInstalledObjects(17) = "Persits.Upload.1"
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE6"><span class="STYLE3">你当前的位置</span>：[网站服务器信息查看]</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
        <%
    Dim strClass
    strClass = Trim(Request.Form("classname"))
    If "" <> strClass then%>
      <table width="100%" border="0" cellspacing="1" align="center" class="font" bgcolor="#000000">
	  <tr bgcolor="#FFFFFF">
	  <td bgcolor="#EFEBFF" class="docbutton">
    <%Response.Write "<br>您指定的组件的检查结果："
      If Not IsObjInstalled(strClass) then 
        Response.Write "<br><font color=red>很遗憾，该服务器不支持" & strclass & "组件！</font>"
      Else
        Response.Write "<br><font color=green>恭喜！该服务器支持" & strclass & "组件。</font>"
      End If
      Response.Write "</td></tr></table>"
      end if
%>
        <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" >                
          <tr>
             <td height="25" width="10%" class="td">程序绝对路径:</td>
             <td width="36%"  class="td"><%=Server.MapPath("xycms.asp")%></td>
             <td width="12%"  class="td">服务器脚本引擎：</td>
             <td width="42%"  class="td"><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
          </tr>
          <tr>
             <td height="25" width="10%" class="td">请求机器IP地址：</td>
             <td class="td"><%=request.ServerVariables("REMOTE_ADDR")%></td>
             <td class="td">服务器内部IP：</td>
             <td class="td"><%=Request.ServerVariables("LOCAL_ADDR")%></td>
          </tr>
          <tr>
             <td height="25" width="10%"  class="td">SCRIPT虚拟路径：</td>
             <td class="td"><%=request.ServerVariables("SCRIPT_NAME")%></td>
             <td class="td">服务器IP地址：</td>
             <td class="td"><%=request.ServerVariables("SERVER_NAME")%></td>
          </tr>
          <tr>
             <td height="25" width="10%" class="td">服务器端口：</td>
             <td class="td"><%=request.ServerVariables("SERVER_PORT")%></td>
             <td class="td">协议名称和版本：</td>
             <td class="td"><%=request.ServerVariables("SERVER_PROTOCOL")%></td>
          </tr>
          <tr>
             <td height="25" class="td">FSO文本读写：</td>
             <td  class="td">
				<% if IsObjInstalled("Scripting.FileSystemObject") = False Then
				 response.Write("<font color=#aaaaaa><b>×</b></font>")
                 Else 
                 response.Write("<b>√</b>")
                 End If %></td>
                 <td  class="td"><%If IsObjInstalled("JMail.Message") Then%>
                 Jmail4.3组件支持：
                   <%else%>Jmail4.2组件支持：<%end if%></td>
                 <td  class="td">
<%If IsObjInstalled("JMail.Message") or IsObjInstalled("JMail.SMTPMail") Then%>
<b>√</b>
<%else%>
<font color=#aaaaaa><b>×</b></font>
<%end if%></td>
               </tr>
              </table>
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>&nbsp;</td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[网站版权信息]</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
          <table cellpadding="6" cellspacing="5" border="0" width="100%">
            <tr>
              <td width="11%">网站版权所有：</td>
              <td width="89%">XYCMS工作室</td>
            </tr>
            <tr>
              <td>源码技术支持：</td>
              <td>XY &nbsp;&nbsp;联系QQ:364500483</td>
            </tr>
          </table>
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>&nbsp;</td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
