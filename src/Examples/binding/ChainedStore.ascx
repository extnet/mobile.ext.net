<%@ Control Language="C#" %>

<%@ Import Namespace="Ext.Net.Mobile.Examples.Class.KitchenSink" %>

<script runat="server">
    public static object Model = new
    {
        stores = new
        {
            everyone = new JRawValue("App.Store1"),
            ageFiltered = new
            {
                source = "{everyone}",
                filters = new[]
                {
                    new
                    {
                        property = "Age",
                        value = "{minimumAge}",
                        @operator = ">="
                    }
                },
                sorters = new[] 
                {
                    new
                    {
                        property = "Age",
                        direction = "ASC"
                    }
                }
            }
        },
        data = new { minimumAge = 18 }
    };
</script>
<ext:Container runat="server" Scrollable="Both" ViewModel="<%# Model %>" AutoDataBind="true">
    <LayoutConfig>
        <ext:VBoxLayoutConfig Align="Stretch" />
    </LayoutConfig>
    <Items>
        <ext:Grid
            runat="server"
            MinHeight="225"
            Flex="3"
            BindString="{everyone}"
            Title="All people">
            <Columns>
                <ext:Column runat="server" Text="First Name" Width="200" DataIndex="FirstName" />
                <ext:Column runat="server" Text="Last Name" Width="200" DataIndex="LastName" />
                <ext:Column runat="server" Text="Age" Width="100" DataIndex="Age" />
            </Columns>
        </ext:Grid>

        <ext:Grid
            runat="server"
            MinHeight="300"
            Flex="4"
            BindString="{ageFiltered}"
            Title="All people">
            <Columns>
                <ext:Column runat="server" Text="First Name" Width="200" DataIndex="FirstName" />
                <ext:Column runat="server" Text="Last Name" Width="200" DataIndex="LastName" />
                <ext:Column runat="server" Text="Age" Width="100" DataIndex="Age" />
            </Columns>
            <Items>
                <ext:TitleBar runat="server" Docked="top" BindString="People aged {minimumAge} or over" />

                <ext:SingleSlider runat="server" Docked="Top" Label="Minimum Age" BindString="{minimumAge}" />
            </Items>
        </ext:Grid>
    </Items>
    <Bin>
        <ext:Store runat="server" ID="Store1" Data="<%# GetPeople.RandomData(15, 10) %>" />
    </Bin>
</ext:Container>
