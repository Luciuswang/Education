<!--#include file="../xyconn.asp" -->
<!--#include file="seeion.asp"-->
<% id=Request.QueryString("id")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>增加广告</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[网站广告内容添加]</td>
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
        <form name="addform" method="post" action="add_passed.asp">
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
          <%if id=3 then%>
            <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="28" width="9%" class="td">广告名称</td>
        <td width="91%"  class="td">
          <input name="title" type="text" size="40"  /> <img src="images/ts.gif" width="14" height="15" alt="广告名称"/></td>
      </tr>
            <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" width="9%" class="td">广告类型</td>
        <td class="td">     
        
         <select name="lxss" id="jumpMenu" onChange="window.open(this.options[this.selectedIndex].value,'_self')">
          <option value="add_ad.asp?id=1" <%if id=1 then%>selected="selected"<%end if%>>图片广告</option>
           <option value="add_ad.asp?id=3" <%if id=3 then%>selected="selected"<%end if%>>文字广告</option>
          </select>
         <label>
         <input name="lx" type="hidden" id="lx" value="<%= request.QueryString("id")%> " />
         </label></td>
      </tr>
                  <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="28" width="9%" class="td">文字广告内容</td>
        <td width="91%"  class="td">
          <textarea name="code" cols="40" rows="10"></textarea></td>
      </tr>
      <%else%>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8" >
        <td height="28" width="9%" class="td">广告名称</td>
        <td width="91%"  class="td">
          <input name="title" type="text" size="40"  /> <img src="images/ts.gif" width="14" height="15" alt="广告名称" /></td>
      </tr>
      <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" width="9%" class="td">广告类型</td>
        <td class="td">     
        
         <select name="lxss" id="jumpMenu" onChange="window.open(this.options[this.selectedIndex].value,'_self')">
          <option value="add_ad.asp?id=1" <%if id=1 then%>selected="selected"<%end if%>>图片广告</option>
           <option value="add_ad.asp?id=3" <%if id=3 then%>selected="selected"<%end if%>>文字广告</option>
          </select>
         <input name="lx" type="hidden" id="lx" value="<%= request.QueryString("id")%> " /></td>
      </tr>

      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" width="9%" class="td">图片地址</td>
        <td class="td"><iframe src='UpLoadPic.asp?id=img&value=<%=img%>' frameborder=0 scrolling=no width='100%' HEIGHT='25'></iframe><input type="hidden" name="img" /></td>
      </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="13" class="td">链接地址</td>
        <td class="td"><input name="url" type="text" value="http://" size="40"  /> <label>
          打开方式：
              <select name="open_m" id="open_m">
            <option value="_blank">_blank</option>
            <option value="_parent">_parent</option>
            <option value="_self">_self</option>
            <option value="_top">_top</option>
          </select>
        </label></td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
      <td height="6" class="td">广告尺寸</td>
      <td class="td"><input name="width" type="text" size="10"  />
        <font color="#FF0000">*</font>
        宽
          <input name="height" type="text" size="10"  />
          <font color="#FF0000">*</font>          高</td>
    </tr>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
      <td height="6" class="td">链接说明</td>
      <td class="td"><input name="sm" type="text" size="40"  /></td>
    </tr>
      <tr  onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#F1F5F8">
        <td height="25" class="td"><p>备注说明</p>
          </td>
        <td class="td"><textarea name="bz" cols="50" rows="5"></textarea></td>
      </tr><%end if%>
    <tr  onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#FFFFFF">
        <td height="25" class="td">&nbsp;</td>
        <td class="td"><input type="submit" name="button" id="button" value="确认提交"  class="button"/></td>
      </tr>
    </table>
    </form>
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