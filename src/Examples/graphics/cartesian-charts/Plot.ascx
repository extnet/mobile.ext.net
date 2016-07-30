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
                    Handler="var store = this.up('panel').down('[isChart]').getStore();
                             store.reload({
                                 params: {
                                    fnIndex: store.fnIndex++
                                 }
                             });" />

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

        <ext:CartesianChart runat="server" Theme="Sky">
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.Plot.GetData() %>" AutoDataBind="true">
                    <Fields>
                        <ext:ModelField Name="x" />
                        <ext:ModelField Name="y" />
                    </Fields>
                    <ServerProxy>
                        <ext:AjaxProxy Url="Data/Plot.ashx" />
                    </ServerProxy>
                    <CustomConfig>
                        <ext:ConfigItem Name="fnIndex" Value="1" Mode="Raw" />
                    </CustomConfig>
                </ext:Store>
            </Store>
            <Background Fill="white" />
            <Interactions>
                <ext:PanZoomInteraction />
            </Interactions>
            <Series>
                <ext:LineSeries XField="x" YField="y">
                    <StyleSpec>
                        <ext:SeriesSprite StrokeStyle="rgb(0, 119, 204)" LineWidth="2" />
                    </StyleSpec>
                </ext:LineSeries>
            </Series>
            <Axes>
                <ext:NumericAxis
                    Position="Left"
                    Fields="y"
                    TitleMargin="20"
                    Minimum="-4"
                    Maximum="4"
                    Grid="true">
                    <TitleConfig Text="f(x)" FontSize="16" FillStyle="rgb(255, 0, 136)" />
                    <FloatingConfig ValueInt="0" AlongAxisIndex="1" />
                </ext:NumericAxis>

                <ext:NumericAxis
                    Position="Bottom"
                    Fields="x"
                    TitleMargin="6"
                    Grid="true">
                    <TitleConfig Text="x" FontSize="16" FillStyle="rgb(255, 0, 136)" />
                    <FloatingConfig ValueInt="0" AlongAxisIndex="0" />
                </ext:NumericAxis>
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