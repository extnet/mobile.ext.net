<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    public object MyMapOptions = new
    {
        // We do not map the whole google maps API to Ext.NET so this is one
        // way to reference a variable from code behind.
        mapTypeId = new JRawValue("google.maps.MapTypeId.HYBRID"),
        zoom = 16,
        center = new
        {
            lat = 53.5460731,
            lng = -113.4991877
        }
    };
</script>

<html>
<head runat="server">
    <title>Ext.Map example</title>
</head>
<body>
    <ext:ResourceManager runat="server" ScriptMode="Debug" SourceFormatting="true" />

    <%-- The following maps API key is only supposed to work from Ext.NET sites (*.ext.net domains). --%>
    <ext:Map runat="server" FullScreen="true"
        APIKey="AIzaSyBB1LuWnmdq6JaM425i9N7NahAXxBAdG_c"
        MapOptions="<%# MyMapOptions %>" />
</body>
</html>