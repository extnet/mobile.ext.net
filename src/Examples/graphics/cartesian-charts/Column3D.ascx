<%@ Control Language="C#" %>

<ext:Panel runat="server" Layout="FitLayout">
    <Items>
        <ext:Toolbar runat="server" Docked="Top" Cls="charttoolbar">
            <Items>
                <ext:ToolbarSpacer runat="server" />

                <ext:Button
                    runat="server"
                    Text="Theme"
                    IconCls="x-fa fa-picture-o"
                    Handler="var themes = [ 'default', 'blue', 'green', 'muted', 'red', 'sky', 'yellow' ],
                                 idx = ++this.currentTheme,
                                 chart = this.up('panel').down('[isChart]');

                             if (idx === themes.length) {
                                 this.currentTheme = idx = 0;
                             }
                             
                             chart.setTheme(themes[idx]);">
                    <CustomConfig>
                        <ext:ConfigItem Name="currentTheme" Value="0" Mode="Raw" />
                    </CustomConfig>
                </ext:Button>

                <ext:Button
                    runat="server"
                    Text="Refresh"
                    IconCls="x-fa fa-refresh"
                    Handler="var chart = this.up('panel').down('[isChart]');
                             chart.getStore().reload();" />

                <ext:Button
                    runat="server"
                    Text="Reset"
                    Handler="var range = {
                                    bottom: [0, 0.2]
                                },
                                chart = this.up('panel').down('[isChart]'),
                                legend = chart.getLegend(),
                                axes;

                            if (range) {
                                axes = chart.getAxes();
                                axes.forEach(function(axis) {
                                    var pos = axis.getPosition();
                                    if (range[pos]) {
                                        axis.setVisibleRange(range[pos]);
                                    }
                                });
                            }

                            if (legend) {
                                chart.resetLegendStore();
                            } else {
                                chart.redraw();
                            }" />
            </Items>
        </ext:Toolbar>

        <ext:CartesianChart runat="server" Theme="Muted">
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.OrderItems.GetData() %>" AutoDataBind="true">
                    <Fields>
                        <ext:ModelField Name="id" />
                        <ext:ModelField Name="g0" />
                        <ext:ModelField Name="g1" />
                        <ext:ModelField Name="g2" />
                        <ext:ModelField Name="g3" />
                        <ext:ModelField Name="g4" />
                        <ext:ModelField Name="g5" />
                        <ext:ModelField Name="g6" />
                        <ext:ModelField Name="name" />
                    </Fields>
                    <ServerProxy>
                        <ext:AjaxProxy Url="Examples/graphics/data/OrderItems.ashx" />
                    </ServerProxy>
                </ext:Store>
            </Store>
            <Interactions>
                <ext:PanZoomInteraction>
                    <Axes>
                        <LeftAxis AllowPan="false" AllowZoom="false" />
                        <BottomAxis AllowPan="true" AllowZoom="true" />
                    </Axes>
                </ext:PanZoomInteraction>
            </Interactions>
            <Series>
                <ext:Bar3DSeries XField="name" YField="g1,g2,g3" Stacked="true" />
            </Series>
            <Axes>
                <ext:Numeric3DAxis Position="Left" Fields="g1,g2,g3" Grid="true">
                    <Label RotationDegrees="-30" />
                </ext:Numeric3DAxis>

                <ext:Category3DAxis Position="Bottom" Fields="name" VisibleRange="0,0.2" />
            </Axes>
        </ext:CartesianChart>
    </Items>
    <Listeners>
        <Initialize Handler="var toolbar = Ext.ComponentQuery.query('toolbar', this)[0],
                                 interaction = Ext.ComponentQuery.query('interaction', this)[0];
                             if (toolbar && interaction && !interaction.isMultiTouch()) {
                                 toolbar.add(interaction.getModeToggleButton());
                             }" />
    </Listeners>
</ext:Panel>
