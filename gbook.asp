<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Xyconn.asp"-->
<!--#include file="Inc/xycms.asp" -->
<!--#include file="Inc/config.asp" -->
<!--#include file="page.asp" -->

<%
set rs=server.createobject("adodb.recordset") 
exec="select * from [gbook] where sh=1 order by id desc"
rs.open exec,conn,1,1
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
<title>问题咨询_<%=wzname%></title>
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
  <span class="stitle">问题咨询</span>
  <span class="sdh">您当前所在位置：<a href="">首页</a>&nbsp;&gt;&nbsp;<a href="gbook.asp" target="_self">问题咨询</a></span>
  <div class="clear"></div>
</div>
<div class="dc">
  <div class="cleft">
    <div class="sub_body">
      <div class="sub_show">
       <table width="100%" border="0" cellspacing="2" cellpadding="0">
              <% if rs.eof then
		     response.Write("<li>暂无该类信息记录！</li>")
			 else
			 rs.PageSize =8
             iCount=rs.RecordCount 
             iPageSize=rs.PageSize
             maxpage=rs.PageCount 
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
             rs.AbsolutePage=Page
             if page=maxpage then
             x=iCount-(maxpage-1)*iPageSize
             else
             x=iPageSize
             end if
             end if
			 j=1
             For i=1 To x 
			 %>
              <tr>
                <td width="56" height="40" align="right" class="dotline">
                  <img src="images/ques.gif" width="39" height="36">
                </td>
                <td width="646" height="40" class="dotline">
                  <a onClick="javascript:ShowFLT(<%=j%>)" href="javascript:void(null)"><%=rs("title")%></a></td>
              </tr>
              <tr id=LM<%=j%> style="DISPLAY: none">
                <td height="30" align="right" bgcolor="#f5f9ed"><img src="images/an.gif" width="14" height="15" hspace="5"></td>
                <td height="30" bgcolor="#f5f9ed"><%=rs("hf_gbook")%></td>
              </tr>
              <% j=j+1 
			    rs.movenext
                next
				 %>
            </table>
        <div class="dc_l_c_c_p">
            <% call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
                rs.close
                set rs=nothing %>
        </div>
      </div>
    </div>
  </div>
  <div class="cright">
    <div class="contact_t">
      <div class="title">快速导航</div>
    </div>
    <div class="contact_c">
      <div class="contact">
        <ul>
          <li><a href="add_book.html" target="_self">在线咨询</a></li>
          <li><a href="gbook.html" target="_self">查看咨询</a></li>
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