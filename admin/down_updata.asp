<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<%
id=request("id")
set rs=server.createobject("adodb.recordset")
sql="select * from [down] where id="&id
rs.open sql,conn,1,3
title=request.form("title")
zz=request.form("zz")
ly=request.form("ly")
body=request.form("body")
url=request.form("url")

rs("title")=title
rs("zz")=zz
rs("ly")=ly
rs("body")=body
rs("url")=url
rs("data")=Now()
rs.update
rs.close
set rs=nothing
Response.Write "<script>alert('恭喜你，下载页内容修改成功！');window.location.href='manage_down.asp';</script>" 
%>