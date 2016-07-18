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
                                    bottom: [0, 0.25]
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
        <ext:CartesianChart runat="server" InsetPaddingSpec="15 35 0 10">
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
                        <ext:AjaxProxy Url="Data/OrderItems.ashx" />
                    </ServerProxy>
                </ext:Store>
            </Store>
            <LegendConfig runat="server" Docked="Bottom" />
            <Interactions>
                <ext:PanZoomInteraction>
                    <Axes>
                        <LeftAxis AllowPan="false" AllowZoom="false" />
                        <RightAxis AllowPan="true" AllowZoom="true" />
                    </Axes>
                </ext:PanZoomInteraction>
            </Interactions>
            <Series>
                <ext:AreaSeries XField="name" YField="g1,g2,g3,g4,g5" Titles="G1,G2,G3,G4,G5">
                    <StyleSpec>
                        <ext:SeriesSprite StrokeStyle="black" LineWidth="2" FillOpacity="0.8" />
                    </StyleSpec>
                </ext:AreaSeries>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Left" Fields="g1,g2,g3,g4,g5,g6">
                    <Label RotationDegrees="-30" />
                    <GridConfig>
                        <Odd FillStyle="#e8e8e8" />
                    </GridConfig>
                    <TitleConfig Text="Summation of Data" FontSize="20" />
                </ext:NumericAxis>
                <ext:CategoryAxis Position="Bottom" Fields="name" Grid="true" VisibleRange="0,0.25">
                    <TitleConfig Text="Item Names" FontSize="20" />
                </ext:CategoryAxis>
            </Axes>
        </ext:CartesianChart>
    </Items>
</ext:Panel>
