<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<% 
exec="select * from pxxm where id="& request.QueryString("id") 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script charset="utf-8" src="../edit/kindeditor.js"></script>
<script charset="utf-8" src="../edit/lang/zh_CN.js"></script>
<script charset="utf-8" src="../edit/plugins/code/prettify.js"></script>
<script charset="utf-8" src="js/e.js"></script>
<title>修改信息</title>
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
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE5 {color: #FF0000}
-->
</style>
<script src="images/color.js" type="text/javascript"></script>
</head>
<body>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[课程设置信息修改]</td>
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
        <form  name="addform" method="post" action="pxxm_updata.asp">
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="28" width="8%" class="td">信息标题</td>
        <td width="92%"  class="td">
          <input name="title" type="text" value="<%=rs("title")%>" size="40"  />
          
          <label>
          <input name="id" type="hidden" id="id" value="<%=rs("id")%>" />
          </label></td>
      </tr>
     <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" width="8%" class="td">信息来源</td>
        <td class="td"><input name="ly" type="text" value="<%=rs("ly")%>" size="30"  /></td>
      </tr>
   <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="13" class="td">发布作者</td>
        <td class="td"> <input name="zz" type="text" value="<%=rs("zz")%>" size="30"  /></td>
      </tr>
     <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" class="td">信息内容</td>
        <td class="td"><textarea name="body" style="width:700px;height:270px;visibility:hidden;"><%=rs("body")%></textarea></td>
      </tr>
       <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
          <td height="12" class="td">&nbsp;</td>
          <td class="td"><input type="submit" name="button" id="button" value="确认修改"  class="button"/></td>
        </tr>
    </table>
    </form>
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