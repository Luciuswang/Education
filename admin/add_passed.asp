<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp" -->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from ad"
rs.open sql,conn,1,3
title=request.form("title")
url=request.form("url")
width=request.form("width")
height=request.form("height")
img=request.form("img")
lx=request.form("lx")
sm=request.form("sm")
bz=request.form("bz")
open_m=request.form("open_m")
code=request.form("code")
if title=""  then 
response.Write("<script language=javascript>alert('广告名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if lx=1 or lx=2  then
if img=""  then 
response.Write("<script language=javascript>alert('广告图片不能为空!');history.go(-1)</script>") 
response.end 
end if
if url=""  then 
response.Write("<script language=javascript>alert('广告链接地址不能为空!');history.go(-1)</script>") 
response.end 
end if
if width=""  then 
response.Write("<script language=javascript>alert('请输入广告宽度!');history.go(-1)</script>") 
response.end 
end if
if height=""  then 
response.Write("<script language=javascript>alert('请输入广告高度!');history.go(-1)</script>") 
response.end 
end if
IF not isNumeric(request("width")) or not isNumeric(request("height"))then
response.write("<script>alert(""广告尺寸必须都为数字！""); history.go(-1);</script>")
response.end
end if
else
if code=""  then 
response.Write("<script language=javascript>alert('文字广告内容不能为空!');history.go(-1)</script>") 
response.end 
end if
end if

rs.addnew
rs("title")=title
rs("url")=url
rs("width")=width
rs("height")=height
rs("img")=img
rs("lx")=lx
rs("sm")=sm
rs("bz")=bz
rs("code")=code
rs("open_m")=open_m
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('广告增加成功！必须先生成JS文件后再进行调用!');window.location.href='manage_ad.asp';</script>" 
%>