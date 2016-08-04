<%@ Control Language="C#" %>

<ext:Panel
    runat="server"
    StyleHtmlContent="true"
    Html="This is a simple example of fields within toolbars.">
    <Items>
        <ext:Toolbar runat="server" Docked="Top">
            <Items>
                <ext:SearchField runat="server" PlaceHolder="Search" Name="searchfield" />
            </Items>
        </ext:Toolbar>
        <ext:Toolbar runat="server" Docked="Top" UIName="light">
            <Items>
                <ext:TextField runat="server" Width="100" PlaceHolder="Text" Name="searchfield" />
                <ext:ToggleField runat="server" Name="toggle" />
            </Items>
        </ext:Toolbar>
        <ext:Toolbar runat="server" Docked="Bottom">
            <Items>
                <ext:ToolbarSpacer runat="server" />
                <ext:SelectField runat="server" Name="options">
                    <Options>
                        <ext:ListItem Text="This is just a big select with super long option" Value="1" />
                        <ext:ListItem Text="Another select item" Value="2" />
                    </Options>
                </ext:SelectField>
                <ext:ToolbarSpacer runat="server" />
            </Items>
        </ext:Toolbar>
    </Items>
</ext:Panel>