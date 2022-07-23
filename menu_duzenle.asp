
<!--#include file="sayfa.asp"-->

<%if Session("UserLoggedIn")="False" then 'Yönetiçi þifresini Girmemiþse%>
<center>Giriþ yapmanýz gerekmektedir.</center>
<% else %>
<%
Set st = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler where sira_no= "& request.querystring("id")
st.Open sor,Sur,1,3
%>
<table align="center" cellpadding="0" cellspacing="0" style="border-collapse: collapse" class="tablo" border="0">
<tr>
<td align="center" height="200">

<form method="POST" action="menu_guncelle.asp?id=<%=st("sira_no")%>">
<input class="input" type="text" name="menu" size="25" maxlength="20" value="<%=st("menu")%>">
<input type="submit" class="input" value="Gönder">
</form>
</td></tr></table>
<%
end if
%>