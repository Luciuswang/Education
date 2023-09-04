<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<%
id=Trim(request("id"))
set rs=server.createobject("adodb.recordset")
sql="select * from common where id="&id
rs.open sql,conn,1,3
title=request.form("title")
body=request.form("body")
pl_id=request.form("pl_id")
rs("title")=title
rs("body")=body
rs("pl_id")=pl_id
rs.update
rs.close
set rs=nothing
Response.Write "<script>alert('恭喜你，企业信息页面内容修改成功！');window.location.href='manage_common.asp';</script>" 
%>