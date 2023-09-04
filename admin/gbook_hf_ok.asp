<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp" -->
<% 
id=request("id")
hf_gbook=request.form("hf_gbook")

SQL="Select * from [gbook] where id="&id
set rs=server.createobject("adodb.recordset")
rs.open SQL,conn,1,3
if rs.eof and rs.bof then
Response.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>" 
Response.End()
end if
if hf_gbook=""  then 
response.Write("<script language=javascript>alert('请输入回复内容');history.go(-1)</script>") 
response.end 
end if
rs("hf_gbook")=hf_gbook
rs.update 
rs.close 
response.write "<script>alert('恭喜你，问题回复成功！');window.location.href='manage_gbook.asp';</script>" 

%> 
