<!--#include file="../xyconn.asp" -->
<!--#include file="htmlfunction.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理</title>
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
<script language="javascript"> 
<!-- 
function CheckAll(){ 
 for (var i=0;i<eval(form1.elements.length);i++){ 
  var e=form1.elements[i]; 
  if (e.name!="allbox") e.checked=form1.allbox.checked; 
 } 
} 
--> 
</script> 
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[师资团队内容管理]</td>
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
        <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
        <form id="form1" name="form1" method="post" action="manage_team.asp?del=checkbox"> 
      <tr>
 <td colspan="2">
<%	
set rs=server.createobject("adodb.recordset")
exec="select * from [team] order by id desc"  
rs.open exec,conn,1,1 
if rs.eof then
response.write ("<div style=""padding:10px;"">暂无信息记录!</div>")
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
        <td colspan="3" ><table width="100%" border="0" cellpadding="5" cellspacing="0">
            <tr>
              <td width="13%" class="td"><input name="ID" type="checkbox" id="ID" value="<%=rs("id")%>" />
              team_ID:<%=rs("id")%></td>
              <td width="24%" height="25" class="td">
姓 名：<a href="edit_team.asp?id=<%=rs("id")%>"><%=left(rs("title"),20)%></a>  
</td>
              <td width="41%" class="td">创建时间：<%=rs("data")%></td>
              <td width="11%" class="td"><div align="center">
                <input type="button" name="Submit3" value="修改" onclick="window.location.href='edit_team.asp?id=<%=rs("id")%>' "  class="button"/>
              </div></td>
             <td width="11%" class="td">
                  
                  <div align="center">
                    <input type="button" name="Submit" value="删除" onclick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='manage_team.asp?id=<%=rs("id")%>&amp;del=ok';}else{history.go(0);}"  class="button"/>
                  </div></td>
            </tr>
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
      <tr  onmouseout="style.backgroundColor='<%=bg%>'" bgcolor="<%=bg%>">
        <td width="60" height="30"> <div style="padding-left:5px;">
          <input type="checkbox" name="allbox" onclick="CheckAll()" />
        </div>
         </td>
        <td width="45%"><label>
         <select name="lx">
            <option selected="selected" value="">操作类型</option>
            <option value="1">批量删除</option>
          </select>
          <input type="submit" name="button" id="button" value="提交"  class="button"/>
        </label></td>
        </form><td width="49%" height="30"><%call PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>")
rs.close
set rs=nothing
%></td>
      </tr>  
    </table></td>
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
if request("del")="ok" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from [team] where id="&id
rs.open sql,conn,2,3
call Delhtml("team_detail"&rs("id")&".html")
rs.delete
rs.update
Response.Write "<script>alert('当前信息记录删除成功！');window.location.href='manage_team.asp';</script>"
end if 
%>
<%
if Request.QueryString("del")="checkbox" then
if Request("id")="" then
Response.Write "<script>alert('错误!请选择要操作的记录!');window.location.href='manage_team.asp';</script>" 
response.end()
end if
dim sql
lx=request.Form("lx")
if lx="" then
Response.Write "<script>alert('错误!请选择操作类型!');window.location.href='manage_team.asp';</script>" 
response.end
end if
if lx=1 then
sql="delete from [team] where id in ("&Request("id")&")"
conn.Execute ( sql )
end if
conn.close
set conn=nothing
Response.Write "<script>alert('恭喜!操作成功!');window.location.href='manage_team.asp';</script>" 
end if
%>