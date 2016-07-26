<%@ Page Language="C#" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Ext.Map example</title>
</head>
<body>
    <ext:ResourceManager runat="server" ScriptMode="Debug" SourceFormatting="true" />
    <ext:BingMap runat="server" FullScreen="true"
        MapOptions="<%# new { center = new { latitude = -19.9506266, longitude = -43.9481374 } } %>" />
</body>
</html>
