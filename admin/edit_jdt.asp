<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<% 
id=request.QueryString("id")

exec="select * from jdt where id="& id 
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
<title>修改幻灯</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[网站首页焦点图片修改]</td>
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
        <form name="addform" method="post" action="jdt_updata.asp">
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="28" width="8%" class="td">焦点图名称</td>
        <td width="92%"  class="td">
          <input name="title" type="text" value="<%=rs("title")%>" size="30"  />
          <input name="id" type="hidden" value="<%=rs("id")%>" size="30"  /></td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" width="8%" class="td">图片地址</td>
        <td class="td"><iframe src='UpLoadPic.asp?id=img&value=<%=rs("img")%>' frameborder=0 scrolling=no width='100%' HEIGHT='25'></iframe><input type="hidden" name="img" value="<%=rs("img")%>" /></td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" width="8%" class="td">链接地址</td>
        <td class="td"><input name="link" type="text" value="<%=rs("link")%>" size="30"  /> 
          空链接请用#号</td>
      </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" class="td">排序ID</td>
        <td class="td"><input name="pl_id" type="text" value="<%=rs("pl_id")%>" size="10"  /></td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" class="td">&nbsp;</td>
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
<% 
if Request.QueryString("add_jdt")="ok" then
set rs=server.createobject("adodb.recordset")
sql="select title,link,img,pl_id,tim from jdt"
rs.open sql,conn,1,3
title=request.form("title")
link=request.form("link")
img=request.form("img")
pl_id=request.form("pl_id")
if title=""  then 
response.Write("<script language=javascript>alert('广告标题不能为空!');history.go(-1)</script>") 
response.end 
end if
if link=""  then 
response.Write("<script language=javascript>alert('链接地址不能为空!');history.go(-1)</script>") 
response.end 
end if
if img="" then 
response.Write("<script language=javascript>alert('图片地址不能为空!');history.go(-1)</script>") 
response.end 
end if
if pl_id="" then 
response.Write("<script language=javascript>alert('排序ID不能为空!');history.go(-1)</script>") 
response.end 
end if
IF not isNumeric(request("pl_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs.addnew
rs("title")=title
rs("link")=link
rs("img")=img
rs("pl_id")=pl_id
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('广告添加成功！点击继续添加！');window.location.href='add_jdt.asp';</script>" 
end if
%> 