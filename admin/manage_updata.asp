<!--#include file="../xyconn.asp" -->
<!--#include file="md5.Asp" -->
<!--#include file="seeion.asp"-->
<% 
id=request.form("id")
sql="select * from admin_user where id="&id
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
password=trim(request.form("password"))
admin=request.form("admin")
password2=trim(request.form("password2"))
if password2<>password then
response.Write "<script>alert('你的确认密码填写错误，请重新填写！');window.location.href='admin_manage.asp';</script>"
elseif  password="" then 
rs("admin")=admin
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""登陆帐号及密码修改成功，请牢记您帐号及新密码！"");window.location.href='admin_manage.asp';</script>")
else
rs("admin")=admin
rs("password")=md5(password)
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""登陆帐号及密码修改成功，请牢记您帐号及新密码！"");window.location.href='admin_manage.asp';</script>")
end if
%> 



