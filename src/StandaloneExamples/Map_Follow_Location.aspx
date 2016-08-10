<%@ Page Language="C#" %>

<!DOCTYPE html>

<%--
 Example based on this discussion at Sencha Forums:
 https://www.sencha.com/forum/showthread.php?178912

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

    <script type="text/javascript">
        var geolocationUpdateHandler = function (geo) {
            var center = new google.maps.LatLng(geo.getLatitude(), geo.getLongitude()),
                map = geo.map;

            console.log('update location!');

            if (map.rendered) {
                map.update(center)
            } else {
                map.on('activate', map.onUpdate, map, { single: true, data: center });
            }
        }

        var geolocationErrorHandler = function (
            geo,
            bTimeout,
            bPermissionDenied,
            bLocationUnavailable,
            message) {

            console.log('location error event catched.');

            if (bLocationUnavailable) {
                Ext.Msg.alert(
                    'Location Error',
                    'Your Current Location is Unavailable on this device',
                    Ext.emptyFn);
            }
            else if (bPermissionDenied) {
                Ext.Msg.alert(
                    'Location Error',
                    'Location capabilities have been disabled on this device.',
                    Ext.emptyFn);
            }
        }
    </script>
</head>
<body>
    <ext:ResourceManager runat="server" ScriptMode="Debug" SourceFormatting="true" />

    <%-- The following maps API key is only supposed to work from Ext.NET sites (*.ext.net domains). --%>
    <ext:Map
        ID="map1"
        runat="server"
        FullScreen="true"
        APIKey="AIzaSyBB1LuWnmdq6JaM425i9N7NahAXxBAdG_c"
        MapOptions="<%# MyMapOptions %>">
        <Geo runat="server" AutoUpdate="true" MaximumAge="0" Timeout="2000">
            <Listeners>
                <LocationError Fn="geolocationErrorHandler" />
                <LocationUpdate Fn="geolocationUpdateHandler" />
            </Listeners>
        </Geo>
    </ext:Map>
</body>
</html>