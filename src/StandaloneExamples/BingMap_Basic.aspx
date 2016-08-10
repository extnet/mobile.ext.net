<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    public object MyMapOptions = new
    {
        zoom = 16,
        center = new
        {
            latitude = 53.5460731,
            longitude = -113.4991877
        }
    };
</script>

<html>
<head runat="server">
    <title>Ext.Map example</title>
</head>
<body>
    <ext:ResourceManager runat="server" ScriptMode="Debug" SourceFormatting="true" />
    <ext:BingMap runat="server" FullScreen="true" MapOptions="<%# MyMapOptions %>" />
</body>
</html>