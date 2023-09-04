<!--#include file="../xyconn.asp" -->
<!--#include file="htmlfunction.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>企业下载资料管理</title>
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
<%
Function removehtml(Str1)
  Dim regEx
  Set regEx = New RegExp
  regEx.Pattern = "(<[^>]*?>)"
  regEx.Global = True
  regEx.IgnoreCase = True
  removehtml = replace(regEx.Replace(""&str1,""),"&nbsp;","")
End Function
%>
<%
Function InterceptString(txt,length)
    txt=trim(txt)
    x = len(txt)
    y = 0
    if x >= 1 then
        for ii = 1 to x
            if asc(mid(txt,ii,1)) < 0 or asc(mid(txt,ii,1)) >255 then '如果是汉字
                y = y + 2
            else
                y = y + 1
            end if
            if y >= length then
                txt = left(trim(txt),ii) '字符串限长
                exit for
            end if
        next
        InterceptString = txt
    else
        InterceptString = ""
    end if
End Function
%>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[企业下载资料管理]</td>
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
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
        <form id="form1" name="form1" method="post" action="?del=checkbox"> 
      <tr>

 <td colspan="2">
<%	
set rs=server.createobject("adodb.recordset")
exec="select * from [down] order by id desc"  
rs.open exec,conn,1,1 
if rs.eof then
response.write ("<div style=""padding:10px;"">暂无记录!</div>")
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
        <td colspan="3" ><table width="100%" border="0" cellpadding="5" cellspacing="0">
            <tr>
              <td width="17%" class="td"><input name="ID" type="checkbox" id="ID" value="<%=rs("id")%>" /> 
              down_Id：<%=rs("id")%></td>
              <td width="37%" height="25" class="td">下载资料名称：
<a href="edit_down.asp?id=<%=rs("id")%>"><%=InterceptString(removehtml(rs("title")),50)%></a>  
</td>
              <td width="25%" class="td">资料添加时间： <font color="#0000FF"><%=rs("data")%></font></td>
              <td width="11%" class="td"><div align="center">
                <input type="button" name="Submit3" value="修改" onclick="window.location.href='edit_down.asp?id=<%=rs("id")%>' "  class="button"/>
              </div></td>
             <td width="10%" class="td">
                <input type="button" name="Submit" value="删除" onclick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='?id=<%=rs("id")%>&amp;del=ok';}else{history.go(0);}"  class="button"/>
                  </td>
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
        全选</div>
         </td>
        <td width="45%"><select name="lx">
          <option selected="selected" value="">操作类型</option>
          <option value="1">批量删除</option>
        </select>
          <input type="submit" name="button" id="button" value="提交"  class="button"/></td>
        </form><td width="49%" height="30"><%call PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>")
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
if request("del")="ok" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from [down] where id="&id
rs.open sql,conn,2,3
call Delhtml("down_detail"&rs("id")&".html")
rs.delete
rs.update
Response.Write "<script>alert('删除成功！');window.location.href='manage_down.asp';</script>"
end if 
%>
<%
if Request.QueryString("del")="checkbox" then
if Request("id")="" then
Response.Write "<script>alert('错误!请选择要操作的记录!');window.location.href='manage_down.asp';</script>" 
response.end()
end if
if Request.QueryString("del")="checkbox" then
lx=request.Form("lx")
if lx="" then
Response.Write "<script>alert('请选择操作类型!');window.location.href='manage_down.asp';</script>" 
response.end
end if
if lx=1 then
sql="delete from [down] where id in ("&Request("id")&")"
conn.Execute ( sql )
end if
conn.close
set conn=nothing
Response.Write "<script>alert('恭喜您，操作成功!');window.location.href='manage_down.asp';</script>" 
end if
end if
%>