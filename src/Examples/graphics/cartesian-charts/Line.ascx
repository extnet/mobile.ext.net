<%@ Control Language="C#" %>

<%@ Implements Interface="Ext.Net.Mobile.IDynamicUserControl" %>

<script runat="server">
    public void BeforeRender()
    {
        this.LineChart.GetStore().JsonData = System.IO.File.ReadAllText(Server.MapPath("resources\\usd2eur.json"));
    }
</script>

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
            </Items>
        </ext:Toolbar>

        <ext:CartesianChart ID="LineChart" runat="server">
            <Store>
                <ext:Store runat="server">
                    <Fields>
                        <ext:ModelField Name="time" Type="Date" DateFormat="time" />
                        <ext:ModelField Name="value" />
                    </Fields>
                </ext:Store>
            </Store>
            <Background Fill="white" />
            <Interactions>
                <ext:CrossZoomInteraction />
            </Interactions>
            <Series>
                <ext:LineSeries XField="time" YField="value" Fill="true">
                    <StyleSpec>
                        <ext:SeriesSprite
                            FillOpacity="0.4"
                            MiterLimit="3"
                            LineCap="Miter"
                            LineWidth="2" />
                    </StyleSpec>
                </ext:LineSeries>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Left" Fields="value">
                    <TitleConfig Text="USD to Euro" FontSize="20" />
                </ext:NumericAxis>

                <ext:TimeAxis
                    DateFormat="yyyy-MM-dd"
                    VisibleRange="0,1"
                    Position="Bottom"
                    Fields="time">
                    <TitleConfig Text="Date" FontSize="20" />
                </ext:TimeAxis>
            </Axes>
        </ext:CartesianChart>
    </Items>
    <Listeners>
        <Initialize Handler="var toolbar = Ext.ComponentQuery.query('toolbar', this)[0],
                                 interaction = Ext.ComponentQuery.query('interaction', this)[0];
                             if (toolbar && interaction) {
                                toolbar.add(interaction.getUndoButton());
                             }" />
    </Listeners>
</ext:Panel>
