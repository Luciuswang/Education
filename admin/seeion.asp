<%if session("admin")<>"" then%>
<%
else
Response.Write "<script>alert('您好，网页链接超时，请登录后再来！');window.location.href='../index.asp';</script>" 
response.end
end if
%>

