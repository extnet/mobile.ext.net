<%@ Page Language="C#" %>

<!DOCTYPE html>

<%--
 Simple GPS position fetching example.

 Google maps API now requires, besides the API Key, that clients able to fetch
 geopositions (geo.getLatitude() for example) are accessing thru a secure https
 connection.

 With google chrome, this can be overridden by either running on localhost or
 setting chrome's --unsafely-treat-insecure-origin-as-secure="http://example.com".

 Read more about this limitation on:
 https://sites.google.com/a/chromium.org/dev/Home/chromium-security/deprecating-powerful-features-on-insecure-origins
--%>

<script runat="server">
    public object MyMapOptions = new
    {
        // We do not map the whole google maps API to Ext.NET so this is one
        // way to reference a variable from code behind.
        mapTypeId = new JRawValue("google.maps.MapTypeId.HYBRID"),
        zoom = 16
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
        MapOptions="<%# MyMapOptions %>" UseCurrentLocation="true" />
</body>
</html>