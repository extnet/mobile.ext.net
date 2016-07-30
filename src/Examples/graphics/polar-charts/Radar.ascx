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
                             chart.getStore().reload({
                                 params: {
                                    n: 10 + Math.round(10 * Math.random())
                                 }
                             });" />
            </Items>
        </ext:Toolbar>
        <ext:PolarChart runat="server" InsetPaddingSpec="15 35 0 10">
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.OrderItems.GetData(15) %>" AutoDataBind="true">
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
            <Interactions>
                <ext:RotateInteraction />
            </Interactions>
            <Background Fill="white" />
            <LegendConfig runat="server" Docked="Bottom" />
            <Series>
                <ext:RadarSeries Title="G1" AngleField="id" RadiusField="g1">
                    <StyleSpec>
                        <ext:SeriesSprite LineWidth="4" FillOpacity="0.3" />
                    </StyleSpec>
                </ext:RadarSeries>

                <ext:RadarSeries Title="G2" AngleField="id" RadiusField="g2">
                    <StyleSpec>
                        <ext:SeriesSprite LineWidth="4" FillOpacity="0.3" />
                    </StyleSpec>
                </ext:RadarSeries>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Radial" Fields="g1,g2" Grid="true">
                    <Label FillStyle="black" />
                    <Style EstStepSize="20" />
                    <Limits>
                        <ext:AxisLimit Value="50">
                            <Line StrokeStyle="red" LineDash="6,3">
                                <Title Text="Limit #1" />
                            </Line>
                        </ext:AxisLimit>
                    </Limits>
                </ext:NumericAxis>

                <ext:CategoryAxis Position="Angular" Margin="20" Fields="id" Grid="true">
                    <Style EstStepSize="2" />
                    <Label FillStyle="black" />
                    <Limits>
                        <ext:AxisLimit Value="12">
                            <Line StrokeStyle="green" LineWidth="3" LineDash="6,3">
                                <Title Text="Limit #2" FontSize="14" />
                            </Line>
                        </ext:AxisLimit>
                        <ext:AxisLimit Value="7">
                            <Line StrokeStyle="green" LineWidth="3" />
                        </ext:AxisLimit>
                    </Limits>
                </ext:CategoryAxis>
            </Axes>
        </ext:PolarChart>
    </Items>
</ext:Panel>