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
                <ext:BarSeries XField="name" YField="g1">
                    <StyleSpec>
                        <ext:SeriesSprite
                            LineWidth="2"
                            MaxBarWidth="30"
                            StrokeStyle="dodgerblue"
                            FillStyle="palegreen"
                            Opacity="0.6" />
                    </StyleSpec>
                    <Renderer Fn="function(sprite, config, rendererData, index) {
                                    var store = rendererData.store,
                                        storeItems = store.getData().items,
                                        record = storeItems[index],
                                        diff = record && (record.data['g2'] - record.data['g1']),
                                        last = storeItems.length - 1,
                                        surface = sprite.getParent(),
                                        changes = {},
                                        lineSprites, firstColumnConfig, firstData, lastData, growth, string;
                                    if (!record) {
                                        return;
                                    }
                                    // This renderer function paints the back column red instead
                                    // of palegreen if series #2 is greater than series #1.
                                    changes.fillStyle = (diff &gt; 0 ? 'tomato' : 'palegreen');
                                    // Make the first and last columns larger.
                                    if (index == 0 || index == last) {
                                        changes.x = config.x - config.width * 0.4;
                                        changes.y = config.y;
                                        changes.width = config.width * 1.8;
                                        changes.lineWidth = 4;
                                        // Draw a line between the first and last columns
                                        lineSprites = surface.myLineSprites;
                                        if (!lineSprites) {
                                            lineSprites = surface.myLineSprites = [];
                                            lineSprites[0] = surface.add({
                                                type: 'path'
                                            });
                                            lineSprites[1] = surface.add({
                                                type: 'text'
                                            });
                                        }
                                        if (index == 0) {
                                            surface.myFirstColumnConfig = Ext.clone(changes);
                                        } else if (index == last) {
                                            firstData = storeItems[0].data['g1'];
                                            lastData = storeItems[last].data['g1'];

                                            firstColumnConfig = surface.myFirstColumnConfig;
                                            var x1 = firstColumnConfig.x + firstColumnConfig.width,
                                                y1 = firstColumnConfig.y,
                                                x2 = changes.x,
                                                y2 = changes.y;
                                            lineSprites[0].setAttributes({
                                                lineWidth: 1,
                                                stroke: 'blue',
                                                zIndex: 10000,
                                                opacity: 0.4,
                                                path: 'M' + x2 + ' ' + y2 + ' L' + x1 + ' ' + y1 + ' L' + x2 + ' ' + y1 + (lastData &lt; firstData ? ' L' : ' M') + x2 + ' ' + y2 + ' Z'
                                            });

                                            growth = Math.round(100 * (lastData - firstData) / (firstData || 1));
                                            string = (growth &gt; 0 ? '+ ' : '- ') + Math.abs(growth) + ' %';
                                            lineSprites[1].setAttributes({
                                                text: string,
                                                x: changes.x - 12,
                                                y: firstColumnConfig.y + (changes.y - firstColumnConfig.y) / 2 + 10,
                                                fill: '#00c',
                                                fontSize: 20,
                                                zIndex: 10000,
                                                opacity: 0.6,
                                                scalingY: -1,
                                                textAlign: 'center',
                                                rotate: -90
                                            });
                                        }
                                    } else {
                                        changes.lineWidth = 2;
                                    }
                                    return changes;
                                }" />
                </ext:BarSeries>

                <ext:BarSeries XField="name" YField="g2">
                    <StyleSpec>
                        <ext:SeriesSprite
                            LineWidth="2"
                            MaxBarWidth="12"
                            StrokeStyle="tomato"
                            FillStyle="lightyellow"
                            Radius="20" />
                    </StyleSpec>
                    <Renderer Fn="function(sprite, config, rendererData, index) {
                                    var store = rendererData.store,
                                        storeItems = store.getData().items,
                                        last = storeItems.length - 1,
                                        record = storeItems[index],
                                        diff = record && Math.round(record.data['g2'] - record.data['g1']),
                                        surface = sprite.getParent(),
                                        textSprites, textSprite, rectSprite;
                                    if (!record) {
                                        return;
                                    }
                                    // This renderer function draws a red label if series #2 is greater than series #1.
                                    // The label displays the difference between the values of series #1 and series #2.
                                    //
                                    // Note: The two renderer functions in this test case cannot be consolidated. The red labels
                                    // are rendered here because they are positioned relatively to the series #2 columns.
                                    if (diff &gt; 0) {
                                        textSprites = surface.myTextSprites;
                                        if (!textSprites) {
                                            textSprites = surface.myTextSprites = [];
                                        }
                                        textSprite = textSprites[index];
                                        if (!textSprite) {
                                            textSprite = textSprites[index] = surface.add({
                                                type: 'text'
                                            });
                                            rectSprite = textSprite.rectSprite = surface.add({
                                                type: 'rect'
                                            });
                                        } else {
                                            rectSprite = textSprite.rectSprite;
                                            textSprite.show();
                                            rectSprite.show();
                                        }

                                        rectSprite.setAttributes({
                                            x: config.x + (index == last ? -18 : 20),
                                            y: config.y - 36,
                                            width: 36 + (diff &gt;= 10 ? (diff &gt;= 100 ? (diff &gt;= 1000 ? 30 : 20) : 10) : 0),
                                            height: 22,
                                            fill: 'tomato',
                                            stroke: 'black',
                                            radius: 4,
                                            opacity: 1,
                                            zIndex: 10000
                                        });

                                        textSprite.setAttributes({
                                            text: '+ ' + diff,
                                            x: config.x + (index == last ? -12 : 28),
                                            y: config.y - 20,
                                            fill: 'black',
                                            fontSize: 16,
                                            zIndex: 10001,
                                            scalingY: -1
                                        });
                                    } else {
                                        textSprites = surface.myTextSprites;
                                        if (textSprites) {
                                            textSprite = textSprites[index];
                                            if (textSprite) {
                                                textSprite.rectSprite.hide();
                                                textSprite.hide();
                                            }
                                        }
                                    }
                                    return null;
                                }" />
                </ext:BarSeries>
            </Series>
            <Axes>
                <ext:NumericAxis Position="Left" Fields="g1,g2" Minimum="0" />
                <ext:CategoryAxis Position="Bottom" Fields="name" />
            </Axes>
        </ext:CartesianChart>
    </Items>
</ext:Panel>