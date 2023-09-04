<!--#include file="../xyconn.asp" -->
<!--#include file="htmlfunction.asp"-->
<!--#include file="seeion.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>新闻分类管理</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[企业新闻分类管理]</td>
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
        <%	set rs=server.createobject("adodb.recordset") 
exec="select * from news_fl order by pl_id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.write ("<div style=""padding:10px;"">暂无新闻分类!</div>")
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
for i=1 to rs.pagesize 
j=i 
if j mod 2=0 then 
bg="#F1F5F8" 
else 
bg="#FFFFFF" 
end if 
%>
        
        <table width="100%" border="0" cellpadding="5" cellspacing="0">
        <form action="manage_news_fl.asp?edit=ok" method="post" name="edit">
            <tr>
              <td width="10%" class="td">News_Fl_ID：<%=rs("id")%><input name="id" type="hidden" size="15"  value="<%=rs("id")%>"/></td>
              <td width="18%" height="25" class="td"><input name="title" type="text" size="15"  value="<%=rs("title")%>"/></td>
              <td width="38%" class="td">地址：
                <input name="url" type="text" value="News.asp?id=<%=rs("id")%>" size="20"/> 
                [<a href="../newsmore.asp?id=<%=rs("id")%>" target="_blank" style="color:#003399">访问</a>]</td>
              <td width="20%" class="td">排序：
                <input name="pl_id" type="text" value="<%=rs("pl_id")%>" size="5"  /></td>
              <td width="7%" class="td"><input type="submit" name="button2" id="button2" value="修改"  class="button"/></td>
              <td width="7%" class="td"><input type="button" name="Submit" value="删除" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='manage_news_fl.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}"  class="button"/></td>
            </tr></form>
          </table>
          <% rs.movenext 
if rs.eof then exit for 
next 
end if %>
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
<form action="manage_news_fl.asp?add=ok" method="post" name="add">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[添加分类]</td>
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
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="25" width="34%" class="td">分类名称</td>
        <td width="66%"  class="td"><input name="title" type="text" size="30"  /> <img src="images/ts.gif" width="14" height="15" alt="新闻分类标题" /></td>
      </tr>
      
      <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" width="34%" class="td">排序ID</td>
        <td class="td"><input name="pl_id" type="text" size="30"  /> 
          数字越小越靠前。</td>
      </tr>
      
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" class="td">&nbsp;</td>
        <td class="td"><label>
        <input type="submit" name="button" id="button" value="增加分类"  class="button"/>
        </label></td>
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
</form>
</body>
</html>
<% 
if Request.QueryString("edit")="ok" then
id=request("id") 
sql="select * from news_fl where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("pl_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs("title")=request.form("title") 
rs("pl_id")=request.form("pl_id") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""当前分类修改成功！"");window.location.href='manage_news_fl.asp';</script>")
end if
%> 
<%
if request("act")="del" then
	id=request("id")
	if id="" then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('manage_news_fl.asp');</script>"
	Response.End()
	end if
set rs=server.createobject("adodb.recordset")
rs.open "Select * from news_fl where id="&Request("id"),conn,1,3
if rs.bof and rs.eof then
	Response.Write "<script language='javascript'>alert('数据库中没有该记录！');document.location.href('manage_news_fl.asp');</script>"
	Response.End()
else
	call Delhtml("news_"&rs("id")&".html")
	rs.Delete
	rs.Update
	Response.Write "<script language='javascript'>alert('当前分类删除成功！');document.location.href('manage_news_fl.asp');</script>"
end if
end if
%>
<%
if Request.QueryString("add")="ok" then
set rs=server.createobject("adodb.recordset")
sql="select * from news_fl"
rs.open sql,conn,1,3
title=request.form("title")
pl_id=request.form("pl_id")
if title=""  then 
response.Write("<script language=javascript>alert('分类名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if pl_id=""  then 
response.Write("<script language=javascript>alert('排序ID不能为空!');history.go(-1)</script>") 
response.end 
end if
IF not isNumeric(request("pl_id"))  then
response.write("<script>alert("" 错误！排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs.addnew
rs("title")=title
rs("pl_id")=pl_id
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('分类增加成功！');window.location.href='manage_news_fl.asp';</script>" 
end if
%>