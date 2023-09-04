<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Xyconn.asp"-->
<!--#include file="Inc/xycms.asp" -->
<!--#include file="Inc/config.asp" -->
<!--#include file="page.asp" -->

<%
set rst=server.createobject("adodb.recordset") 
exec="select * from [down] order by id desc"
rst.open exec,conn,1,1
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
<title>资料中心_<%=wzname%></title>
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
  <span class="stitle">资料下载</span>
  <span class="sdh">您当前所在位置：<a href="">首页</a>&nbsp;&gt;&nbsp;<a href="down.asp" target="_self">资料中心</a></span>
  <div class="clear"></div>
</div>
<div class="dc">
  <div class="cleft">
    <div class="sub_body">
      <div class="down_list">
        <ul>
          <% if rst.eof then
             response.Write "<li>暂无该类信息记录！</li>"
             else
             rst.PageSize =16
             iCount=rst.RecordCount 
             iPageSize=rst.PageSize
             maxpage=rst.PageCount 
             page=request.querystring("page")
             if Not IsNumeric(page) or page="" then
             page=1
             else
             page=cint(page)
             end if
             if page<1 then
             page=1
             elseif  page>maxpage then
             page=maxpage
             end if
             rst.AbsolutePage=Page
             if page=maxpage then
             x=iCount-(maxpage-1)*iPageSize
             else
             x=iPageSize
             end if
             end if
             For i=1 To x %>
          <li><span><%=formatdatetime(rst("data"),2)%></span><a href="down_detail.asp?id=<%=rst("id")%>" target="_blank"><%=rst("title")%></a></li>
          <% rst.movenext
			   next %>
        </ul>
        <div class="clear"></div>
      </div>
      <div class="page_list">
          <%call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
                rst.close
                set rst=nothing%>
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
