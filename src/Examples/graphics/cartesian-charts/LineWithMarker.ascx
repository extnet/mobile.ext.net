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
                                    left: [0, 1],
                                    bottom: [0, 0.5]
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

        <ext:CartesianChart runat="server">
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.Pie.GetData() %>" AutoDataBind="true">
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
                        <ext:AjaxProxy Url="Data/Pie.ashx" />
                    </ServerProxy>
                </ext:Store>
            </Store>
            <Background Fill="white" />
            <Interactions>
                <ext:PanZoomInteraction ZoomOnPanGesture="false" />
                <ext:ItemHighlightInteraction />
            </Interactions>
            <LegendConfig runat="server" Docked="Bottom" />
            <Series>
                <ext:LineSeries
                    XField="name"
                    YField="g1"
                    Fill="true"
                    Title="Square">
                    <StyleSpec>
                        <ext:SeriesSprite
                            MiterLimit="3"
                            LineCap="Miter"
                            Opacity="0.7"
                            LineWidth="8"
                            Smooth="true" />
                    </StyleSpec>
                    <HighlightDefaults>
                        <ext:Sprite Scaling="0.9" />
                    </HighlightDefaults>
                    <Marker>
                        <ext:ImageSprite
                            Src="../resources/images/glyphicons_094_vector_path_square.png"
                            Width="46"
                            Height="46"
                            X="-23"
                            Y="-23"
                            Scaling="0.7">
                            <CustomConfig>
                                <ext:ConfigItem Name="fx" Value="{ duration: 200 }" Mode="Raw" />
                            </CustomConfig>
                        </ext:ImageSprite>
                    </Marker>
                </ext:LineSeries>

                <ext:LineSeries
                    XField="name"
                    YField="g2"
                    Title="Circle">
                    <StyleSpec>
                        <ext:SeriesSprite Opacity="0.7" LineWidth="8" />
                    </StyleSpec>
                    <HighlightDefaults>
                        <ext:Sprite Scaling="0.9" />
                    </HighlightDefaults>
                    <Marker>
                        <ext:ImageSprite
                            Src="../resources/images/glyphicons_095_vector_path_circle.png"
                            Width="46"
                            Height="46"
                            X="-23"
                            Y="-23"
                            Scaling="0.7">
                            <CustomConfig>
                                <ext:ConfigItem Name="fx" Value="{ duration: 200 }" Mode="Raw" />
                            </CustomConfig>
                        </ext:ImageSprite>
                    </Marker>
                </ext:LineSeries>

                <ext:LineSeries
                    XField="name"
                    YField="g3"
                    Title="Polygon">
                    <StyleSpec>
                        <ext:SeriesSprite Opacity="0.7" LineWidth="8" />
                    </StyleSpec>
                    <HighlightDefaults>
                        <ext:Sprite Scaling="0.9" />
                    </HighlightDefaults>
                    <Marker>
                        <ext:ImageSprite
                            Src="../resources/images/glyphicons_096_vector_path_polygon.png"
                            Width="48"
                            Height="48"
                            X="-24"
                            Y="-24"
                            Scaling="0.7">
                            <CustomConfig>
                                <ext:ConfigItem Name="fx" Value="{ duration: 200 }" Mode="Raw" />
                            </CustomConfig>
                        </ext:ImageSprite>
                    </Marker>
                </ext:LineSeries>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Left" Fields="g1,g2,g3" Minimum="0" />
                <ext:CategoryAxis Position="Bottom" VisibleRange="0,0.5" Fields="name" />
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
