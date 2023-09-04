<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<% 
id=request.QueryString("id")

exec="select * from [gbook] where id="&id 
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
<title>回复问题</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[问题回复]</td>
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
        <form  name="hf" method="post" action="gbook_hf_ok.asp">
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="28" width="11%" class="td">问题标题</td>
        <td width="89%"  class="td">&nbsp;<%=rs("title")%><input name="id" type="hidden" id="id" value="<%=rs("id")%>" /></td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" width="11%" class="td">留言姓名</td>
        <td class="td">&nbsp;<%=rs("ly_name")%></td>
      </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" class="td">联系电话</td>
        <td class="td">&nbsp;<%=rs("tel")%></td>
    </tr>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" class="td">联系邮箱</td>
        <td class="td">&nbsp;<%=rs("email")%></td>
      </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" class="td">留言时间</td>
        <td class="td">&nbsp;<%=rs("data")%></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
      <td height="13" class="td">留言内容</td>
      <td class="td"><label><%=rs("body")%></label></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
      <td height="12" class="td">回复内容</td>
      <td class="td"><textarea name="hf_gbook" cols="40" rows="8"><%=rs("hf_gbook")%></textarea></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
      <td height="25" class="td">&nbsp;</td>
      <td class="td"><label>
        <input type="submit" name="button" id="button" value="回复留言" class="button"/>
      </label></td>
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