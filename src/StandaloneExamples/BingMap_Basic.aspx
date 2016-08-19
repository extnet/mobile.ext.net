<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    public object MyMapOptions = new
    {
        zoom = 13,
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

    <script type="text/javascript">
        // Due to a bug in BingMap interface with ExtJS, the 'map' or 'item.getMap()'
        // is not ready by the time of rendering and a deferred (delayed) function must
        // take place in order to wait the view to get ready and the map component be
        // reachable.
        var handleMapRender = function (item)
        {
            var deferredHandler = function (item) {
                var map = item.getMap(),
                    pin = new Microsoft.Maps.Pushpin(map.getCenter());

                map.entities.push(pin);
            }

            Ext.defer(deferredHandler, 2000, this, [item]);
        }
    </script>
</head>
<body>
    <ext:ResourceManager runat="server" ScriptMode="Debug" SourceFormatting="true" />
    <ext:BingMap
        ID="BingMap1"
        runat="server"
        FullScreen="true"
        MapOptions="<%# MyMapOptions %>">
        <Listeners>
            <MapRender Fn="handleMapRender" />
        </Listeners>
    </ext:BingMap>
</body>
</html>