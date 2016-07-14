<%@ Control Language="C#" %>

<ext:Panel
    runat="server"
    Cls="card"
    Html="Toolbars automatically come with <code>light</code> and <code>dark</code> UIs.">
    <PreInit Handler="this.tapHandler = function (button) {
                          this.setHtml('&lt;span class=action>User tapped ' + button.getText() + '&lt;/span>');
                      };

                      this.on({
                          scope: this,
                          delegate: 'button',
                          tap: 'tapHandler'
                      });" />
    <Items>
        <ext:Toolbar runat="server" Docked="Top" Scrollable="Horizontal">
            <Items>
                <ext:Button runat="server" Text="Back" UI="Back" />
                <ext:Button runat="server" Text="Default" BadgeText="2" />
                <ext:Button runat="server" Text="Round" UI="Round" />
                <ext:ToolbarSpacer runat="server" />
                <ext:SegmentedButton runat="server" AllowDepress="true">
                    <Items>
                        <ext:Button runat="server" Text="Option 1" Pressed="true" />
                        <ext:Button runat="server" Text="Option 2" />
                        <ext:Button runat="server" Text="Option 3" />
                    </Items>
                </ext:SegmentedButton>
                <ext:ToolbarSpacer runat="server" />
                <ext:Button runat="server" Text="Action" UI="Action" />
                <ext:Button runat="server" Text="Forward" UI="Forward" />
            </Items>
        </ext:Toolbar>
    </Items>
</ext:Panel>
