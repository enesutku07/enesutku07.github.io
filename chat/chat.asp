<%
    Response.Expires = 0 
    Response.Expiresabsolute = Now() - 1 
    Response.AddHeader "pragma","no-cache" 
    Response.AddHeader "cache-control","private" 
    Response.CacheControl = "no-cache"
	'----------------setup------------------
	Const UserTiemout = 5 ' mins for user's timeout	
	Const Title = "ASLAN Chat v.2.5" 'title of web page 
	'----------------/setup------------------

	Select Case Request("event")
		Case "login"
			If Request("login") = "" Then
				Response.Redirect "index.asp"
			End If
			
			If ConnectUser(HTMLFormat(Request("login"))) = False Then
				Response.Redirect "index.asp?error=1&username=" & request("login")
			End If
		
			For ln =20 to 2 Step -1
				Application(ln)=Application(ln-1)
			Next
			
			Application("1")="<font color=""#666666""><b>"& Request("login") & "</b> Sohbete Katýldý</font>"
			Response.Redirect "chat.asp"
			
		' Show ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Case "show" 
			Response.Write  "<meta http-equiv='refresh' content='" & Session("refresh") &"'>"
			Response.Write  "<body bgcolor='#eeeeee'>"
			Response.Write  "<font face='arial,verdana' size='2'>"
			For f=1 to 20
				Response.Write  Application(f) & "<br/>"
			Next
			
		' Post ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Case "post"
			For ln =20 to 2 Step -1
				Application(ln)=Application(ln-1)
			Next
			
		' Smiles are here
			ChatText = HTMLFormat(Request("text"))
			ChatText = Replace(ChatText, ":)", "<img src=""images/smilies/smile1.gif""/>")
			ChatText = Replace(ChatText, ":D", "<img src=""images/smilies/smile2.gif""/>")
			ChatText = Replace(ChatText, ":o","<img src=""images/smilies/smile3.gif""/>")
			ChatText = Replace(ChatText, ":(", "<img src=""images/smilies/smile4.gif""/>")
			ChatText = Replace(ChatText, ";)", "<img src=""images/smilies/smile5.gif""/>")
			ChatText = Replace(ChatText, ":p", "<img src=""images/smilies/smile6.gif""/>")
			ChatText = Replace(ChatText, "8)", "<img src=""images/smilies/smile7.gif""/>")
			ChatText = Replace(ChatText, ":[", "<img src=""images/smilies/smile8.gif""/>")
			ChatText = Replace(ChatText, ":kill:", "<img src=""images/smilies/smile9.gif""/>")
			
			ChatCommand = Lcase(Mid(ChatText, 1, InstrRev(ChatText,":")))
			
			Select Case ChatCommand
				Case "/clear:"
					For t=1 to 20
						Application(t) = ""
					Next
				Case Else
					CurrentNickName = "<a onClick=""document.chatform.text.focus();"">" & Session("nickname") & "</a>"
					Application("1")="<b>" & Session("nickname") & ":</b> "& ChatText
			End Select
			x= SetUserSettings(Session("nickname"),"timer",Timer)			
			Response.Redirect "chat.asp?event=form"
			
		' Logout ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Case "logout"
			For ln =20 to 2 Step -1
				Application(ln)=Application(ln-1)
			Next
			
			Application("1")="<font color='#666666'><b>"& Session("nickname") & "</b> Sohbetten çýktý</font>"			
			
			x = DisconnectUser (Session("nickname"))

			Response.Redirect"../default.asp"
	
		' List Users ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
		Case "listusers"
			tmpBuf = tmpBuf & "<meta http-equiv='refresh' content='10'>"
			tmpBuf = tmpBuf & "<link href=""site.css"" rel=""stylesheet"" type=""text/css"">"
			tmpBuf = tmpBuf & "<body bgcolor='#6699CC'>"
			tmpBuf = tmpBuf & ListUsers
			tmpBuf = tmpBuf &"</body>"
			Response.Write tmpBuf
			
		' Setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Case "setup"			
			tmpBuf = tmpBuf & "<link href=""site.css"" rel=""stylesheet"" type=""text/css"">"
			tmpBuf = tmpBuf & "<body bgcolor=""#ffffff"">"
			tmpBuf = tmpBuf & "<span class=""sitetitle"">Ayarlama Bölümü</span>"
			tmpBuf = tmpBuf & "<hr size=""1"" noshade=""noshade"" color=""#cccccc"" />"
			tmpBuf = tmpBuf & "<center>"
			tmpBuf = tmpBuf & "<form action=""chat.asp?event=refresh"" method=""post"" name=""ChatForm"">"
			tmpBuf = tmpBuf & "<select class=""button"" size=""1""  name=""refresh"">"
			For Rfrsh = 5 To 60 Step 10			
				tmpBuf = tmpBuf & "<option value=""" & Rfrsh & """ >" & Rfrsh & "</option>"
			Next
			tmpBuf = tmpBuf & "<option value=""" & Session("refresh") & """ selected>" & Session("refresh") & "</option>"
			tmpBuf = tmpBuf & "</select>"
			tmpBuf = tmpBuf & "<input class=""button"" type=""submit"" value=""Kaç saniyede bir mesaj alýmý yapýlsýn"">"
			tmpBuf = tmpBuf & "</form>"
			Response.Write tmpBuf
			
		' Refresh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Case "refresh"
			Session("refresh") = Request("refresh")
			Response.Redirect"chat.asp"	
			
		' Form ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Case "form"
			tmpBuf = tmpBuf & "<link href=""site.css"" rel=""stylesheet"" type=""text/css"">" 
			tmpBuf = tmpBuf & "<body bgcolor=""#FFffff"" topmargin=""25"">"
			tmpBuf = tmpBuf & "<table border=""0"" width=""100%"" cellspacing=""0"" cellpadding=""0"">"
			tmpBuf = tmpBuf & "<tr>"
			tmpBuf = tmpBuf & "<td>"
			tmpBuf = tmpBuf & "<form action=""chat.asp?event=post"" method=""post"" name=""chatform"">"
			tmpBuf = tmpBuf & "<input class=""field"" type=""text"" name=""text"" size=""50"">"
			tmpBuf = tmpBuf & "<input type=""image"" src=""images/post.gif"" align=""absmiddle"" border=""0"">"
			tmpBuf = tmpBuf & "<br/>"
			' Smiles ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			tmpBuf = tmpBuf & " <a onClick=""document.chatform.text.value=':)'"">"
			tmpBuf = tmpBuf & "<img src=""images/smilies/smile1.gif"" class=""clsCursor"">"
			tmpBuf = tmpBuf & "</a>"
			
			tmpBuf = tmpBuf & " <a onClick=""document.chatform.text.value=':D'"">"
			tmpBuf = tmpBuf & "<img src=""images/smilies/smile2.gif"" class=""clsCursor"">"
			tmpBuf = tmpBuf & "</a>"
			
			tmpBuf = tmpBuf & " <a onClick=""document.chatform.text.value=':o'"">"
			tmpBuf = tmpBuf & "<img src=""images/smilies/smile3.gif"" class=""clsCursor"">"
			tmpBuf = tmpBuf & "</a>"
			
			tmpBuf = tmpBuf & " <a onClick=""document.chatform.text.value=':('"">"
			tmpBuf = tmpBuf & "<img src=""images/smilies/smile4.gif"" class=""clsCursor"">"
			tmpBuf = tmpBuf & "</a>"
			
			tmpBuf = tmpBuf & " <a onClick=""document.chatform.text.value=';)'"">"
			tmpBuf = tmpBuf & "<img src=""images/smilies/smile5.gif"" class=""clsCursor"">"
			tmpBuf = tmpBuf & "</a>"
			
			tmpBuf = tmpBuf & " <a onClick=""document.chatform.text.value=':p'"">"
			tmpBuf = tmpBuf & "<img src=""images/smilies/smile6.gif"" class=""clsCursor"">"
			tmpBuf = tmpBuf & "</a>"
			
			tmpBuf = tmpBuf & " <a onClick=""document.chatform.text.value='8)'"">"
			tmpBuf = tmpBuf & "<img src=""images/smilies/smile7.gif"" class=""clsCursor"">"
			tmpBuf = tmpBuf & "</a>"
			
			tmpBuf = tmpBuf & " <a onClick=""document.chatform.text.value=':['"">"
			tmpBuf = tmpBuf & "<img src=""images/smilies/smile8.gif"" class=""clsCursor"">"
			tmpBuf = tmpBuf & "</a>"
			'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~			
			tmpBuf = tmpBuf & "</td>"
			tmpBuf = tmpBuf & "<td width=""120"">"
			tmpBuf = tmpBuf & "<a href=""chat.asp?event=setup"" target=""_parent""><img border=""0"" src=""images/setup.gif""></a>"
			tmpBuf = tmpBuf & "<a href=""chat.asp?event=logout"" target=""_top""><img border=""0"" src=""images/exit.gif"" align=""absmiddle""></a>"
			tmpBuf = tmpBuf & "</td>"
			tmpBuf = tmpBuf & "</tr>"
			tmpBuf = tmpBuf & "</table>"
			tmpBuf = tmpBuf & "</form>"
			Response.Write tmpBuf			
			
		' Anything Else ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Case Else 
			tmpBuf = tmpBuf & "<link href=""site.css"" rel=""stylesheet"" type=""text/css"">" 
			tmpBuf = tmpBuf & "<frameset rows=""*,80"" cols=""*"" frameborder=""0"">"
			tmpBuf = tmpBuf & "<frameset cols=""*,130"">"
			tmpBuf = tmpBuf & "<frame name=""contents"" target=""main"" scrolling=""auto"" src=""chat.asp?event=show&userrefresh=" & Session("refresh") & """>"
			tmpBuf = tmpBuf & "<frame name=""main"" scrolling=""auto"" src=""chat.asp?event=listusers"">"
			tmpBuf = tmpBuf & "</frameset>"
			tmpBuf = tmpBuf & "<frame name=""bottom"" scrolling=""no"" target=""contents"" src=""chat.asp?event=form"">"
			tmpBuf = tmpBuf & "<noframes>"
			tmpBuf = tmpBuf & "<link href=""site.css"" rel=""stylesheet"" type=""text/css"">" 
			tmpBuf = tmpBuf & "<body>"
			tmpBuf = tmpBuf & "<p>This page uses frames, but your browser doesn't support them.</p>"
			tmpBuf = tmpBuf & "</body>"
			tmpBuf = tmpBuf & "</noframes>"
			tmpBuf = tmpBuf & "</frameset>"
			Response.Write tmpBuf
	End Select
	
	Function ListUsers()
		Dim UsersBuf
		Set XMLDOC = CreateObject("Microsoft.XMLDOM")
		XMLDOC.async = False
		XMLDOC.resolveExternals = False
			
		If Application("xmldoc") = "" Then			
			Application("xmldoc") = "<chat><users/></chat>"
		End If
		
		XMLDoc.LoadXML Application("xmldoc")			
		XPath = "//users/*"
		
		Set UsersList = XMLDOC.SelectNodes(XPath)
		
		If UsersList.Length = 0 Then
			ListUsers = "Oda boþ"
		Else
			For Each UserName In UsersList
				ThisUserTimeout = GetUserSettings(UserName.GetAttribute ("nick"), "timer") + (UserTiemout * 100)
				If Timer > ThisUserTimeout Then 
					DisconnectUser(UserName.GetAttribute ("nick"))
					Exit For
				End If
				UsersBuf = UsersBuf & UserName.GetAttribute ("nick") & "<br/>" '" (" & FormatNumber((ThisUserTimeout - Timer)/100,2) & ")" & "<br/>"
			Next
			ListUsers = UsersBuf
		End IF
	End Function
	
	Function ConnectUser (NickName)
		Set XMLDOC = CreateObject("Microsoft.XMLDOM")
		XMLDOC.async = False
		XMLDOC.resolveExternals = False
		
		If Application("xmldoc") = "" Then			
			Application("xmldoc") = "<chat><users/></chat>"
		End If
		
		XMLDoc.LoadXML Application("xmldoc")
		
		XPath = "//user[@nick='" & NickName & "']"
		Set RegisteredUser = XMLDOC.SelectSingleNode(XPath)		
		If RegisteredUser Is Nothing Then 
			XPath = "//users"
			Set UsersList = XMLDOC.SelectSingleNode(XPath)			
			Set NewUser = XMLDOC.CreateElement("user")
			NewUser.SetAttribute "nick", NickName
			NewUser.SetAttribute "timer", Timer			
			UsersList.AppendChild NewUser
			Application("xmldoc") = XMLDOC.xml
			Session("nickname") = NickName
			Session("refresh") = 5									
			ConnectUser = True			
		Else
			ConnectUser = False
		End If
	End Function
	
	Function DisconnectUser(NickName)
		Set XMLDOC = CreateObject("Microsoft.XMLDOM")
		XMLDOC.async = False
		XMLDOC.resolveExternals = False
		
		If Application("xmldoc") = "" Then			
			Application("xmldoc") = "<chat><users/></chat>"
		End If
		
		XMLDoc.LoadXML Application("xmldoc")
		
		XPath = "//user[@nick='" & NickName & "']"
		Set UserList = XMLDOC.SelectNodes(XPath)
		
		If UserList Is Nothing Then
			DisconnectUser = False
		Else
			For Each Node In UserList
				Node.parentNode.removeChild Node
			Next
			Application("xmldoc") = XMLDoc.xml
			DisconnectUser = True
		End If
	End Function
	
	Function GetUserSettings(LoginName, PropertyName)
		If LoginName = "" then Exit Function
		Set XMLDOC = CreateObject("Microsoft.XMLDOM")
		XMLDOC.async = False
		XMLDOC.resolveExternals = False
		
		If Application("xmldoc") = "" Then			
			Application("xmldoc") = "<chat><users/></chat>"
		End If
		
		XMLDoc.LoadXML Application("xmldoc")
		
		XPath = "//user[@nick='" & LoginName & "']"
		
		Set SelectedUser = XMLDOC.SelectSingleNode(XPath)
		If SelectedUser Is Nothing Then
			GetUserSettings = ""
		Else
			If Len(SelectedUser.GetAttribute(PropertyName)) = 0 Then
				GetUserSettings = ""
			Else
				GetUserSettings = SelectedUser.GetAttribute(PropertyName)
			End If
		End If
	End Function
	
	Function SetUserSettings(NickName,UserProperty,PropertyInfo) ' As Boolean
		Set XMLDOC = CreateObject("Microsoft.XMLDOM")
		XMLDOC.async = False
		XMLDOC.resolveExternals = False
		
		If Application("xmldoc") = "" Then			
			Application("xmldoc") = "<chat><users/></chat>"
		End If
		
		XMLDoc.LoadXML Application("xmldoc")
		
		XPath = "//user[@nick='" & NickName & "']"
		Set SelectedUser = XMLDOC.SelectSingleNode(XPath)
		If SelectedUser Is Nothing Then
			SetUserSettings = False
		Else
			SelectedUser.SetAttribute UserProperty, PropertyInfo
			Application("xmldoc") = XMLDOC.XML
			SetUserSettings = True
		End If		
	End Function
	
	Function HTMLFormat(sInput)
		Dim sAns
		Dim sIIIStart, sIIIEnd
		sAns = Replace(sInput, "  ", "&nbsp; ")
		sAns = Replace(sAns, Chr(34), "&quot;")
		sIllStart = "<" & Chr(37)
		sIllEnd = Chr(37) & ">"
	
		If InStr(sAns, sIllStart) > 0 Or InStr(sAns, sIllEnd) > 0 Then
		  sAns = Replace(sAns, "<" & Chr(37), "")
		  sAns = Replace(sAns, Chr(37) & ">", "")
		End If
	
		sAns = Replace(sAns, ">", "&gt;")
		sAns = Replace(sAns, "<", "&lt;")
		sAns = Replace(sAns, vbCrLf, "<BR>")
		sAns = Replace(sAns, "[b]", "<b>")
		sAns = Replace(sAns, "[/b]", "</b>")
		sAns = Replace(sAns, "[i]", "<i>")
		sAns = Replace(sAns, "[/i]", "</i>")
		HTMLFormat = sAns
	End Function

%>