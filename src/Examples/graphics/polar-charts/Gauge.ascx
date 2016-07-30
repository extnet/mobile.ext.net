<%@ Control Language="C#" %>

<ext:Panel runat="server" Layout="FitLayout">
    <Bin>
        <ext:Store ID="GaugeStore" runat="server" Data="<%# Ext.Net.Mobile.Examples.Pie.GetData(1) %>" AutoDataBind="true">
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
    </Bin>
    <Items>
        <ext:Toolbar runat="server" Docked="Top" Cls="charttoolbar">
            <Items>
                <ext:ToolbarSpacer runat="server" />

                <ext:Button
                    runat="server"
                    Text="Refresh"
                    IconCls="x-fa fa-refresh"
                    Handler="var store = this.up('panel').getBinComponent(0);
                             store.reload({
                                params: {
                                    n: 1
                                }
                             });" />
            </Items>
        </ext:Toolbar>

        <ext:Container runat="server" Layout="VBoxLayout">
            <Items>
                <ext:Container runat="server" Layout="HBoxLayout" Flex="1">
                    <Items>
                        <ext:PolarChart runat="server" InsetPadding="20" Flex="1" StoreID="GaugeStore">
                            <AnimationConfig Easing="ElasticIn" Duration="1000" />
                            <Series>
                                <ext:GaugeSeries
                                    AngleField="g1"
                                    Minimum="0"
                                    Maximum="100"
                                    Donut="30"
                                    Colors="#115fa6,lightgrey" />
                            </Series>
                        </ext:PolarChart>
                    </Items>
                </ext:Container>
                <ext:Container runat="server" Layout="HBoxLayout" Flex="1">
                    <Items>
                        <ext:PolarChart runat="server" Flex="1" InnerPadding="20" StoreID="GaugeStore">
                            <Series>
                                <ext:GaugeSeries
                                    AngleField="g1"
                                    Donut="30"
                                    Value="60"
                                    Minimum="0"
                                    Maximum="100"
                                    Needle="true"
                                    NeedleLength="95"
                                    NeedleWidth="8"
                                    TotalAngleDegrees="180"
                                    Colors="maroon, blue, lightgray, red">
                                    <Label FontSize="12" FontWeight="bold" />
                                    <SectorsConfig>
                                        <ext:GaugeSector End="30" Label="Cold" Color="dodgerblue" />
                                        <ext:GaugeSector End="30">
                                            <CustomConfig>
                                                <ext:ConfigItem Name="style">
                                                    <ext:Parameter Name="strokeStyle" Value="black" Mode="Value" />
                                                    <ext:Parameter Name="strokeOpacity" Value="1" Mode="Raw" />
                                                    <ext:Parameter Name="lineWidth" Value="4" Mode="Raw" />
                                                </ext:ConfigItem>
                                            </CustomConfig>
                                        </ext:GaugeSector>
                                        <ext:GaugeSector End="70" Label="Temp." Color="lightgray" />
                                        <ext:GaugeSector End="70">
                                            <CustomConfig>
                                                <ext:ConfigItem Name="style">
                                                    <ext:Parameter Name="strokeStyle" Value="black" Mode="Value" />
                                                    <ext:Parameter Name="strokeOpacity" Value="1" Mode="Raw" />
                                                    <ext:Parameter Name="lineWidth" Value="4" Mode="Raw" />
                                                </ext:ConfigItem>
                                            </CustomConfig>
                                        </ext:GaugeSector>
                                        <ext:GaugeSector End="100" Label="Hot" Color="tomato" />
                                        <ext:GaugeSector End="100">
                                            <CustomConfig>
                                                <ext:ConfigItem Name="style">
                                                    <ext:Parameter Name="strokeStyle" Value="gray" Mode="Value" />
                                                    <ext:Parameter Name="strokeOpacity" Value="1" Mode="Raw" />
                                                    <ext:Parameter Name="lineWidth" Value="4" Mode="Raw" />
                                                    <ext:Parameter Name="fillOpacity" Value="0" Mode="Raw" />
                                                </ext:ConfigItem>
                                            </CustomConfig>
                                        </ext:GaugeSector>
                                    </SectorsConfig>
                                    <Renderer Fn="function(sprite, config, rendererData, spriteIndex) {
                                                            var surface = sprite.getParent(),
                                                                chart = rendererData.series.getChart(),
                                                                mainRect = chart.getMainRect(),
                                                                width = mainRect[2],
                                                                height = mainRect[3],
                                                                bigChart = (width &gt;= 250 && height &gt;= 150),
                                                                changes, fontSize;
                                                            // This renderer function draws the 'Temp.' label in big white letters,
                                                            // the 'Cold' label in blue, and the 'Hot' label in red.
                                                            if (config.type == 'label') {
                                                                changes = {
                                                                    x: config.x + 10,
                                                                    y: config.y + 10
                                                                };
                                                                if (spriteIndex == 3) {
                                                                    Ext.apply(changes, {
                                                                        fontSize: (bigChart ? 32 : 16),
                                                                        strokeStyle: 'black'
                                                                    });
                                                                } else {
                                                                    Ext.apply(changes, {
                                                                        fontSize: (bigChart ? 24 : 12)
                                                                    });
                                                                }
                                                                switch (spriteIndex) {
                                                                    case 1:
                                                                        Ext.apply(changes, {
                                                                            color: 'blue'
                                                                        });
                                                                        break;
                                                                    case 3:
                                                                        Ext.apply(changes, {
                                                                            color: 'white'
                                                                        });
                                                                        break;
                                                                    case 5:
                                                                        Ext.apply(changes, {
                                                                            color: 'darkred'
                                                                        });
                                                                        break;
                                                                }
                                                                return changes;
                                                            }
                                                        }" />
                                </ext:GaugeSeries>
                            </Series>
                        </ext:PolarChart>
                    </Items>
                </ext:Container>
            </Items>
        </ext:Container>
    </Items>
</ext:Panel>