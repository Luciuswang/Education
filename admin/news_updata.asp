<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp" -->
<% 
id=request("id")
title=request.form("title")
url=request.form("url")
body=request.form("body")
color=request.form("color")
ssfl=request.form("ssfl")
ly=request.form("ly")
zz=request.form("zz")
img=request.form("img")

SQL="Select * from news where id="&id
set rs=server.createobject("adodb.recordset")
rs.open SQL,conn,1,3
if rs.eof and rs.bof then
Response.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>" 
Response.End()
end if
if title=""  then 
response.Write("<script language=javascript>alert('新闻标题不能为空!');history.go(-1)</script>") 
response.end 
end if
if body=""  then 
response.Write("<script language=javascript>alert('新闻内容不能为空!');history.go(-1)</script>") 
response.end 
end if
rs("title")=title
rs("url")=url
rs("body")=body
rs("color")=color
rs("ssfl")=ssfl
rs("ly")=ly
rs("zz")=zz
rs("img")=img
rs("data")=now()
rs.update 
rs.close 
response.write "<script>alert('恭喜你，新闻页面内容修改成功！');window.location.href='manage_news.asp';</script>" 

%> 
