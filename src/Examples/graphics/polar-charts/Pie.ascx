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
                                    n: 5
                                }
                             });" />

                <ext:Button
                    runat="server"
                    Text="Reset"
                    Handler="var chart = this.up('panel').down('[isChart]');
                             Ext.ComponentQuery.query('series', chart)[0].setRotation(0);
                             chart.resetLegendStore();" />
            </Items>
        </ext:Toolbar>

        <ext:PolarChart runat="server" InnerPadding="10">
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.Pie.GetData(5) %>" AutoDataBind="true">
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
                        <ext:AjaxProxy Url="Data/Pie.ashx">
                            <ExtraParams>
                                <ext:Parameter Name="n" Value="5" Mode="Raw" />
                            </ExtraParams>
                        </ext:AjaxProxy>
                    </ServerProxy>
                </ext:Store>
            </Store>
            <Interactions>
                <ext:RotateInteraction />
                <ext:ItemHighlightInteraction />
            </Interactions>
            <LegendConfig runat="server" Height="70" Docked="Right" />
            <Series>
                <ext:PieSeries AngleField="g1" Donut="30">
                    <Label Field="name" />
                    <HighlightDefaults>
                        <ext:Sprite Margin="20" />
                    </HighlightDefaults>
                    <StyleSpec>
                        <ext:SeriesSprite
                            StrokeStyle="white"
                            MiterLimit="10"
                            LineCap="Miter"
                            LineWidth="2" />
                    </StyleSpec>
                </ext:PieSeries>
            </Series>
        </ext:PolarChart>
    </Items>
</ext:Panel>