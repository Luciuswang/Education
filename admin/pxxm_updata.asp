<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp" -->
<% 
id=request("id")
title=request.form("title")
body=request.form("body")
ly=request.form("ly")
zz=request.form("zz")

SQL="Select * from [pxxm] where id="&id
set rs=server.createobject("adodb.recordset")
rs.open SQL,conn,1,3
if rs.eof and rs.bof then
Response.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>" 
Response.End()
end if
if title=""  then 
response.Write("<script language=javascript>alert('信息标题不能为空!');history.go(-1)</script>") 
response.end 
end if
if body=""  then 
response.Write("<script language=javascript>alert('信息内容不能为空!');history.go(-1)</script>") 
response.end 
end if
rs("title")=title
rs("body")=body
rs("ly")=ly
rs("zz")=zz
rs("data")=now()
rs.update 
rs.close 
response.write "<script>alert('恭喜你，信息页面内容修改成功！');window.location.href='manage_pxxm.asp';</script>" 

%> 
