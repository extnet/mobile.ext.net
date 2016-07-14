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
                                    left: [0, 1]
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

        <ext:CartesianChart runat="server" FlipXY="true">
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.Pie.GetData(15) %>" AutoDataBind="true">
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
                        <ext:AjaxProxy Url="Examples/graphics/data/Pie.ashx">
                            <ExtraParams>
                                <ext:Parameter Name="n" Value="15" Mode="Raw" />
                            </ExtraParams>
                        </ext:AjaxProxy>
                    </ServerProxy>
                </ext:Store>
            </Store>
            <Background Fill="white" />
            <Interactions>
                <ext:PanZoomInteraction />
                <ext:ItemHighlightInteraction />
            </Interactions>
            <Series>
                <ext:BarSeries XField="name" YField="g1,g2,g3,g4,g5,g6">
                    <StyleSpec>
                        <ext:SeriesSprite
                            LineWidth="2"
                            MaxBarWidth="30"
                            StrokeStyle="rgb(40,40,40)" />
                    </StyleSpec>
                    <HighlightDefaults>
                        <ext:Sprite StrokeStyle="red" LineWidth="3" />
                    </HighlightDefaults>
                </ext:BarSeries>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Left" Fields="g1,g2,g3,g4,g5,g6" MaxZoom="1">
                    <GridConfig>
                        <Even LineWidth="1" />
                        <Odd StrokeStyle="#fff" />
                    </GridConfig>
                    <Label RotationDegrees="-90" />
                </ext:NumericAxis>

                <ext:CategoryAxis Position="Left" Fields="name" MaxZoom="4" />
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
    <CustomConfig>
        <ext:ConfigItem Name="otherContent">
            <ext:Parameter Name="type" Value="Pie.ashx.cs" Mode="Value" />
            <ext:Parameter Name="path" Value="Examples/graphics/data/Pie.ashx.cs" Mode="Value" />
        </ext:ConfigItem>
    </CustomConfig>
</ext:Panel>
