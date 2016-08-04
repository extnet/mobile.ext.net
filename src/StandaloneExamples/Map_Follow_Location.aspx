<%@ Page Language="C#" %>

<!DOCTYPE html>

<%--
 Example based on this discussion at Sencha Forums:
 https://www.sencha.com/forum/showthread.php?178912
--%>

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

    <script type="text/javascript">
        var geolocationUpdateHandler = function (geo) {
            var center = new google.maps.LatLng(geo.latitude, geo.longitude),
                map = geo.map;

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
    <ext:Map runat="server" FullScreen="true" AllowNoAPIKey="true" MapOptions="<%# MyMapOptions %>">
        <Geo runat="server" AutoUpdate="true" MaximumAge="0" Timeout="2000">
            <Listeners>
                <LocationError Fn="geolocationErrorHandler" />
                <LocationUpdate Fn="geolocationUpdateHandler" />
            </Listeners>
        </Geo>
    </ext:Map>
</body>
</html>