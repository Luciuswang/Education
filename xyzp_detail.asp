<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Xyconn.asp"-->
<!--#include file="Inc/xycms.asp" -->
<!--#include file="Inc/config.asp" -->

<%
id=request.QueryString("id")
if id="" or not isnumeric(id) then
response.write "<script>alert('警告!非法参数！');window.location.href='index.asp';</script>" 
Response.End()
end if
set rs=server.createobject("adodb.recordset") 
exec="select * from [xyzp] where id="& id
rs.open exec,conn,1,1
if rs.eof then
response.Write "<div style=""padding:10px"">没有相关信息！</a>"
response.End()
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="style/index.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<script type="text/javascript" src="js/slideplay.js"></script>
<title><%=rs("title")%>_<%=wzname%></title>
<!--[if lte IE 6]>
<script src="js/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]-->
</head>
<body>
<!--#include file="head.asp"-->

<div class="sub_title">
  <span class="stitle">信息详细</span>
  <span class="sdh">您当前所在位置：<a href="">首页</a>&nbsp;&gt;&nbsp;<a href="xyzp.html" target="_self">学员作品</a>&nbsp;&gt;&nbsp;信息详细</span>
  <div class="clear"></div>
</div>
<div class="dc">
  <div class="cleft">
    <div class="sub_body">
      <div class="sub_show">
        <h1 class="title"><%=rs("title")%></h1>
        <div class="info">
          <small>来源：</small><%=rs("ly")%>
          <small>作者：</small><%=rs("zz")%>
          <small>更新时间：</small><%=rs("data")%>
        </div>
        <div class="pic"><img src="<%=rs("img")%>" /></div>
        <div class="dsp">
		  <%=strvalue(rs("body"),200)%>
        </div>
        <%=rs("body")%>
        <% rs.close
		set rs=nothing
		%>
      </div>
    </div>
  </div>
  <div class="cright">
    <div class="contact_t">
      <div class="title">关于我们</div>
    </div>
    <div class="contact_c">
      <div class="contact">
        <ul>
          <%=xycms_commonlist()%>
        </ul>
      </div>
    </div>
    <div class="contact_t">
      <div class="title">联系我们</div>
    </div>
    <div class="contact_c">
      <div class="contact">
        <ul>
          <%=xycms_contact()%>
        </ul>
      </div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="foot.asp"-->
</body>
</html>
