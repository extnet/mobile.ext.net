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
                                    n: 9
                                }
                             });" />
            </Items>
        </ext:Toolbar>

        <ext:PolarChart runat="server" InnerPadding="20" Theme="Muted">
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.Pie.GetData(9) %>" AutoDataBind="true">
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
                                <ext:Parameter Name="n" Value="5" Mode="Raw" />
                            </ExtraParams>
                        </ext:AjaxProxy>
                    </ServerProxy>
                </ext:Store>
            </Store>
            <Background Fill="white" />
            <Interactions>
                <ext:RotatePie3DInteraction />
            </Interactions>
            <AnimationConfig Duration="500" Easing="EaseIn" />
            <Series>
                <ext:Pie3DSeries AngleField="g1" Donut="30" Distortion="0.6">
                    <HighlightConfig>
                        <ext:Sprite Margin="40" />
                    </HighlightConfig>
                    <Label Field="name">
                        <CustomConfig>
                            <ext:ConfigItem Name="calloutColor" Value="rgba(0,0,0,0)" Mode="Value" />
                        </CustomConfig>
                        <CalloutLineConfig Length="1" />
                    </Label>
                    <StyleSpec>
                        <ext:SeriesSprite Thickness="40" StrokeStyle="none" />
                    </StyleSpec>
                </ext:Pie3DSeries>
            </Series>
        </ext:PolarChart>
    </Items>
</ext:Panel>
