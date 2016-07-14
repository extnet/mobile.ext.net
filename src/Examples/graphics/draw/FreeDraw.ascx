<%@ Control Language="C#" %>

<%@ Implements Interface="Ext.Net.Mobile.IDynamicUserControl" %>

<script runat="server">
    public void BeforeRender()
    {
        var panel = Ext.Net.Utilities.ControlUtils.FindChildControl<Ext.Net.Mobile.Panel>(this);

        panel.Items.Add(new GenericComponent<DrawContainer>
        {
            GenericXType = "freedrawcomponent",
        });
    }
</script>

<ext:Panel runat="server" Layout="FitLayout" Cls="card1">
    <ResourceItems>
        <ext:ClientResourceItem Path="resources/js/examples/freedrawcomponent.js" />
    </ResourceItems>
    <Items>
        <ext:Toolbar
            runat="server"
            Top="0"
            Right="0"
            ZIndex="50"
            Border="false">
            <CustomConfig>
                <ext:ConfigItem Name="style" Value="{ background: 'none' }" Mode="Raw" />
            </CustomConfig>
            <Items>
                <ext:ToolbarSpacer runat="server" />

                <ext:Button
                    runat="server"
                    Text="Clear"
                    Handler="var draw = this.up('panel').down('freedrawcomponent');
                             draw.getSurface().destroy();
                             draw.getSurface('overlay').destroy();
                             draw.renderFrame();" />
            </Items>
        </ext:Toolbar>
    </Items>
    <CustomConfig>
        <ext:ConfigItem Name="otherContent">
            <ext:Parameter Name="type" Value="JavaScript" Mode="Value" />
            <ext:Parameter Name="path" Value="resources/js/examples/freedrawcomponent.js" Mode="Value" />
        </ext:ConfigItem>
    </CustomConfig>
</ext:Panel>
