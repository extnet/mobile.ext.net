<%@ Control Language="C#" %>

<script type="text/javascript">
    <%--
     The example is based in extending the Ext.Container component so the
     custom behavior of updateHidden and getMenuCfg are overridden in the
     process.
    --%>
    Ext.define('Ext.Container', {
        override: 'Ext.Container',
        updateHiddenHandler: function(hidden) {
            this.callParent(arguments);

            if (hidden) {
                Ext.Viewport.removeMenu('left');
                Ext.Viewport.removeMenu('right');
                Ext.Viewport.removeMenu('bottom');
                Ext.Viewport.removeMenu('top');
            } else {
                Ext.Viewport.setMenu(this.getMenuCfg('top'), {
                    side: 'top'
                });

                Ext.Viewport.setMenu(this.getMenuCfg('bottom'), {
                    side: 'bottom',
                    cover: false
                });

                Ext.Viewport.setMenu(this.getMenuCfg('left'), {
                    side: 'left',
                    reveal: true
                });

                Ext.Viewport.setMenu(this.getMenuCfg('right'), {
                    side: 'right',
                    reveal: true
                });
            }
        },
        getMenuCfgHandler: function (side) {
            return {
                items: [{
                    text: 'Settings',
                    iconCls: 'x-fa fa-gear',
                    scope: this,
                    handler: function () {
                        Ext.Viewport.hideMenu(side);
                    }
                }, {
                    text: 'New Item',
                    iconCls: 'x-fa fa-pencil',
                    scope: this,
                    handler: function () {
                        Ext.Viewport.hideMenu(side);
                    }
                }, {
                    xtype: 'button',
                    text: 'Star',
                    iconCls: 'x-fa fa-star',
                    scope: this,
                    handler: function () {
                        Ext.Viewport.hideMenu(side);
                    }
                }]
            }
        }
    });
</script>
<ext:Container runat="server" Padding="20" Scrollable="Both">
    <Defaults>
        <ext:Parameter Name="cls" Value="demobtn" />
        <ext:Parameter Name="margin" Value="10 0" />
    </Defaults>
    <Items>
        <ext:Component runat="server"
            StyleHtmlContent="true">
            <Content>
                <b>Ext.Menu</b> is a component introduced in Sencha Touch 2.3 which allows you to easily display sliding
                menus from any side of the screen.<br /><br />You can show the menus by either tapping the buttons below,
                or by swiping from the edge of the screen.
            </Content>
        </ext:Component>
        <ext:Button runat="server"
            Text="Toggle left menu (reveal)"
            Handler="Ext.Viewport.toggleMenu('left');" />
        <ext:Button runat="server"
            Text="Toggle right menu (reveal)"
            Handler="Ext.Viewport.toggleMenu('right');" />
        <ext:Button runat="server"
            Text="Toggle top menu (cover)"
            Handler="Ext.Viewport.toggleMenu('top');" />
        <ext:Button runat="server"
            Text="Toggle bottom menu (slide)"
            Handler="Ext.Viewport.toggleMenu('bottom');" />
    </Items>
</ext:Container>
