<%@ Control Language="C#" %>

<%@ Import Namespace="Ext.Net.Mobile.Examples.Class.KitchenSink" %>

<ext:Container runat="server" Scrollable="Both">
    <CustomConfig>
        <%-- This 'referenceHolder' seems to be unused and does not change the example at all if removed. --%>
        <%--<ext:ConfigItem Name="referenceHolder" Value="true" Mode="Raw" />--%>
        <ext:ConfigItem Name="viewModel"
            Value="{ stores: { everyone: App.Store1, ageFiltered: { source: '{everyone}', filters: [{ property: 'Age', value: '{minimumAge}', operator: '>=' }], sorters: [{ property: 'Age', direction: 'ASC' }] } }, data: { minimumAge: 18 } }"
            Mode="Raw" />
    </CustomConfig>
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