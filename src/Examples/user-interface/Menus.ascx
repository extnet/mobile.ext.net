<%@ Control Language="C#" %>

<ext:Container runat="server" Padding="10" Scrollable="Both">
    <Bin>
        <ext:Menu runat="server" Side="Top">
            <Items>
                <ext:Button
                    runat="server"
                    Text="Settings"
                    IconCls="x-fa fa-gear"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />

                <ext:Button
                    runat="server"
                    Text="New Item"
                    IconCls="x-fa fa-pencil"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />

                <ext:Button
                    runat="server"
                    Text="Star"
                    IconCls="x-fa fa-star"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />
            </Items>
        </ext:Menu>

        <ext:Menu runat="server" Side="Bottom" Cover="false">
            <Items>
                <ext:Button
                    runat="server"
                    Text="Settings"
                    IconCls="x-fa fa-gear"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />

                <ext:Button
                    runat="server"
                    Text="New Item"
                    IconCls="x-fa fa-pencil"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />

                <ext:Button
                    runat="server"
                    Text="Star"
                    IconCls="x-fa fa-star"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />
            </Items>
        </ext:Menu>

        <ext:Menu runat="server" Side="Left" Reveal="true">
            <Items>
                <ext:Button
                    runat="server"
                    Text="Settings"
                    IconCls="x-fa fa-gear"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />

                <ext:Button
                    runat="server"
                    Text="New Item"
                    IconCls="x-fa fa-pencil"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />

                <ext:Button
                    runat="server"
                    Text="Star"
                    IconCls="x-fa fa-star"
                    Handler="Ext.Viewport.hideMenu(this.up('menu').side);" />
            </Items>
        </ext:Menu>
    </Bin>
    <Defaults>
        <ext:Parameter Name="margin" Value="10 0" />
    </Defaults>
    <Items>
        <ext:Component
            runat="server"
            StyleHtmlContent="true"
            Margin="0">
            <Content>
                <b>Ext.Menu</b> allows you to easily display sliding
                menus from any side of the screen.<br />
                <br />
                You can show the menus by either tapping the buttons below,
                or by swiping from the edge of the screen.
           
            </Content>
        </ext:Component>

        <ext:Button
            runat="server"
            Text="Toggle left menu (reveal)"
            Handler="Ext.Viewport.toggleMenu('left');" />

        <ext:Button
            runat="server"
            Text="Toggle right (links) menu"
            Handler="Ext.Viewport.toggleMenu('right');" />

        <ext:Button
            runat="server"
            Text="Toggle top menu (cover)"
            Handler="Ext.Viewport.toggleMenu('top');" />

        <ext:Button
            runat="server"
            Text="Toggle bottom menu (slide)"
            Handler="Ext.Viewport.toggleMenu('bottom');" />
    </Items>
</ext:Container>
