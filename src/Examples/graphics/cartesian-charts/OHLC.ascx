<%@ Control Language="C#" %>

<ext:Panel runat="server" Layout="FitLayout">
    <Items>
        <ext:Toolbar runat="server" Docked="Top" Cls="charttoolbar">
            <Items>
                <ext:ToolbarSpacer runat="server" />

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
                                    bottom: [0, 0.3]
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

                <ext:SegmentedButton runat="server" MarginSpec="0 5 0 0">
                    <Items>
                        <ext:Button
                            runat="server"
                            Text="Crosshair"
                            Pressed="true"
                            Handler="var interactions = Ext.ComponentQuery.query('interaction', this.up('panel').down('[isChart]')),
                                        panzoom = interactions[0],
                                        crosshair = interactions[1];

                                     crosshair.setEnabled(true);
                                     panzoom.setEnabled(false);" />

                        <ext:Button
                            runat="server"
                            Text="Pan/Zoom"
                            Handler="var interactions = Ext.ComponentQuery.query('interaction', this.up('panel').down('[isChart]')),
                                        panzoom = interactions[0],
                                        crosshair = interactions[1];

                                     crosshair.setEnabled(false);
                                     panzoom.setEnabled(true);" />
                    </Items>
                </ext:SegmentedButton>
            </Items>
        </ext:Toolbar>

        <ext:CartesianChart runat="server">
            <Store>
                <ext:Store
                    runat="server"
                    Data="<%# Ext.Net.Mobile.Examples.StockPrice.GetData(HttpContext.Current) %>"
                    AutoDataBind="true">
                    <Fields>
                        <ext:ModelField Name="Time" Type="Date" />
                        <ext:ModelField Name="Open" Type="Float" />
                        <ext:ModelField Name="High" Type="Float" />
                        <ext:ModelField Name="Low" Type="Float" />
                        <ext:ModelField Name="Close" Type="Float" />
                    </Fields>
                    <ServerProxy>
                        <ext:AjaxProxy Url="Examples/graphics/data/StockPrice.ashx" />
                    </ServerProxy>
                </ext:Store>
            </Store>
            <Interactions>
                <ext:PanZoomInteraction Enabled="false" ZoomOnPanGesture="false">
                    <Axes>
                        <LeftAxis AllowPan="false" AllowZoom="false" />
                        <BottomAxis AllowPan="true" AllowZoom="true" />
                    </Axes>
                </ext:PanZoomInteraction>
                <ext:CrosshairInteraction>
                    <Axes>
                        <Label FillStyle="white" />
                        <Rect FillStyle="#344459" Opacity="0.7" Radius="5" />
                    </Axes>
                </ext:CrosshairInteraction>
            </Interactions>
            <Series>
                <ext:CandleStick
                    XField="Time"
                    OpenField="Open"
                    HighField="High"
                    LowField="Low"
                    CloseField="Close">
                    <StyleSpec>
                        <ext:SeriesSprite OhlcType="ohlc" BarWidth="10" Opacity="0.9">
                            <DropStyle FillStyle="rgb(237,123,43)" StrokeStyle="rgb(237,123,43)" />
                            <RaiseStyle FillStyle="rgb(55,153,19)" StrokeStyle="rgb(55,153,19)" />
                        </ext:SeriesSprite>
                    </StyleSpec>
                </ext:CandleStick>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Left" Fields="Open,High,Low,Close" Minimum="0" Maximum="1000" />

                <ext:TimeAxis Position="Bottom" Fields="Time" VisibleRange="0,0.3">
                    <Style AxisLine="false" />
                </ext:TimeAxis>
            </Axes>
        </ext:CartesianChart>
    </Items>
    <Listeners>
        <Initialize Handler="var toolbar = Ext.ComponentQuery.query('toolbar', this)[0],
                                panzoom = Ext.ComponentQuery.query('interaction', this)[0];

                            if (toolbar && panzoom && !panzoom.isMultiTouch()) {
                                toolbar.add(panzoom.getModeToggleButton());
                            }" />
    </Listeners>
    <CustomConfig>
        <ext:ConfigItem Name="otherContent">
            <ext:Parameter Name="type" Value="StockPrice.ashx.cs" Mode="Value" />
            <ext:Parameter Name="path" Value="Examples/graphics/data/StockPrice.ashx.cs" Mode="Value" />
        </ext:ConfigItem>
    </CustomConfig>
</ext:Panel>
