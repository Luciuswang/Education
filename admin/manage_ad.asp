<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站广告内容管理</title>
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
<script> 
function oCopy(obj){ 
obj.select(); 
js=obj.createTextRange(); 
js.execCommand("Copy") 
alert('调用代码已复到剪贴板！请粘贴到前台需要显示广告的地方即可!')
} 
</script> 
<style type="text/css">
<!--
.STYLE2 {color: #FF0000}
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[网站广告内容管理]</td>
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
      <tr>
        <td colspan="2" bgcolor="#FFFFFF"><%	
set rs=server.createobject("adodb.recordset") 
exec="select * from ad order by id asc" 
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
        <td colspan="3"><table width="100%" border="0" cellpadding="5" cellspacing="0">
            <tr>
              <td width="7%" class="td">AD_ID：<%=rs("id")%></td>
              <td width="19%" height="25" class="td"><a href="edit_ad.asp?id=<%=rs("id")%>" style="color:#003399"><%=rs("title")%></a> </td>
              <td width="39%" class="td">JS调用代码：
                <input onclick="oCopy(this)" value="&lt;script src=&quot;advfile/ad<%=rs("id")%>.js&quot;&gt;&lt;/script&gt;" size="30"/></td>
              <td width="14%" class="td">广告点击：<%=rs("hit")%></td>
              <td width="7%" class="td"><div align="center">
                <input type="button" name="Submit2" value="广告生成" onclick="window.location.href='making_js.asp?id=<%=rs("id")%>' "  class="button"/>
              </div></td>
              <td width="7%" class="td">
                <div align="center">
                  <input type="button" name="Submit3" value="修改" onclick="window.location.href='edit_ad.asp?id=<%=rs("id")%>' "  class="button"/>
                </div></td>
              <td width="7%" class="td">
                  <input type="button" name="Submit" value="删除" onclick="javascript:if(confirm('确定删除当前广告？删除后不可恢复!')){window.location.href='manage_ad.asp?id=<%=rs("id")%>&amp;del=ok';}else{history.go(0);}"  class="button"/></td>
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
        <td width="24%" height="30">&nbsp;<span class="STYLE2"><strong>注意</strong>：增加广告或修改广告后勿必点击“广告生成”按钮后再调用！否则广告不会改变！</span></td>
        <td width="25%"><%call PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>")
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
sql="select * from ad where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('当前广告删除成功！');window.location.href='manage_ad.asp';</script>"
end if 
%>