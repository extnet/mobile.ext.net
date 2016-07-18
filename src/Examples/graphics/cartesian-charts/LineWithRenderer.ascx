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
            <Series>
                <ext:LineSeries XField="name" YField="g1">
                    <StyleSpec>
                        <ext:SeriesSprite StrokeStyle="powderblue" FillStyle="aliceblue" LineWidth="4" />
                    </StyleSpec>
                    <Marker>
                        <ext:CircleSprite FillStyle="yellow" Radius="10" />
                    </Marker>
                    <Renderer Fn="function(sprite, config, rendererData, index) {
                                            var store = rendererData.store,
                                                storeItems = store.getData().items,
                                                currentRecord = storeItems[index],
                                                previousRecord = (index &gt; 0 ? storeItems[index - 1] : currentRecord),
                                                current = currentRecord && currentRecord.data['g1'],
                                                previous = previousRecord && previousRecord.data['g1'],
                                                changes = {};

                                            switch (config.type) {
                                                case 'marker':
                                                    if (index == 0) {
                                                        return null; // keep the default style for the first marker
                                                    }
                                                    changes.strokeStyle = (current &gt;= previous ? 'green' : 'red');
                                                    changes.fillStyle = (current &gt;= previous ? 'palegreen' : 'lightpink');
                                                    changes.lineWidth = 2;
                                                    break;
                                                case 'line':
                                                    changes.strokeStyle = (current &gt;= previous ? 'green' : 'red');
                                                    changes.fillStyle = (current &gt;= previous ? 'palegreen' : 'tomato');
                                                    changes.fillOpacity = .1;
                                                    break;
                                            }
                                            return changes;
                                        }" />
                </ext:LineSeries>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Left" Fields="g1" Minimum="0" />
                <ext:CategoryAxis Position="Bottom" Fields="name" />
            </Axes>
        </ext:CartesianChart>
    </Items>
</ext:Panel>
