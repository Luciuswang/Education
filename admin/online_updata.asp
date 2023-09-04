<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp" -->
<!--#include file="md5.Asp" -->
<% 
id=request("id")
xy_name=request.form("xy_name")
sex=request.form("sex")
xy_xl=request.form("xy_xl")
xy_ages=request.form("xy_ages")
yykc=request.form("yykc")
qh=request.form("qh")
tel=request.form("tel")
address=request.form("address")
shouji=request.form("shouji")
zt=request.form("zt")

SQL="Select * from [online] where id="&id
set rs=server.createobject("adodb.recordset")
rs.open SQL,conn,1,3
if rs.eof and rs.bof then
Response.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>" 
Response.End()
end if
rs("xy_name")=xy_name
rs("sex")=sex
rs("xy_xl")=xy_xl
rs("xy_ages")=xy_ages
rs("yykc")=yykc
rs("qh")=qh
rs("tel")=tel
rs("address")=address
rs("shouji")=shouji
rs("zt")=zt
rs.update 
rs.close 
response.write "<script>alert('恭喜你，报名资料信息修改成功！');window.location.href='manage_online.asp';</script>" 
%> 
