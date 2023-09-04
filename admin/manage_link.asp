<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>文字链接管理</title>
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
            <td width="90%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="2%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="88%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[网站友情链接管理]</td>
                <td width="2%" class="STYLE1"><img src="images/22.gif" width="14" height="14" /></td>
                <td width="8%" class="STYLE1"><a href="add_link.asp" target="main">添加友情链接</a></td>
              </tr>
            </table></td>
            <td width="10%">&nbsp;</td>
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
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
      <tr>
        <td bgcolor="#FFFFFF"><%
set rs=server.createobject("adodb.recordset") 
exec="select * from [link] order by pl_id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无信息！"
else
rs.PageSize =15 '每页记录条数
iCount=rs.RecordCount '记录总数
iPageSize=rs.PageSize
maxpage=rs.PageCount 
page=request.querystring("page")
if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if
if page<1 then
page=1
elseif  page>maxpage then
page=maxpage
end if
rs.AbsolutePage=Page
if page=maxpage then
x=iCount-(maxpage-1)*iPageSize
else
x=iPageSize
end if	
%>
<% 
for i=1 to rs.pagesize 
j=i 
if j mod 2=0 then 
bg="#F1F5F8" 
else 
bg="#FFFFFF" 
end if 
%>
        </td>
      </tr>
      <tr  onmouseout="style.backgroundColor='<%=bg%>'" bgcolor="<%=bg%>">
        <td colspan="2"><table width="100%" border="0" cellpadding="5" cellspacing="0">
        <form action="?edit=ok" method="post" name="add">
            <tr>
              <td width="13%" class="td">Link_ID：<%=rs("id")%><input name="id" type="hidden" id="id" value="<%=rs("id")%>" /></td>
              <td width="24%" height="25" class="td">链接名称：
                <input name="title" type="text" value="<%=rs("title")%>" size="18" /></td>
              <td width="29%" class="td">链接地址：
                <input name="url" type="text" value="<%=rs("url")%>" size="25" /></td>
              <td width="16%" class="td">链接排序：
                <input name="pl_id" type="text" value="<%=rs("pl_id")%>" size="5" /></td>
              <td width="9%" class="td"><label>
                <input type="submit" name="button" id="button" value="修改"  class="button"/>
              </label></td>
              <td width="9%" class="td"><input type="button" name="Submit" value="删除" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='?act=del&id=<%=rs("id")%>';}else{history.go(0);}"  class="button"/></td>
              </tr></form>
          </table>
            <% 
rs.movenext 
if rs.eof then exit for 
next 
%>
          <%
end if
%></td>
      </tr>
    </table>
    <table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td bgcolor="#F1F5F8"><%call PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>")
rs.close
set rs=nothing
%></td>
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
<% 
if Request.QueryString("edit")="ok" then
id=request("id")
	if id="" then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('manage_link.asp');</script>"
	Response.End()
	end if 
sql="select * from [link] where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("pl_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs("title")=request.form("title") 
rs("url")=request.form("url") 
rs("pl_id")=request.form("pl_id") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""恭喜你，修改链接成功！"");window.location.href='manage_link.asp';</script>")
end if
%>
<%
if request("act")="del" then
	id=request("id")
	if id="" then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('manage_link.asp');</script>"
	Response.End()
	end if
set rs=server.createobject("adodb.recordset")
rs.open "Select * from [Link] where id="&Request("id"),conn,1,3
if rs.bof and rs.eof then
	Response.Write "<script language='javascript'>alert('数据库中没有该记录！');document.location.href('manage_link.asp');</script>"
	Response.End()
else
	rs.Delete
	rs.Update
	Response.Write "<script language='javascript'>alert('恭喜你，删除成功！');document.location.href('manage_link.asp');</script>"
end if
end if
%>