<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<% 
id=request.QueryString("id")

exec="select * from [online] where id="&id 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
if rs.eof and rs.bof then
Response.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>" 
Response.End()
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>在线报名信息修改</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[在线报名信息修改]</td>
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
        <form  name="add" method="post" action="online_updata.asp">
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
          <tr onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
            <td height="28" width="13%" class="td">ID：</td>
            <td width="87%"  class="td"><%=rs("id")%><input name="id" type="hidden" id="id" value="<%=rs("id")%>" /></td>
          </tr>
          <tr onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
            <td height="25" width="13%" class="td">姓名：</td>
            <td class="td"><input name="xy_name" type="text" size="20" value="<%=rs("xy_name")%>"  /></td>
          </tr>
          <tr onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
            <td height="25" width="13%" class="td">性别：</td>
            <td class="td"><input name="sex" type="text" size="20" value="<%=rs("sex")%>"  /> 
         </td>
          </tr>
          <tr onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
            <td height="25" class="td">学历：</td>
            <td class="td"><input name="xy_xl" type="text" size="20" value="<%=rs("xy_xl")%>"  /></td>
          </tr>
         <tr onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
            <td height="25" class="td">年龄：</td>
            <td class="td"><input name="xy_ages" type="text" size="20" value="<%=rs("xy_ages")%>"  /></td>
      </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" class="td">意愿学习课程：</td>
        <td class="td"><input name="yykc" type="text" id="yykc" value="<%=rs("yykc")%>" size="20"  /></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
      <td height="25" class="td">手机：</td>
      <td class="td"><input name="shouji" type="text" size="20" value="<%=rs("shouji")%>"  /></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
      <td height="25" class="td">固定电话：</td>
      <td class="td"><label>
        <input name="qh" type="text" value="<%=rs("qh")%>" size="4" /> - <input name="tel" type="text" value="<%=rs("tel")%>" size="8" />
      </label></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
      <td height="25" class="td">通讯地址：</td>
      <td class="td"><input name="address" type="text" value="<%=rs("address")%>" size="40" /></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
      <td height="25" class="td">报名时间：</td>
      <td class="td"><%=rs("data")%></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
      <td height="25" class="td">处理状态：</td>
      <td class="td"><input type="radio" name="zt" value="0" <% if rs("zt")=0 then %>checked="checked" <% end if%> />未处理<input type="radio" name="zt" value="1" <% if rs("zt")=1 then %>checked="checked" <% end if%> />已处理
      </td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
      <td height="25" class="td">&nbsp;</td>
      <td class="td"><input type="submit" name="button" id="button" value="更新资料" class="button"/></td>
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