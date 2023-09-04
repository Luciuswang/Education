<!--#include file="../xyconn.asp" --> 
<!--#include file="md5.Asp"-->
<%
if session("admin")<>"" then 
response.redirect "index.asp" 
else
end if
%>
<html>
<head>
<title>小杨站长企业网站后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	background-image: url(images/log_bj.png);
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style><body><div style=" margin-top:162px;">
<table width="745" height="344" border="0" align="center" background="images/log.png" cellpadding="0" cellspacing="0">
  <tr>
    <td height="307" align="center" valign="middle"><table width="745" height="126" border="0" align="center" cellpadding="0" cellspacing="0">
    <form  name="add" method="post" action="loginpass.asp">
      <tr>
        <td width="305">&nbsp;</td>
        <td width="156" height="25" valign="middle">
          <input name="admin" type="text" id="name" size="18" maxlength="20" style=" height:18px; margin-top:20px;" />              </td>
        <td width="284">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="25" valign="middle"><input name="password" type="password" id="pass" size="19" maxlength="20" style=" height:18px; margin-top:6px;" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="25" valign="bottom"><input name="verifycode" type="text" size="7" style=" height:18px;" /> <img src="safecode.asp?" onClick="this.src+=Math.random()" alt="图片看不清？点击重新得到验证码" style="cursor:hand;" height="18" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="2"><input type="submit" name="button"  value="提交" style="margin-top:3px;"> &nbsp;
          <input type="reset" name="button2"  value="清空" style="margin-top:3px;">
          </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="13">&nbsp;</td>
        <td><div align="left">    
        </div></td>
        <td>&nbsp;</td>
      </tr>
      </form>
    </table></td>

  </tr>
</table></div>
</body>
</html>
