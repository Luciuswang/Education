<%
'--------定义部份------------------
Dim Neeao_Application_Value
Dim Neeao_Post,Neeao_Get,Neeao_Inject,Neeao_Inject_Keyword,Neeao_Kill_IP,Neeao_Write_Data
Dim Neeao_Alert_Url,Neeao_Alert_Info,Neeao_Kill_Info,Neeao_Alert_Type
Dim Neeao_Sec_Forms,Neeao_Sec_Form_open,Neeao_Sec_Form

If IsArray(Application("Neeao_config_info"))=False Then Call PutApplicationValue()
Neeao_Application_Value = Application("Neeao_config_info")
'获取配置信息
Neeao_Inject = Neeao_Application_Value(0)
Neeao_Kill_IP = Neeao_Application_Value(1) 
Neeao_Write_Data = Neeao_Application_Value(2)
Neeao_Alert_Url = Neeao_Application_Value(3)
Neeao_Alert_Info = Neeao_Application_Value(4)
Neeao_Kill_Info = Neeao_Application_Value(5)
Neeao_Alert_Type = Neeao_Application_Value(6)
Neeao_Sec_Forms = Neeao_Application_Value(7)
Neeao_Sec_Form_open = Neeao_Application_Value(8)

'安全页面参数
Neeao_Sec_Form = split(Neeao_Sec_Forms,"|")
Neeao_Inject_Keyword = split(Neeao_Inject,"|")

If Neeao_Kill_IP=1 Then Stop_IP

If Request.Form<>"" Then StopInjection(Request.Form)

If Request.QueryString<>"" Then StopInjection(Request.QueryString)

If Request.Cookies<>"" Then StopInjection(Request.Cookies)


Function Stop_IP()
	Dim Sqlin_IP,rsKill_IP,Kill_IPsql
	Sqlin_IP=Request.ServerVariables("REMOTE_ADDR")
	Kill_IPsql="select Sqlin_IP from SqlIn where Sqlin_IP='"&Sqlin_IP&"' and kill_ip=true"
	Set rsKill_IP=conn.execute(Kill_IPsql)
	If Not(rsKill_IP.eof or rsKill_IP.bof) Then
		N_Alert(Neeao_Kill_Info)
	Response.End
	End If
	rsKill_IP.close	
End Function



'sql通用防注入主函数
Function StopInjection(values)
	Dim Neeao_Get,Neeao_i
	For Each Neeao_Get In values

		If Neeao_Sec_Form_open = 1 Then 
			For Neeao_i=0 To UBound(Neeao_Sec_Form)
				If Instr(LCase(SelfName),Neeao_Sec_Form(Neeao_i))> 0 Then 
					Exit Function
				else
					Call Select_BadChar(values,Neeao_Get)
				End If 
			Next
			
		Else
			Call Select_BadChar(values,Neeao_Get)
		End If 
	Next
End Function 

Function Select_BadChar(values,Neeao_Get)
	Dim Neeao_Xh
	Dim Neeao_ip,Neeao_url,Neeao_sql
	Neeao_ip = Request.ServerVariables("REMOTE_ADDR")
	Neeao_url = Request.ServerVariables("URL")

	For Neeao_Xh=0 To Ubound(Neeao_Inject_Keyword)
		If Instr(LCase(values(Neeao_Get)),Neeao_Inject_Keyword(Neeao_Xh))<>0 Then
			If Neeao_Write_Data = 1 Then				
				Neeao_sql = "insert into SqlIn(Sqlin_IP,SqlIn_Web,SqlIn_FS,SqlIn_CS,SqlIn_SJ) values('"&Neeao_ip&"','"&Neeao_url&"','"&intype(values)&"','"&Neeao_Get&"','"&N_Replace(values(Neeao_Get))&"')"
				'response.write Neeao_sql
				conn.Execute(Neeao_sql)
				conn.close
				Set conn = Nothing
			
			End If			
			N_Alert(Neeao_Alert_Info)
			Response.End
		End If
	Next
End Function

'输出警告信息
Function N_Alert(Neeao_Alert_Info)
	Dim str
	'response.write "test"
	str = "<"&"Script Language=JavaScript"&">"
	Select Case Neeao_Alert_Type
		Case 1
			str = str & "window.opener=null; window.close();"
		Case 2
			str = str & "alert('"&Neeao_Alert_Info&"');window.opener=null; window.close();"
		Case 3
			str = str & "location.href='"&Neeao_Alert_Url&"';"
		Case 4
			str = str & "alert('"&Neeao_Alert_Info&"');location.href='"&Neeao_Alert_Url&"';"
	end Select
	str = str & "<"&"/Script"&">"
	response.write  str
End Function 

'判断注入类型函数
Function intype(values)
	Select Case values
		Case Request.Form
			intype = "Post"
		Case Request.QueryString
			intype = "Get"
		Case Request.Cookies
			intype = "Cookies"
	end Select
End Function

'干掉xss脚本
Function N_Replace(N_urlString)
	N_urlString = Replace(N_urlString,"'","''")
    N_urlString = Replace(N_urlString, ">", "&gt;")
    N_urlString = Replace(N_urlString, "<", "&lt;")
    N_Replace = N_urlString
End Function

Sub  PutApplicationValue()
	dim  infosql,rsinfo
	set rsinfo=conn.execute("select N_In,Kill_IP,WriteSql,alert_url,alert_info,kill_info,N_type,Sec_Forms,Sec_Form_open from sqlconfig")
	Redim ApplicationValue(9)
	dim i
	for i=0 to 8
		ApplicationValue(i)=rsinfo(i)
	next
	set rsinfo=nothing
	Application.Lock
	set Application("Neeao_config_info")=nothing
	Application("Neeao_config_info")=ApplicationValue
	Application.unlock
end Sub

'获取本页文件名
Function SelfName()
    SelfName = Mid(Request.ServerVariables("URL"),InstrRev(Request.ServerVariables("URL"),"/")+1)
End Function

%>

<%
'危险操作方式过滤
	Dim GetFlag Rem(提交方式)
	Dim ErrorSql Rem(非法字符) 
	Dim RequestKey Rem(提交数据)
	Dim ForI Rem(循环标记)
	ErrorSql = "'~;~and~(~)~exec~update~count~*~%~chr~mid~master~truncate~char~declare" Rem(每个敏感字符或者词语请使用半角 "~" 格开)
	ErrorSql = split(ErrorSql,"~")
	If Request.ServerVariables("REQUEST_METHOD")="GET" Then
	GetFlag=True
	Else
	GetFlag=False
	End If
	If GetFlag Then
	  For Each RequestKey In Request.QueryString
	   For ForI=0 To Ubound(ErrorSql)
		If Instr(LCase(Request.QueryString(RequestKey)),ErrorSql(ForI))<>0 Then
		response.write "<script>alert(""警告:\n请不要尝试非法注入！！"");history.go(-1);</script>"
		Response.End
		End If
	   Next
	  Next 
	Else
	  For Each RequestKey In Request.Form
	   For ForI=0 To Ubound(ErrorSql)
		If Instr(LCase(Request.Form(RequestKey)),ErrorSql(ForI))<>0 Then
		response.write "<script>alert(""警告:\n请不要尝试非法注入！！"");history.go(-1);</script>"
		Response.End
		End If
	   Next
	  Next
	End If
%>

    