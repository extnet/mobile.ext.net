<%@ Control Language="C#" %>

<ext:Container runat="server" Layout="FitLayout">
    <ResourceItems>
        <ext:ClientResourceItem Path="~/resources/js/examples/columnchart.js" />
    </ResourceItems>
    <Items>
        <ext:Toolbar
            runat="server"
            Top="0"
            Right="0"
            ZIndex="50"
            Border="false"
            Cls="charttoolbar">
            <CustomConfig>
                <ext:ConfigItem Name="style" Value="background: 'none'" Mode="Value" />
            </CustomConfig>
            <Items>
                <ext:ToolbarSpacer runat="server" />

                <ext:Button runat="server" Text="Preview" IconCls="x-fa fa-eye" Handler="App.ColumnChart.onDownload" />

                <ext:Button runat="server" Text="Reload" IconCls="x-fa fa-refresh" Handler="App.ColumnChart.chart.getStore().reload();" />
            </Items>
        </ext:Toolbar>

        <ext:CartesianChart
            runat="server"
            Animation="true"
            InsetPaddingSpec="50 10 10 0">
            <PreInit Handler="App.ColumnChart.chart = this;" />
            <Store>
                <ext:Store runat="server" Data="<%# Ext.Net.Mobile.Examples.Climate.GetData() %>" AutoDataBind="true">
                    <Fields>
                        <ext:ModelField Name="month" />
                        <ext:ModelField Name="high" />
                        <ext:ModelField Name="low" />
                        <ext:ModelField Name="highF">
                            <Calculate Handler="return data.high * 1.8 + 32;" />
                        </ext:ModelField>
                        <ext:ModelField Name="lowF">
                            <Calculate Handler="return data.low * 1.8 + 32;" />
                        </ext:ModelField>
                    </Fields>
                    <ServerProxy>
                        <ext:AjaxProxy Url="Data/Climate.ashx" />
                    </ServerProxy>
                </ext:Store>
            </Store>
            <Interactions>
                <ext:PanZoomInteraction>
                    <Axes>
                        <LeftAxis AllowPan="false" AllowZoom="false" />
                        <RightAxis AllowPan="true" AllowZoom="true" />
                    </Axes>
                </ext:PanZoomInteraction>
            </Interactions>
            <Axes>
                <ext:NumericAxis
                    Position="Left"
                    Minimum="30"
                    TitleMargin="20"
                    Title="Temperature in °F">
                    <Listeners>
                        <RangeChange Fn="App.ColumnChart.onAxisRangeChange" />
                    </Listeners>
                </ext:NumericAxis>
                <ext:CategoryAxis Position="Bottom" VisibleRange="0, 0.5" />
            </Axes>
            <Series>
                <ext:BarSeries XField="month" YField="highF">
                    <StyleSpec>
                        <ext:SeriesSprite MinGapWidth="15" />
                    </StyleSpec>
                    <HighlightDefaults>
                        <ext:Sprite StrokeStyle="black" FillStyle="gold" />
                    </HighlightDefaults>
                    <Label Field="highF" Display="InsideEnd">
                        <Renderer Handler="return text.toFixed(1);" />
                    </Label>
                </ext:BarSeries>
            </Series>
            <Items>
                <ext:TextSprite
                    Text="Redwood City Climate Data"
                    FontSize="18"
                    Width="100"
                    Height="300"
                    X="30"
                    Y="30" />
            </Items>
            <Listeners>
                <Initialize Fn="App.ColumnChart.onInitialize" />
                <AfterRender Fn="App.ColumnChart.onAfterRender" />
            </Listeners>
        </ext:CartesianChart>
    </Items>
</ext:Container>