
<%
'É¾³ý¾²Ì¬Ò³Ãæ
Sub Delhtml(htmlname)
	On Error Resume Next
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	servermap=server.MapPath("..")
	servermap=servermap&"\"&htmlname
	FSO.DeleteFile(servermap)
	Set FSO = Nothing
End Sub
%>