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
        zoom = 13
    };
    
    public void HandleSelection(object sender, DirectEventArgs e)
    {
        var lat = double.NaN;
        var lon = double.NaN;
        
        Ext.Net.Mobile.Parameter selectedItem;
        LocationCoordPair coordItem = null;
        
        if (e.ExtraParams.Count > 0)
        {
            selectedItem = e.ExtraParams.GetParameter("value");

            if (selectedItem != null && selectedItem.Value.Length == 2)
            {
                coordItem = Location_List.First(m => m.prefix == selectedItem.Value);

                if (coordItem != null)
                {
                    lat = coordItem.coordinates.Latitude;
                    lon = coordItem.coordinates.Longitude;
                }
            }
        }
        
        if (double.IsNaN(lat) || double.IsNaN(lon))
        {
            throw new ArgumentException("Invalid location prefix argument provided for HandleSelect.",
                "location_prefix");
        };

        Map1.SetMapCenter(lat, lon);
    }

    [DirectMethod]
    public void PlaceMapMarkers()
    {
        var curLoc = new object[]
        {
            new JRawValue(Map1.ClientID + ".getMap()"),
            new Coords(),
            ""
        };

        foreach (var location in Location_List)
        {
            curLoc[1] = location.coordinates;
            curLoc[2] = location.name;

            X.Js.Call("placeMarker", curLoc[0], JSON.JavaScriptSerialize(curLoc[1]), curLoc[2]);
        }
    }

    [DirectMethod]
    public void HandleMarkerClick(double lat, double lon)
    {
        X.Msg.Show(new MessageBoxConfig()
        {
            Title = "Marker click",
            Message = "You clicked a marker at (" + lat.ToString() + ", " + lon.ToString() + ")."
        });
    }
      
    public class LocationCoordPair {
        public string prefix;
        public string name;
        public Coords coordinates;
    }

    public static readonly List<LocationCoordPair> Location_List = new List<LocationCoordPair>
    {
        new LocationCoordPair()
        {
            prefix = "ca",
            name = "Canada",
            coordinates = new Coords() { Latitude = 53.5460731, Longitude = -113.4991877 }
        },
        new LocationCoordPair()
        {
            prefix = "br",
            name = "Brazil",
            coordinates = new Coords() { Latitude = -19.9342138, Longitude = -43.9385674 }
        },
        new LocationCoordPair()
        {
            prefix = "ru",
            name = "Russia",
            coordinates = new Coords() { Latitude = 59.9305376, Longitude = 30.3626455 }
        },
        new LocationCoordPair()
        {
            prefix = "tk",
            name = "Turkey",
            coordinates = new Coords() { Latitude = 36.9001622, Longitude = 30.7138142 }
        }
    };

    public static readonly object SelectedEntry = new { value = "ca" };
</script>

<html>
<head runat="server">
    <title>Ext.Map example</title>
    <script type="text/javascript">
        var handleMapRender = function (item, map) {
            App.direct.PlaceMapMarkers();
        }

        var handleMarkerClick = function (event) {
            var me = this;

            if (!me instanceof google.maps.Marker) {
                return false;
            }

            App.direct.HandleMarkerClick(me.position.lat(), me.position.lng());
        }

        var placeMarker = function (map, location, title) {
            if (location === "undefined" ||
                location.longitude === "undefined" || location.latitude === "undefined") {
                location = map.center;
            }

            // google API requires the parameters to be 'lat' and 'lng'.
            var gLatLng = { lat: location.latitude, lng: location.longitude };

            var marker = new google.maps.Marker({
                map: map,
                position: gLatLng,
                title: title,
                opacity: 0.8,
                animation: google.maps.Animation.DROP
            });

            marker.addListener('click', handleMarkerClick);

            return marker;
        }
    </script>
</head>
<body>
    <ext:ResourceManager runat="server" ScriptMode="Debug" SourceFormatting="true" />

    <ext:Container runat="server" FullScreen="true" Layout="VBoxLayout">
        <Items>
            <ext:SelectField
                ID="SelectField1"
                runat="server"
                Label="Location quick jump"
                AutoDataBind="true"
                Selection="<%# SelectedEntry %>">
                <Options>
                    <ext:ListItem Text="Brazil" Value="br" />
                    <ext:ListItem Text="Canada" Value="ca" />
                    <ext:ListItem Text="Russia" Value="ru" />
                    <ext:ListItem Text="Turkey" Value="tk" />
                </Options>
                <DirectEvents>
                    <Initialize OnEvent="HandleSelection">
                        <ExtraParams>
                            <ext:Parameter Name="value" Value="item.getSelection().data.value" Mode="Raw" />
                        </ExtraParams>
                    </Initialize>
                    <Change OnEvent="HandleSelection">
                        <ExtraParams>
                            <ext:Parameter Name="value" Value="newValue.data.value" Mode="Raw" />
                        </ExtraParams>
                    </Change>
                </DirectEvents>
            </ext:SelectField>

            <%-- The following maps API key is only supposed to work from Ext.NET sites (*.ext.net domains). --%>
            <ext:Map 
                ID="Map1"
                runat="server" Flex="1"
                APIKey="AIzaSyBB1LuWnmdq6JaM425i9N7NahAXxBAdG_c"
                MapOptions="<%# MyMapOptions %>">
                <Listeners>
                    <MapRender Fn="handleMapRender" />
                </Listeners>
            </ext:Map>
        </Items>
    </ext:Container>
</body>
</html>