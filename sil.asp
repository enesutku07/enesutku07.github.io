<%
set objcon = server.CreateObject("ADODB.Connection")
objCon.open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &Server.MapPath("data/mucahit.mdb") )

id = Request("id")
Set objyazi = Server.CreateObject("ADODB.RecordSet")
SQL_delete = "DELETE from mesaj WHERE id="&id&""
objyazi.open SQL_delete,ObjCon,1,3

Response.Redirect Request.serverVariables("HTTP_REFERER")
%>