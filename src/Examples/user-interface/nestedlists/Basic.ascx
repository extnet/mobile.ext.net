<%@ Control Language="C#" %>

<ext:Container runat="server" Layout="VBoxLayout">
    <Items>
        <ext:NestedList
            ID="NestedList1"
            runat="server"
            Title="Groceries"
            DisplayField="text"
            Flex="1">
            <DetailCard>
                <ext:Component runat="server" />
            </DetailCard>
            <Listeners>
                <LeafItemTap Handler="item.getDetailCard().setHtml('You selected: ' + record.get('text'));" />
            </Listeners>
            <Store>
                <ext:TreeStore runat="server">
                    <Model>
                        <ext:Model runat="server">
                            <Fields>
                                <ext:ModelField Name="text" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Root>
                        <ext:Node Text="Groceries">
                            <Children>
                                <ext:Node Text="Drinks">
                                    <Children>
                                        <ext:Node NodeID="" Text="Water">
                                            <Children>
                                                <ext:Node Text="Sparkling" Leaf="true" />
                                                <ext:Node Text="Still" Leaf="true" />
                                            </Children>
                                        </ext:Node>
                                        <ext:Node Text="Coffee" Leaf="true" />
                                        <ext:Node Text="Espresso" Leaf="true" />
                                        <ext:Node Text="Redbull" Leaf="true" />
                                        <ext:Node Text="Coke" Leaf="true" />
                                        <ext:Node Text="Diet Coke" Leaf="true" />
                                    </Children>
                                </ext:Node>
                                <ext:Node NodeID="Fruit" Text="Fruit">
                                    <Children>
                                        <ext:Node Text="Bananas" Leaf="true" />
                                        <ext:Node Text="Lemon" Leaf="true" />
                                    </Children>
                                </ext:Node>
                                <ext:Node Text="Snacks">
                                    <Children>
                                        <ext:Node Text="Nuts" Leaf="true" />
                                        <ext:Node Text="Pretzels" Leaf="true" />
                                        <ext:Node Text="Wasabi Peas" Leaf="true" />
                                    </Children>
                                </ext:Node>
                            </Children>
                        </ext:Node>
                    </Root>
                </ext:TreeStore>
            </Store>
        </ext:NestedList>
    </Items>
</ext:Container>