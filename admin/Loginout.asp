<!--#include file="../xyconn.asp" -->  
<%
session.Abandon()
Response.Write("<script language=""JavaScript"">alert(""恭喜你，你已安全退出网站管理系统！"");</script>")
response.write "<Meta http-equiv='refresh' content='0;URL=index.asp'>"
%>