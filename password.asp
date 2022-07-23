<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />

<%
dim parola
parola = "145314"
if session("administrator") <> parola then
if request.form("administrator") <> parola then
call parolaform
else
session("administrator") = parola
end if
end if
%>

<%'-----------------------------------------------------------------------------------------------------------'%>
<%
sub parolaform
aynen = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("URL")
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title></title>
</head>
<body bgcolor="#FFFFFF">
<p align="center">&nbsp;</p>
<p align="center"><b><font face="Tahoma" size="2">Yönetim Parolasını Giriniz:</font></b></p>
<form method=post action="<%=aynen%>">
<p align="center">
<b><font face="Verdana" size="2">&nbsp;Şifre:</font></b> 
<input type="password" name="administrator" value="" size="20" class="form" style="border: 1px solid #000000; font-family:Tahoma; font-size:8pt; background-color:#C0C0C0">
<input type="submit" value="Giriş" class="form" style="font-family: Tahoma; font-size: 8pt; color: #000000; font-weight: bold; border: 1px solid #000000; background-color: #C0C0C0">
</form>
</font>

<%
response.end
end sub
%><%'-------------------------------------------------------------------------------------------------------------'%>
