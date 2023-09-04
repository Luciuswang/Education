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
<title>在线报名_<%=wzname%></title>
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
  <span class="stitle">在线报名</span>
  <span class="sdh">您当前所在位置：<a href="">首页</a>&nbsp;&gt;&nbsp;<a href="online.asp" target="_self">在线报名</a></span>
  <div class="clear"></div>
</div>
<div class="dc">
  <div class="cleft">
    <div class="sub_body">
      <div class="sub_show">
       <form name="form" method="post" action="online.asp?act=ok" onSubmit="return checkform();"> 
            <table class="tablecss">
              <tr>
                <th><em>*</em>姓名：</th>
                <td><input name="xy_name" maxLength=30 class="input_border" /><em>不能有空格，确保准确，与身份证一致。</em></td>
              </tr>
              <tr>
                <th><em>*</em>性别：</th>
                <td>
                  <select style="width:78px;" name="sex">
					<option selected value="">请选择</option>
                    <OPTION value="男">男</OPTION> 
                    <OPTION value="女">女</OPTION>
			      </select>
                </td>
              </tr>
              <tr>
                <th><em>*</em>年龄：</th>
                <td><input name="xy_ages" size="3" maxLength=3 class="input_border"  />
                岁<em>确保准确</em></td>
              </tr>
              <tr>
                <th>学历：</th>
                <td><select style="width:78px;" name="xy_xl">
					<option selected value="请选择">请选择</option>
                    <OPTION value="本科以上">本科以上</OPTION> 
                    <OPTION value="本科">本科</OPTION>
                    <OPTION value="大专">大专</OPTION>
                    <OPTION value="高中">高中</OPTION>
                    <OPTION value="高中以下">高中以下</OPTION>
			      </select></td>
              </tr>
              <tr>
                <th><em>*</em>身份证号码：</th>
                <td><input name="sfzh" class="input_border" style="width:154px;" maxLength="18" /><em>请准确填写!(如有X也须填写)学校建档案用，请务必填写正确！</em></td>
              </tr>
              <tr>
                <th>出生日期：</th>
                <td><input name="data" type="text"  size="20"   onfocus="show_cele_date(data,'','',data)"/></td>
              </tr>
              <tr>
                <th><em>*</em>意愿学习课程：</th>
                <td><input name="yykc" type="text"  size="20" class="input_border" /> <em>选择你最想要学习的课程名称</em></td>
              </tr>
              <tr>
                <th><em>*</em>通信地址：</th>
                <td><input name="address" maxlength="60"  class="input_border" style="width:255px;" /><em>注意：必须保证准确。</em></td>
              </tr>
              <tr>
                <th><em>*</em>联系电话：</th>
                <td><input id="qh" name="qh" maxLength="5" class="input_border" style="width:44px;" />&nbsp;-&nbsp;<input id="tel" name="tel" maxLength="8" class="input_border" style="width:114px;" />
											<em>请输入正确的区号和号码,如无可填010-88888888</em></td>
              </tr>
              <tr>
                <th><em>*</em>手机：</th>
                <td><input id="shouji" name="shouji" maxLength="11" class="input_border" style="width:114px;" />
											<em>请正确填写并确保开机,方便联系通知</em></td>
              </tr>
              <tr>
                <td colspan="2" align="center"><input type="submit" value="提交信息" /> <input type="reset" value="全部重写" /></td>
              </tr>
            </table>
            </form>
            <h4 align="center" style="font-size:12px; color:#5F9EE4;">（以上信息必须为报读学生准确资料，请务必确保无误，再检查一遍吧！）</h4>
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
<%
if Request.QueryString("act")="ok" then
set rs=server.createobject("adodb.recordset")
sql="select * from [online]"
rs.open sql,conn,1,3
rs.addnew
rs("xy_name")=trim(request.form("xy_name"))
rs("sex")=request.form("sex")
rs("xy_ages")=trim(request.form("xy_ages"))
rs("xy_xl")=request.form("xy_xl")
rs("sfzh")=trim(request.form("sfzh"))
rs("data")=trim(request.form("data"))
rs("address")=trim(request.form("address"))
rs("qh")=trim(request.form("qh"))
rs("tel")=trim(request.form("tel"))
rs("yykc")=trim(request.form("yykc"))
rs("shouji")=trim(request.form("shouji"))
rs.update
rs.close
set rs=nothing
Response.Write "<script>alert('恭喜你，报名信息添加成功，请勿重复提交！');window.location.href='index.asp';</script>"
end if
%>