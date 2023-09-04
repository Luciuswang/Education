<%
'=================================================
'XYCMS企业建站系统 版权所有 技术支持QQ：364500483
'=================================================
if on_run=1 then
response.Write off_dc
response.End()
end if
'=================================================
function xycms_menu(xyview)
dim menu
set menu=server.CreateObject("adodb.recordset")
menu.open "select * from menu where view="&xyview&" order by pl_id asc",conn,1,1
while not menu.eof
response.Write("<li><a href="""&menu("url")&""" target="""&menu("open_m")&"""  title="""&menu("title")&""">"&menu("title")&"</a></li>")
menu.movenext
wend
menu.close
set menu=nothing
end function
'=================================================
'函数名：xycms_flash
'功能：焦点图调用
'调用参数：xypicw,长度；xypich,宽度
'=================================================
function xycms_flash(xypicw,xypich) %>
<script type=text/javascript>
        <!--
        var focus_width=<%=xypicw%>//图片宽
        var focus_height=<%=xypich%>//图片高
        var text_height=0//设置显示文字标题高度,最佳为20（如果不显示标题值设为0即可）
        var swf_height = focus_height+text_height
        //var pics=""
        //var links=""
        //var texts=""
		<%
		set db=conn.execute("select * from [jdt] order by pl_id asc")
			i=0
			do while not db.eof
				 pics=pics&"|"&db("img")
				 links=links&"|"&db("link")
				 texts=texts&"|"&db("title")
				db.moveNext
				i=i+1
			loop
response.write "var pics='"&right(pics,len(pics)-1)&"'"&vbcrlf
response.write "var links='"&right(links,len(links)-1)&"'"&vbcrlf
response.write "var texts='"&right(texts,len(texts)-1)&"'"&vbcrlf
		%>
        document.write('<object ID="focus_flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
        document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="images/play.swf"><param name="quality" value="high"><param name="bgcolor" value="#FFFFFF">');
        document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
        document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
        document.write('<embed ID="focus_flash" src="images/play.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#C5C5C5" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');document.write('</object>'); 
        //-->
</script>
<% end function
'=================================================
'函数名：xycms_commonlist
'功能：企业简介分类
'调用参数：无
'=================================================
function xycms_commonlist()
set commonlist=server.CreateObject("adodb.recordset")
commonlist.open "select * from common order by pl_id asc",conn,1,1
if commonlist.eof and commonlist.bof then
response.Write("&nbsp;暂无记录 !")
end if
while not commonlist.eof
response.Write("<li><a href=""common.asp?id="&commonlist("id")&""" title=""" & commonlist("title") &""">"  & commonlist("title") & "</a></li>")
commonlist.movenext
wend
commonlist.close
set commonlist=nothing
end function

function xycms_toplist(xytop,xyfl,xynum)
set toplist=server.CreateObject("adodb.recordset")
toplist.open "select top "&xytop&" * from news where ssfl="&xyfl&" order by id desc",conn,1,1
if toplist.eof and toplist.bof then
response.Write("&nbsp;暂无记录 !")
end if
while not toplist.eof
response.Write("<li><a href=""news_detail.asp?id="&toplist("id")&""" title=""" & toplist("title") &""" style=""color:"&toplist("color")&";"">"&left(toplist("title"),xynum) & "</a> &nbsp;<span>"&formatdatetime(toplist("data"),2)&"</span></li>")
toplist.movenext
wend
toplist.close
set toplist=nothing
end function

'=================================================
'函数名：xycms_news
'功能：新闻内容
'调用参数：xytop,调用条数；xytitle,标题字数；xyfl，新闻分类；xytj，是否推荐；xyorder，排列顺序
'=================================================
function xycms_news(xytop,xytitle,xyfl,xyorder)
Dim xycms_fl,xycms_tj,xycms_order
select case xyfl
       case 0
	   xycms_fl=""
	   case else
	   xycms_fl="and ssfl="&xyfl&""
end select
select case xyorder
       case 0
	   xycms_order="order by id desc"
	   case 1
	   xycms_order="order by hit desc"
	   case else
	   xycms_order=""
end select
set news=server.CreateObject("adodb.recordset")
  sql="select top "&xytop&" * from [news] where len(img)<4 and passed=1 "&xycms_fl&" "&xycms_order&""
news.open sql,conn,1,1
if news.eof and news.bof then
response.Write("&nbsp;暂无该新闻内容 !")
else
while not news.eof
dim url,color
if IsNull(news("url")) or trim(news("url")&"")="" then
url="news_detail.asp?id="&news("id")&""
else
url=""&news("url")&""
end if
if IsNull(news("color")) or trim(news("color")&"")="" then
color="#5D5D5D"
else
color=""&news("color")&""
end if 
%>
<li><span><%=FormatDateTime(news("data"),2)%></span> <a href="<%=url%>" style="color:<%=color%>;" title="<%=news("title")%>"><%=left(news("title"),xytitle)%></a></li>
<% news.movenext
wend
news.close
set news=nothing
end if
end function 

'=================================================
'函数名：xycms_aboutus
'功能：关于我们内容调用
'调用参数：newsid,ID编号；xynum,显示字数
'=================================================
function xycms_aboutus(newsid,xynum)
 set rs=server.createobject("adodb.recordset") 
   exec="select * from common where id="&newsid&" order by id desc  "
   rs.open exec,conn,1,1 
   if rs.eof and rs.bof then
   response.Write("&nbsp;暂无信息记录 !")
   else
   response.Write(""&strvalue(rs("body"),xynum)&"")
   rs.close
   set rs=nothing
   end if 
end function

'=================================================
'函数名：xycms_newsfllist
'功能：新闻分类
'=================================================
function xycms_newsfllist()
set newsfl=server.CreateObject("adodb.recordset")
newsfl.open "select * from news_fl order by pl_id asc",conn,1,1
if newsfl.eof and newsfl.bof then
response.Write("&nbsp;暂无信息记录 !")
end if
while not newsfl.eof
response.Write("<li><a href=""news.asp?id="&newsfl("id")&""" title=""" & newsfl("title") &""">"  & newsfl("title") & "</a> </li>")
newsfl.movenext
wend
newsfl.close
set newsfl=nothing
end function

function xycms_fwxmlist(xytop)
set fwxmlist=server.CreateObject("adodb.recordset")
fwxmlist.open "select top "&xytop&" * from [pxxm] order by id desc",conn,1,1
if fwxmlist.eof and fwxmlist.bof then
response.Write("&nbsp;暂无信息记录 !")
end if
while not fwxmlist.eof
response.Write("<li><a href=""pxxm_detail.asp?id="&fwxmlist("id")&""" title=""" & fwxmlist("title") &""">"  & fwxmlist("title") & "</a> </li>")
fwxmlist.movenext
wend
fwxmlist.close
set fwxmlist=nothing
end function

'=================================================
'函数名：xycms_contact
'功能：联系方式
'调用参数：xytop,调用条数；xytitle,标题字数
'=================================================
function xycms_contact()%>
<li><strong><%=wzname%></strong></li>
<li>联系地址：<%=address%></li>
<li>电 话：<%=telnum%></li>
<li>传 真：<%=faxnum%></li>
<% end function 

function xycms_link()
set link=server.CreateObject("adodb.recordset")
link.open "select * from [link] order by pl_id asc",conn,1,1
if link.eof and link.bof then
response.Write("&nbsp;暂无记录 !")
end if
while not link.eof
response.Write("<a href="""&link("url")&""" title=""" & link("title") &""" target=""_blank"">"&link("title")&"</a>")
link.movenext
wend
link.close
set link=nothing
end function

'=================================================
'函数名：xycms_newsimg
'功能：新闻图片
'=================================================
function xycms_newsimg(id)
set newsimg=server.createobject("adodb.recordset") 
exec="select * from  [news] where len(img)>4 and ssfl="&id&" order by id desc  " 
newsimg.open exec,conn,1,1 
if newsimg.eof and newsimg.bof then
response.Write("<li>暂无图片新闻!</li>")
else
%>
<div class="pic"><img src="<%=newsimg("img")%>" /></div>
        <h3><a href="news_detail.asp?id=<%=newsimg("id")%>" class="img" title="<%=newsimg("title")%>"><%=left(newsimg("title"),10)%>...</a></h3>
        <p><%=strvalue(newsimg("body"),60)%></p> 
<%
newsimg.close
set newsimg=nothing
end if
end function

function xycms_newstitle(id)
set newstitle=server.createobject("adodb.recordset") 
exec="select * from [news_fl] where id="&id&"" 
newstitle.open exec,conn,1,1 
%>
<%=newstitle("title")%>
<%
newstitle.close
set newstitle=nothing
end function

'=================================================
function xycms_xycase()
set xycase=server.createobject("adodb.recordset") 
exec="select * from [xyzp] where len(img)>4 order by id desc  " 
xycase.open exec,conn,1,1 
if xycase.eof and xycase.bof then
response.Write("<li>暂无最新产品!</li>")
else
do while not xycase.eof
%>
<li>
            <a href="xyzp_detail.asp?id=<%=xycase("id")%>" title="<%=xycase("title")%>"><img src='<%=xycase("img")%>' width='154' height='112' alt='<%=xycase("title")%>'></a>
            <p class="Blue"><a href="xyzp_detail.asp?id=<%=xycase("id")%>" title="<%=xycase("title")%>"><%=left(xycase("title"),12)%></a></p>
          </li> 
<%
xycase.movenext 
loop 
end if
xycase.close
set xycase=nothing
end function

%>

