<html>
<head>
	<link href="site.css" rel="stylesheet" type="text/css">
	<title>BaHRiiL �ET</title><body>
</head>
<body>
<table width="400" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
      <tr>
        <td width="10" bgcolor="e2e2e2">&nbsp;</td>
        <td width="97%" bgcolor="#FFFFFF"><div align="right">
          <span class="sitetitle">Bahriil <font color="#FF6600">Chat</font><font color="#CCCCCC"> 
          v.4</font></span></div></td>
      </tr>
      <tr>
        <td width="10" bgcolor="e2e2e2">&nbsp;</td>
        <td bgcolor="#FFFFFF">
          <form action="chat.asp?event=login" method="post" name="EnterChat" id="EnterChat">
            <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td> Nick adn�z:</td>
              </tr>
              <tr>
                <td><input name="login" type="text" class="field" size="20"></td>
              </tr>
              <tr>
                <td>                  <a href="#" onClick="EnterChat.submit();">Sohbete kat�l</a> <br>
                  <%
			If request("error") = 1 Then 
				Response.write "<p/><font color=""red"">Nick "& Request("username") &" kullan�mda!</font>"
			End If
		%></td>
              </tr>
            </table>
          </form>
        </td>
      </tr>
      <tr>
        <td width="10" bgcolor="e2e2e2">&nbsp;</td>
        <td bgcolor="#FFFFFF">
        <a target="_blank" href="http://www.bahriil.efsanesi.com">� Bahriil.Efsanesi.com</a></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>