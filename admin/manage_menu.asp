<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>首页菜单管理</title>
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
<% Action= Request("Action")
Select Case Action
	Case "add"
		Call add()
	Case Else 
		Call main()
end Select
%>
<% sub main()%>
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
                <td width="88%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[网站首页导航菜单管理]</td>
                <td width="2%" class="STYLE1"><img src="images/22.gif" width="14" height="14" /></td>
                <td width="8%" class="STYLE1"><a href="manage_menu.asp?action=add" target="main">添加首页菜单</a></td>
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
exec="select * from menu order by pl_id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.write ("<div style=""padding:10px;"">暂无菜单!</div>")
else
rs.PageSize =20 '每页记录条数
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
        <td colspan="2"><table width="100%" border="0" cellpadding="2" cellspacing="0">
        <form action="manage_menu.asp?edit=ok" method="post" name="add">
            <tr>
              <td width="8%" class="td">ID：<%=rs("id")%><input name="id" type="hidden" size="15"  value="<%=rs("id")%>"/></td>
              <td width="15%" height="25" class="td"><input name="title" type="text" size="15"  value="<%=rs("title")%>"/>&nbsp;</td>
              <td width="28%" class="td">地址：
                <input name="url" type="text" size="15"  value="<%=rs("url")%>"/></td>
              <td width="14%" class="td"><select name="open_m">
<option value="_self" <%if rs("open_m")="_self" then%>selected="selected"<%end if%>>原窗口</option>
 <option value="_blank" <%if rs("open_m")="_blank" then%>selected="selected"<%end if%>>新窗口</option>
 </select></td>
              <td width="10%" class="td"><select name="view">
<option value="1" <%if rs("view")=1 then%>selected="selected"<%end if%>>显示</option>
 <option value="2" <%if rs("view")=2 then%>selected="selected"<%end if%>>隐藏</option>
 </select></td>
              <td width="11%" class="td">排序：
                <input name="pl_id" type="text" value="<%=rs("pl_id")%>" size="5"  /></td>
              <td width="6%" class="td"><input type="submit" name="button" id="button2" value="修改"  class="button"/></td>
              <td width="8%" class="td"><input type="button" name="Submit" value="删除" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='manage_menu.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}"  class="button"/></td>
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
<% end sub %>
<% sub add()%>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[添加首页菜单]</td>
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
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
            <form action="manage_menu.asp?act=add" method="post" name="add">
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="25" width="10%" class="td">菜单名称：</td>
        <td width="90%"  class="td"><input name="title" type="text" size="30"  />
        &nbsp;</td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td width="10%" height="13" class="td">链接地址：</td>
        <td class="td"><input name="url" type="text" size="30"  /></td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td width="10%" height="12" class="td">打开方式：</td>
        <td class="td"><select name="open_m" id="open_m">
          <option value="_self">原窗口</option>
          <option value="_blank">新窗口</option>
        </select>
          <font color="red">*</font>   
           </td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" width="10%" class="td">排序ID：</td>
        <td class="td"><input name="pl_id" type="text" size="30"  /> 
          数字越小越靠前。</td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" class="td">是否隐藏该菜单：</td>
        <td class="td"><select name="view" id="view">
          <option value="1">显示</option>
          <option value="2">隐藏</option>
        </select> 
          隐藏后前台将不显示该菜单。</td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" class="td">&nbsp;</td>
        <td class="td"><label>
        <input type="submit" name="button" id="button" value="提交数据"  class="button"/>
        </label></td>
      </tr>
      
    </table></form></td>
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
<% end sub %>
</body>
</html>
<% 
if Request.QueryString("edit")="ok" then
id=request("id") 
sql="select * from menu where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("pl_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs("title")=request.form("title") 
rs("url")=request.form("url") 
rs("open_m")=request.form("open_m") 
rs("pl_id")=request.form("pl_id") 
rs("view")=request.form("view") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""菜单修改成功！"");window.location.href='manage_menu.asp';</script>")
end if
%> 
<%
if request("act")="del" then
	id=request("id")
	if id="" then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('manage_menu.asp');</script>"
	Response.End()
	end if
set rs=server.createobject("adodb.recordset")
rs.open "Select * from menu where id="&Request("id"),conn,1,3
if rs.bof and rs.eof then
	Response.Write "<script language='javascript'>alert('数据库中没有该记录！');document.location.href('manage_menu.asp');</script>"
	Response.End()
else
	rs.Delete
	rs.Update
	Response.Write "<script language='javascript'>alert('删除成功！');document.location.href('manage_menu.asp');</script>"
end if
end if
%>
<%
if request("act")="add" then
set rs=server.createobject("adodb.recordset")
sql="select * from menu"
rs.open sql,conn,1,3
title=request.form("title")
url=request.form("url")
open_m=request.form("open_m")
pl_id=request.form("pl_id")
view=request.form("view")
if title=""  then 
response.Write("<script language=javascript>alert('菜单名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if url=""  then 
response.Write("<script language=javascript>alert('链接地址不能为空!');history.go(-1)</script>") 
response.end 
end if
IF not isNumeric(request("pl_id"))  then
response.write("<script>alert("" 错误！排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs.addnew
rs("title")=title
rs("url")=url
rs("open_m")=open_m
rs("pl_id")=pl_id
rs("view")=view
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('菜单增加成功！');window.location.href='manage_menu.asp';</script>" 
end if
%>