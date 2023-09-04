<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="xyconn.asp"-->
<!--#include file="Inc/xycms.asp" -->
<!--#include file="Inc/config.asp" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="style/index.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<script type="text/javascript" src="js/slideplay.js"></script>
<title>在线咨询_<%=wzname%></title>
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
  <span class="stitle">在线咨询</span>
  <span class="sdh">您当前所在位置：<a href="">首页</a>&nbsp;&gt;&nbsp;在线咨询</span>
  <div class="clear"></div>
</div>
<div class="dc">
  <div class="cleft">
    <div class="sub_body">
      <div class="sub_show">
        <form name="form" method="post" action="add_book.asp?act=ok" onSubmit="return checkform();">
            <table class="tablecss">
              <tr>
                <th><em>*</em>留言标题：</th>
                <td><input name="title" type="text" size="40" class="input_border" /><input name="sh" type="hidden" id="sh" value="<%=gbook_sh%>" /><em>必须填写</em></td>
              </tr>
              <tr>
                <th><em>*</em>姓名：</th>
                <td><input name="ly_name" type="text" size="20" class="input_border" /><em>必须填写，方便联系，网页不会公开</em></td>
              </tr>
              <tr>
                <th>联系电话：</th>
                <td><input name="tel" type="text" size="20" class="input_border" /><em>方便电话联系，网页不会公开</em></td>
              </tr>
              <tr>
                <th><em>*</em>联系邮箱：</th>
                <td><input name="email" type="text" size="30" class="input_border" /><em>必须填写，方便电话联系，网页不会公开</em></td>
              </tr>
              <tr>
                <th>是否隐藏：</th>
                <td><input type="radio" name="sf_yc" checked="checked" value="0" />否 <input type="radio" name="sf_yc" value="1" />是
                <em>选择隐藏，问题将不在列表显示，否则将显示</em>
                </td>
              </tr>
              <tr>
                <th><em>*</em>留言内容：</th>
                <td><textarea name="body" rows="7" cols="50"></textarea></td>
              </tr>
              <tr>
                <td colspan="2" align="center"><input type="submit" value="提交信息" /> <input type="reset" value="全部重写" /></td>
              </tr>
            </table>
            </form>
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
          <li><a href="add_book.asp" target="_self">在线咨询</a></li>
          <li><a href="gbook.asp" target="_self">查看咨询</a></li>
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
<%
if Request.QueryString("act")="ok" then
set rs=server.createobject("adodb.recordset")
sql="select * from [gbook]"
rs.open sql,conn,1,3
rs.addnew
rs("title")=Checkxss(trim(request.form("title")))
rs("sh")=request.form("sh")
rs("ly_name")=Checkxss(trim(request.form("ly_name")))
rs("tel")=Checkxss(trim(request.form("tel")))
rs("email")=Checkxss(trim(request.form("email")))
rs("sf_yc")=request.form("sf_yc")
rs("body")=Checkxss(trim(request.form("body")))
rs.update
rs.close
set rs=nothing
Response.Write "<script>alert('恭喜你，留言信息添加成功，请勿重复提交！');window.location.href='gbook.asp';</script>"
end if
%>