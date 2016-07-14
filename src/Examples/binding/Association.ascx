<%@ Control Language="C#" %>

<%@ Import Namespace="Ext.Net.Mobile.Examples.Class.KitchenSink" %>

<ext:Container runat="server">
    <CustomConfig>
        <ext:ConfigItem Name="viewModel"
            Value="{ formulas: { person: function(get) { return get('peopleList.selection'); } }, stores: { people: App.Store1 } }"
            Mode="Raw" />
    </CustomConfig>
    <LayoutConfig>
        <ext:VBoxLayoutConfig Align="Stretch" />
    </LayoutConfig>
    <Items>
        <ext:List runat="server" Flex="2" Reference="peopleList" BindString="{people}">
            <ItemTpl runat="server">
                <Html>{FirstName} {LastName}</Html>
            </ItemTpl>
        </ext:List>
        <ext:List runat="server" Flex="3" BindString="{person.Accounts}">
            <ItemTpl runat="server">
                <Html>Created: {field1.Created}, Key: {field1.AccountKey}</Html>
            </ItemTpl>
            <Items>
                <ext:TitleBar runat="server" Docked="Top" Title="Accounts"
                    BindString="Accounts for {person.FirstName} {person.LastName}" />
            </Items>
        </ext:List>
    </Items>
    <Bin>
        <ext:Store runat="server" ID="Store1" Data="<%# GetPeople.WithAccount(5) %>" />
    </Bin>
</ext:Container>