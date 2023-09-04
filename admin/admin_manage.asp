<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<!--#include file="md5.Asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理员管理</title>
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
.STYLE7 {font-size: 12px; font-weight: bold; color: #006600; }
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[管理员管理]</td>
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
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                            <%	
set rs=server.createobject("adodb.recordset") 
exec="select * from admin_user order by id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无信息！"
else
rs.PageSize =50 '每页记录条数
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
            <tr>
              <td width="10%" class="td">ID：<%=rs("id")%></td>
              <td width="14%" height="25" class="td"><%=rs("admin")%> </td>
              <td width="18%" class="td"><font color=#336699>超级管理员</font></td>
              <td width="14%" class="td">登录 <%=rs("login_num")%> 次</td>
              <td width="27%" class="td">最后登录：<%=rs("login_date")%></td>
              <td width="7%" class="td"><input type="button" name="Submit3" value="修改" onClick="window.location.href='edit_manage.asp?id=<%=rs("id")%>' "  class="button"/> </td>
              <td width="10%" class="td"><input type="button" name="Submit" value="删除" onclick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_manage.asp?id=<%=rs("id")%>&amp;del=ok';}else{history.go(0);}"  class="button"/></td>         
            </tr>
             <% rs.movenext 
           if rs.eof then exit for 
           next 
           end if
            %>
          </table>
          <hr color="#666666" size="1" width="100%" />
          <form action="admin_manage.asp?act=add" method="post" name="add">
          <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
          <tr>
            <td colspan="2"><span class="STYLE7">添加管理员</span></td>
          </tr>
      <tr onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="25" width="10%" class="td">管理员帐号：</td>
        <td width="90%"  class="td"><input name="admin" type="text" size="30"  /> 
        * [管理帐号只能由字母、数字及下划线组成]</td>
      </tr>
      <tr onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td width="10%" height="13" class="td">登录密码：</td>
        <td class="td"><input name="password" type="text" size="30"  />
          * </td>
      </tr>
      <tr onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td width="10%" height="12" class="td">确认密码：</td>
        <td class="td"><input name="password3" type="text" size="30"  />
          * </td>
      </tr>
      <tr onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" class="td">&nbsp;</td>
        <td class="td"><input type="submit" name="button" id="button" value="提交数据"  class="button"/></td>
      </tr>
    </table></form>
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
sql="select * from admin_user where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('删除成功！');window.location.href='admin_manage.asp';</script>"
end if 
%>
<%
if request("act")="add" then
dim u,i,letters
set rs=server.createobject("adodb.recordset")
sql="select * from admin_user"
rs.open sql,conn,1,3
admin=request.form("admin")
password=request.form("password")
password3=request.form("password3")
if admin=""  then 
response.Write("<script language=javascript>alert('管理帐号不能为空!');history.go(-1)</script>") 
response.end 
end if
letters="0123456789abcdefghijklmnopqrstuvwxyz" 
admin=Lcase(trim(Request.Form("admin"))) 
for i=1 to len(admin) 
u=mid(admin,i,1) 
if Instr(letters,u)=0 then 
response.write "<script>alert('管理帐号只能由字母、数字及下划线组成!');history.go(-1);</script>" 
response.end 
end if 
next 
if password=""  then 
response.Write("<script language=javascript>alert('登录密码不能为空!');history.go(-1)</script>") 
response.end 
end if
rs.addnew
if request.Form("password")<>request.Form("password3") then 
Response.Write "<script>alert('密码输入不一致！请重新输入！');history.go(-1);</script>" 
response.end
end if
rs("admin")=admin
rs("password")=md5(request.form("password"))
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('恭喜你，管理员添加成功！点击继续添加！');window.location.href='admin_manage.asp';</script>" 
end if
%>