<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<% 
exec="select * from ad where id="& request.QueryString("id") 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
id=rs("id")
lx=rs("lx")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改广告</title>

<script src="images/data.js" type="text/javascript"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size:12px;
}
.button{font-size:12px; background:url(button.gif); border:1px solid #BDC5CA; height:23px;  color:#333333}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE5 {color: #FF0000}
-->
</style>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[广告图片管理]</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
        <form name="addform" method="post" action="ad_updata.asp">
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
          <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="14" width="8%" class="td">广告类型 <font color="#FF0000">*</font></td>
        <td width="92%" height="25"  class="td"><strong>
		<%if lx=1 then
		response.Write("图片广告")
		else
		response.Write("文字广告")
		end if
		%></strong>
          <input name="lx" type="hidden" id="lx" value="<%= rs("lx")%> " /></td>
      </tr>
                      <%if lx=3 then%>  
   
      <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF" >
        <td height="28" width="8%" class="td">广告名称 <font color="#FF0000">*</font></td>
        <td width="92%"  class="td">
          <input name="title" type="text" value="<%=rs("title")%>" size="40"  />
          <input name="id" type="hidden" value="<%=rs("id")%>" size="40"  /></td>
      </tr> 
<tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
                          <td height="14" class="td">文字内容 <font color="#FF0000">*</font></td>
                          <td width="92%"  class="td"><textarea name="code" cols="40" rows="10"><%=rs("code")%></textarea></td>
                </tr><%else%>
                              <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF" >
        <td height="28" width="8%" class="td">广告名称 <font color="#FF0000">*</font></td>
        <td width="92%"  class="td">
          <input name="title" type="text" value="<%=rs("title")%>" size="40"  />
          <input name="id" type="hidden" value="<%=rs("id")%>" size="40"  /></td>
      </tr> 
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" width="8%" class="td">图片地址 <font color="#FF0000">*</font></td>
        <td class="td"><iframe src='UpLoadPic.asp?id=img&value=<%=rs("img")%>' frameborder=0 scrolling=no width='100%' HEIGHT='25'></iframe><input type="hidden" name="img" value="<%=rs("img")%>" /></td>
      </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="13" class="td">链接地址 <font color="#FF0000">*</font></td>
        <td class="td"><input name="url" type="text" value="<%=rs("url")%>" size="40"  />
          打开方式：
          <select name="open_m" id="open_m">
            <option value="_blank"  <%if rs("open_m")="_blank" then%>selected="selected"<%end if%>>_blank</option>
            <option value="_parent" <%if rs("open_m")="_parent" then%>selected="selected"<%end if%>>_parent</option>
            <option value="_self" <%if rs("open_m")="_self" then%>selected="selected"<%end if%>>_self</option>
            <option value="_top" <%if rs("open_m")="_top" then%>selected="selected"<%end if%>>_top</option>
          </select></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
      <td height="6" class="td">广告尺寸</td>
      <td class="td"><input name="width" type="text" value="<%=rs("width")%>" size="10"  />
        <font color="#FF0000">*</font>
        宽
          <input name="height" type="text" value="<%=rs("height")%>" size="10"  />
          <font color="#FF0000">*</font>          高</td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
      <td height="6" class="td">链接说明</td>
      <td class="td"><input name="sm" type="text" value="<%=rs("sm")%>" size="40"  /></td>
    </tr>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" class="td"><p>备注</p>          </td>
        <td class="td"><textarea name="bz" cols="50" rows="5"><%=rs("bz")%></textarea></td>
      </tr>
  <%end if%>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
      <td height="12" class="td">&nbsp;</td>
      <td class="td"><input type="submit" name="button" id="button" value="提交修改"  class="button"/></td>
    </tr>
  
    </table></form>
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>&nbsp;</td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>

</body>
</html>