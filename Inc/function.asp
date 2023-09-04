<%


Function removehtml(strHTML) 
Dim objRegExp, Match, Matches 
Set objRegExp = New Regexp 
objRegExp.IgnoreCase = True 
objRegExp.Global = True 
'取闭合的<> 
objRegExp.Pattern = "<[^>]*?>" 
'进行匹配 
Set Matches = objRegExp.Execute(strHTML) 
' 遍历匹配集合，并替换掉匹配的项目 
For Each Match in Matches 
strHtml=Replace(strHTML,Match.Value,"") 
Next 
RemoveHTML=strHTML 
Set objRegExp = Nothing 
End Function

Function IsValidEmail(email)
dim names, name, i, c
IsValidEmail = true
names = Split(email, "@")
if UBound(names) <> 1 then
   IsValidEmail = false
   exit Function
end if
for each name in names
   if Len(name) <= 0 then
     IsValidEmail = false
     exit Function
   end if
   for i = 1 to Len(name)
     c = Lcase(Mid(name, i, 1))
     if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
       IsValidEmail = false
       exit Function
     end if
   next
   if Left(name, 1) = "." or Right(name, 1) = "." then
      IsValidEmail = false
      exit Function
   end if
next
if InStr(names(1), ".") <= 0 then
   IsValidEmail = false
   exit Function
end if
i = Len(names(1)) - InStrRev(names(1), ".")
if i <> 2 and i <> 3 then
   IsValidEmail = false
   exit Function
end if
if InStr(email, "..") > 0 then
   IsValidEmail = false
end if
end Function

function strvalue(str,lennum)
	dim p_num
	dim i
	if strlen(str)<=lennum then
		strvalue=str
	else
		p_num=0
		x=0
		do while not p_num > lennum-2
			x=x+1
			if asc(mid(str,x,1))<0 then
				p_num=int(p_num) + 2
			else
				p_num=int(p_num) + 1
			end if
			strvalue=left(trim(str),x)&"...."
		loop
	end if
end function

function strlen(str)
	dim page_len
	page_len=0
	strlen=0
	if trim(str)<>"" then
		page_len=len(removehtml(str))
		for xx=1 to page_len
		if asc(mid(str,xx,1))<0 then
			strlen=int(strlen) + 2
		else
			strlen=int(strlen) + 1
		end if
		next
	end if
end function

%>