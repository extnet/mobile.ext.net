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
        <%-- We don't have the Grid component yet. --%>
        <ext:Component runat="server" MinHeight="225" Flex="3" BindString="{everyone}">
            <CustomConfig>
                <ext:ConfigItem Name="xtype" Value="grid" />
                <ext:ConfigItem Name="title" Value="All people" />
                <ext:ConfigItem Name="columns"
                    Value="[{ text: 'First Name', width: 200, dataIndex: 'FirstName' },{ text: 'Last Name', width: 200, dataIndex: 'LastName' },{ text: 'Age', width: 100, dataIndex: 'Age' }]"
                    Mode="Raw" />
            </CustomConfig>
        </ext:Component>
        <ext:Component runat="server" MinHeight="300" Flex="4" BindString="{ageFiltered}">
            <CustomConfig>
                <ext:ConfigItem Name="xtype" Value="grid" />
                <ext:ConfigItem Name="titlebar" Value="null" Mode="Raw" />
                <ext:ConfigItem Name="items"
                    Value="[{ xtype: 'titlebar', docked: 'top', bind: 'People aged {minimumAge} or over' },{ xtype: 'singlesliderfield', docked: 'top', label: 'Minimum Age', bind: '{minimumAge}' }]"
                    Mode="Raw" />
                <ext:ConfigItem Name="columns"
                    Value="[{ text: 'First Name', width: 200, dataIndex: 'FirstName' },{ text: 'Last Name', width: 200, dataIndex: 'LastName' },{ text: 'Age', width: 100, dataIndex: 'Age' }]"
                    Mode="Raw" />
            </CustomConfig>
        </ext:Component>
    </Items>
    <Bin>
        <ext:Store runat="server" ID="Store1" Data="<%# GetPeople.RandomData(15, 10) %>" />
    </Bin>
</ext:Container>