<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>问答中心管理</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[问答中心管理]</td>
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
    <form id="form1" name="form1" method="post" action="?del=checkbox"> 
      <tr>
        <td bgcolor="#FFFFFF"><%	
set rs=server.createobject("adodb.recordset") 
exec="select * from [gbook] order by id desc" 
rs.open exec,conn,1,1 
if rs.eof then
response.write ("<div style=""padding:10px;"">暂无留言内容!</div>")
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
%>        </td>
      </tr>
      <tr  onmouseout="style.backgroundColor='<%=bg%>'" bgcolor="<%=bg%>">
        <td colspan="2"><table width="100%" border="0" cellpadding="5" cellspacing="0">
         
            <tr>
              <td width="8%" class="td"><input name="ID" type="checkbox" id="ID" value="<%=rs("id")%>" />
                <%=rs("id")%></td>
              <td width="20%" height="25" class="td"><a href="hf_gbook.asp?id=<%=rs("id")%>" style="color:#003399"><%=left(rs("title"),20)%></a></td>
              <td width="19%" class="td"><%=rs("ly_name")%></td>
              <td width="9%" class="td"><%
if IsNull(rs("hf_gbook")) or trim(rs("hf_gbook")&"")="" then
response.Write("<font color=#FF0000>[未回复]</font>")
else
response.Write("<font color=#0033FF>[已回复]</font>")
end if
  %></td>
              <td width="14%" class="td"><%if rs("sh")=1 then
			  response.Write("<font color=#0033FF>[已审核]</font>")
			  else
			  response.Write("<font color=#FF0000>[未审核]</font>")
			  end if%></td>
              <td width="17%" class="td"><%=rs("data")%></td>
              <td width="6%" class="td">
                <input type="button" name="Submit3" value="回复" onclick="window.location.href='hf_gbook.asp?id=<%=rs("id")%>' "  class="button"/></td>
              <td width="7%" class="td">
                <input type="button" name="Submit" value="删除" onclick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='?id=<%=rs("id")%>&amp;del=ok';}else{history.go(0);}"  class="button"/></td>
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
        <td width="49%" height="30"><table width="100%" border="0" cellpadding="5" cellspacing="0">
          <tr>
            <td width="47%" bgcolor="#F1F5F8">
          <input type="checkbox" name="allbox" onclick="CheckAll()" /><label>
         <select name="lx">
            <option selected="selected" value="">操作类型</option>
            <option value="1">通过审核</option>
            <option value="2">取消审核</option>
            <option value="3">批量删除</option>
          </select>
          <input type="submit" name="button" id="button" value="提交"  class="button"/>
        </label></td>
            <td width="53%" bgcolor="#F1F5F8"><%call PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>")
rs.close
set rs=nothing
%></td>
          </tr>
        </table></td>
      </tr> </form>
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
sql="select * from [gbook] where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('恭喜你，问题内容删除成功！');window.location.href='manage_gbook.asp';</script>"
end if 
%>
<%
if Request.QueryString("del")="checkbox" then
if Request("id")="" then
Response.Write "<script>alert('错误!请选择要操作的记录!');window.location.href='manage_gbook.asp';</script>" 
response.end()
end if
dim sql
lx=request.Form("lx")
if lx="" then
Response.Write "<script>alert('错误!请选择操作类型!');window.location.href='manage_gbook.asp';</script>" 
response.end
end if
if lx=1 then
sql="update gbook set sh=1 where id in ("&Request("id")&")" 
conn.execute(sql) 
elseif lx=2 then 
sql="update gbook set sh=0 where id in ("&Request("id")&")" 
conn.execute(sql) 
else
sql="delete from gbook where id in ("&Request("id")&")"
conn.Execute(sql)
end if
conn.close
set conn=nothing
Response.Write "<script>alert('恭喜你!信息处理操作成功!');window.location.href='manage_gbook.asp';</script>" 
end if
%>