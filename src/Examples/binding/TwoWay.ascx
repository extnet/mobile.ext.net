<%@ Control Language="C#" %>

<ext:FormPanel runat="server" ID="FormPanel1">
    <PreInit Handler="this.makeRandomTitle = function () { this.getViewModel().set('title', 'Title ' + Ext.Number.randomInt(0, 1000)); }" />
    <CustomConfig>
        <ext:ConfigItem Name="viewModel"
            Value="{ data: { title: 'Default Title' } }"
            Mode="Raw" />
    </CustomConfig>
    <Items>
        <ext:TitleBar runat="server" Docked="Top" BindString="{title}">
            <Items>
                <ext:Button runat="server" Text="Random Title" Handler="this.up('formpanel').makeRandomTitle();" />
            </Items>
        </ext:TitleBar>
        <ext:FieldSet runat="server"
            Instructions="Change the text field which will alter the title bar text using binding. The random title button sets the title on the ViewModel, which is propagated to both the field and the title bar text.">
            <Items>
                <ext:TextField runat="server" Label="Title" BindString="{title}" />
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>