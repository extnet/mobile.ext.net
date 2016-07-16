<%@ Control Language="C#" %>

<%@ Import Namespace="Ext.Net.Mobile.Examples.Class.KitchenSink" %>

<script runat="server">
    public static object Model = new
    {
        formulas = new
        {
            person = new JFunction("return get('peopleList.selection');", "get")
        },
        stores = new { people = new JRawValue("App.Store1") }
    };
</script>

<ext:Container runat="server" ViewModel="<%# Model %>" AutoDataBind="true">
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