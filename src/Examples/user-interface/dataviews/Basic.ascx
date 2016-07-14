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

<ext:Container runat="server" FullScreen="true" Layout="FitLayout" Cls="ks-basic">
    <Items>
        <ext:DataView runat="server" Scrollable="Both" Cls="dataview-basic">
            <ItemTpl runat="server">
                <Html>
                    <div class="img" style="background-image: url({photo});"></div>
                    <div class="content">
                        <div class="name">{first_name} {last_name}</div>
                        <div class="affiliation">{affiliation}</div>
                    </div>
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
