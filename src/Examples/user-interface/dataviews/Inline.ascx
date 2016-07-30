<%@ Control Language="C#" %>

<%@ Import Namespace="Ext.Net.Mobile.Examples.Class" %>
<%@ Import Namespace="Ext.Net.Mobile.Examples.Models.KitchenSink" %>

<script runat="server">
    public List<Speaker> speakers_data
    {
        get
        {
            return GetFeeds.getSpeakerList();
        }
    }
</script>

<ext:Container runat="server" Layout="FitLayout" Cls="ks-basic">
    <Items>
        <ext:DataView runat="server" Scrollable="Both" Cls="dataview-inline">
            <CustomConfig>
                <ext:ConfigItem Name="inline" Value="true" Mode="Raw" />
            </CustomConfig>
            <ItemTpl runat="server">
                <Html>
                    <div class="img" style="background-image: url({photo});"></div>
                </Html>
            </ItemTpl>
            <Store>
                <ext:Store runat="server" ID="Speakers" Data="<%# speakers_data %>">
                    <Model>
                        <ext:Model runat="server">
                            <Fields>
                                <ext:ModelField Name="photo" />
                                <ext:ModelField Name="first_name" />
                                <ext:ModelField Name="last_name" />
                                <ext:ModelField Name="affiliation" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
        </ext:DataView>
    </Items>
</ext:Container>