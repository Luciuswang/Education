<!-- #include file="UploadClass.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-size: 12px;
}
-->
</style>
<title> System Management</title>
<%
  Server.ScriptTimeout = 99999
 
  path = "../upLoadFile/" '实际路径
  path2 = "upLoadFile/"   '入库路径
  set Upload = new DoteyUpload
  Upload.ProgressID = Request.QueryString("ProgressID")
  dim ID
  ID=trim(Request("ID"))
Upload.Upload() '上传文件

If upload.ErrMsg = "" then
	For Each formName In upload.Files ''列出所有上传了的文件
		Set file = upload.Files(formName)  ''生成一个文件对象
 if file.filesize<100 then
 	response.write "请先选择你要上传的文件　[ <a onclick=history.go(-1) style='cursor: hand'>重新上传</a> ]"
	response.end
 end if
  fileExt=lcase(right(file.filename,3))
const UpFileType="midi|mid|mpe|wma|avi|rm|mp3|gif|jpg|doc|xls|ppt|mp3|wma|asf|bmp|mid|aiff|arj|ram|rar|txt|wav|zip|png|psd|swf|flv|pdf"

  arrUpFileType=split(UpFileType,"|")
 for i=0 to ubound(arrUpFileType)
			if fileEXT=trim(arrUpFileType(i)) then
				EnableUpload=true
				exit for
			end if
 next
 if fileEXT="asp" or fileEXT="asa" or fileEXT="aspx" or fileEXT="js" or fileEXT="exe" or fileEXT="jsp" or fileEXT="php" then
			EnableUpload=false
 end if
 if EnableUpload=false then
			response.write "该文件类型不只允许上传 [ <a onclick=history.go(-1) style='cursor: hand'>重新上传</a> ]"
			response.end
 end if

' 遍历所有已上传文件
Randomize '初始化随机数生成器
 ranNum=int(90000*rnd)+10000
For Each fileItem In Upload.Files.Items	
filename=Path&year(now)&month(now)&day(now)&ranNum&"."&FileExt	
filename2=Path2&year(now)&month(now)&day(now)&ranNum&"."&FileExt			
fileItem.SaveAs (filename)
Next

response.write "<script>parent.document.addform."&ID&".value='"&filename2&"'</script>"
response.write "文件保存成功。 [ <a onclick=history.go(-1) style='cursor: hand'>返回</a> ]"
		Set file=nothing
	Next
Else
	Response.Write("上传过程中出现错误:" & Upload.ErrMsg)
End If
'上传报告 
'  if Upload.Files.Count > 0 then
'	Items = Upload.Files.Items
'  end if
'
'  Response.Write("您已上传 " & Upload.Files.Count & " 个文件到: " & path & "<hr>")
'  for each File in Upload.Files.Items
'	'File.SaveAs("c:\" & File.FileName)	''如果要保存，则去掉前面的注释
'   Response.Write("文件名: " & File.FileName & "<br>")
'    Response.Write("文件大小: " & File.FileSize/1024 & " KB<br>")
'    Response.Write("文件类型: " & File.FileType & "<br>")
'    Response.Write("客户端路径: " & File.FilePath & "<br>")
'    Response.Write("<hr>")
'  next
'  Response.Write("<br>")
Set upload=nothing
%>