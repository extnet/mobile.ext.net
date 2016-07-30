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
                                    left: [0, 1],
                                    bottom: [0, 1]
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

        <ext:CartesianChart runat="server" InnerPadding="30">
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.Bubble.GetData() %>" AutoDataBind="true">
                    <Fields>
                        <ext:ModelField Name="id" />
                        <ext:ModelField Name="g0" />
                        <ext:ModelField Name="g1" />
                        <ext:ModelField Name="g2" />
                        <ext:ModelField Name="g3" />
                    </Fields>
                    <ServerProxy>
                        <ext:AjaxProxy Url="Data/Bubble.ashx" />
                    </ServerProxy>
                </ext:Store>
            </Store>
            <Background Fill="white" />
            <Interactions>
                <ext:PanZoomInteraction />
                <ext:ItemHighlightInteraction />
            </Interactions>
            <Series>
                <ext:ScatterSeries XField="id" YField="g2">
                    <HighlightDefaults>
                        <ext:Sprite Scaling="1.5" LineWidth="4" FillStyle="gold" FillOpacity="1" />
                    </HighlightDefaults>
                    <Marker>
                        <ext:CircleSprite Radius="5" StrokeStyle="gray" LineWidth="2">
                            <CustomConfig>
                                <ext:ConfigItem Name="fx" Value="{ duration: 200 }" Mode="Raw" />
                            </CustomConfig>
                        </ext:CircleSprite>
                    </Marker>
                    <Renderer Fn="function(sprite, config, rendererData, index) {
                                    var interpolate = function(lambda, minSrc, maxSrc, minDst, maxDst) {
                                        return minDst + (maxDst - minDst) * Math.max(0, Math.min(1, (lambda - minSrc) / (maxSrc - minSrc)));
                                    }

                                    var fromHSL = Ext.draw.Color.fly('blue').getHSL(),
                                        toHSL = Ext.draw.Color.fly('red').getHSL();

                                    fromHSL[2] = 0.5;

                                    var interpolateColor = function(lambda, minSrc, maxSrc) {
                                        return Ext.draw.Color.fly(0, 0, 0, 0).setHSL(
                                            interpolate(lambda, minSrc, maxSrc, fromHSL[0], toHSL[0]),
                                            interpolate(lambda, minSrc, maxSrc, fromHSL[1], toHSL[1]),
                                            interpolate(lambda, minSrc, maxSrc, fromHSL[2], toHSL[2])
                                        ).toString();
                                    }

                                    var store = rendererData.store,
                                        storeItem = store.getData().items[index];
                                    config.radius = interpolate(storeItem.data.g3, 0, 1000, 5, 30);
                                    config.fillOpacity = interpolate(storeItem.data.g3, 0, 1000, 1, 0.7);
                                    config.fill = interpolateColor(storeItem.data.g3, 0, 1000);
                                    config.stroke = Ext.draw.Color.fromString(config.fill).createDarker(0.15).toString();
                                }" />
                </ext:ScatterSeries>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Left" Fields="g2" Minimum="0" Maximum="1800">
                    <Style EstStepSize="20" />
                    <Label RotationDegrees="-30" />
                </ext:NumericAxis>

                <ext:CategoryAxis Position="Bottom" Fields="id" />
            </Axes>
        </ext:CartesianChart>
    </Items>
</ext:Panel>