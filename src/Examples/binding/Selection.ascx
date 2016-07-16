<%@ Control Language="C#" %>

<%@ Import Namespace="Ext.Net.Mobile.Examples.Class.KitchenSink" %>

<script runat="server">
    public static object Model = new
    {
        stores = new
        {
            people = new JRawValue("App.Store1")
        }
    };
</script>

<ext:Container runat="server" ViewModel="<%# Model %>" AutoDataBind="true">
    <LayoutConfig>
        <ext:HBoxLayoutConfig Align="Stretch" />
    </LayoutConfig>
    <Items>
        <ext:List runat="server" Flex="1"
            BindString="{people}"
            Reference="peopleList">
            <ItemTpl runat="server">
                <Html>{LastName}, {FirstName}</Html>
            </ItemTpl>
        </ext:List>
        <ext:FormPanel runat="server" Flex="1">
            <Items>
                <ext:FieldSet runat="server"
                    Instructions="The form is bound to the selection in the list. As the form fields change, the models in the list are automatically updated 'with the field input.">
                    <Items>
                        <ext:TextField runat="server" Label="First Name" LabelAlign="Top"
                            BindString="{peopleList.selection.FirstName}" />
                        <ext:TextField runat="server" Label="Last Name" LabelAlign="Top"
                            BindString="{peopleList.selection.LastName}" />
                    </Items>
                </ext:FieldSet>
            </Items>
        </ext:FormPanel>
    </Items>
    <Bin>
        <ext:Store runat="server" ID="Store1" Data="<%# GetPeople.FixedData %>" />
    </Bin>
</ext:Container>