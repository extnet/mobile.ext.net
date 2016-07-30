<%@ Page Language="C#" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Ext.Map example</title>
</head>
<body>
    <ext:ResourceManager runat="server" ScriptMode="Debug" SourceFormatting="true" />
    <ext:Map runat="server" FullScreen="true"
        MapOptions="<%# new { center = new { lat = -19.9506266, lng = -43.9481374 } } %>" />
</body>
</html>