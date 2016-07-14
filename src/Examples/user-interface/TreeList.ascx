<%@ Control Language="C#" %>

<ext:Panel ID="TreeListPanel" runat="server" Title="TreeList">
    <LayoutConfig>
        <ext:VBoxLayoutConfig Align="Stretch" />
    </LayoutConfig>
    <ResourceItems>
        <ext:ClientResourceItem Path="resources/js/examples/treelist.js" />
    </ResourceItems>
    <Items>
        <ext:Container runat="server" Flex="1" Scrollable="Vertical">
            <Items>
                <ext:Toolbar runat="server" Docked="Top" Border="false">
                    <Items>
                        <ext:SegmentedButton runat="server" AllowMultiple="true">
                            <Items>
                                <ext:Button ID="NavButton" runat="server" Text="Nav">
                                    <Listeners>
                                        <PressedChange Fn="onNavPressedChange" />
                                    </Listeners>
                                </ext:Button>
                                <ext:Button ID="MicroButton" runat="server" Text="Micro">
                                    <Listeners>
                                        <PressedChange Fn="onMicroPressedChange" />
                                    </Listeners>
                                </ext:Button>
                            </Items>
                        </ext:SegmentedButton>
                    </Items>
                </ext:Toolbar>

                <ext:TreeList ID="TreeList1" runat="server">
                    <Store>
                        <ext:TreeStore runat="server">
                            <Root>
                                <ext:Node Expanded="true">
                                    <Children>
                                        <ext:Node Text="Home" IconCls="x-fa fa-home">
                                            <Children>
                                                <ext:Node Text="Messages" IconCls="x-fa fa-inbox" Leaf="true" />
                                                <ext:Node Text="Archive" IconCls="x-fa fa-database">
                                                    <Children>
                                                        <ext:Node Text="First" IconCls="x-fa fa-sliders" Leaf="true" />
                                                        <ext:Node Text="No Icon" Leaf="true" />
                                                    </Children>
                                                </ext:Node>
                                                <ext:Node Text="Music" IconCls="x-fa fa-music" Leaf="true" />
                                                <ext:Node Text="Video" IconCls="x-fa fa-film" Leaf="true" />
                                            </Children>
                                        </ext:Node>

                                        <ext:Node Text="Users" IconCls="x-fa fa-user">
                                            <Children>
                                                <ext:Node Text="Tagged" IconCls="x-fa fa-tag" Leaf="true" />
                                                <ext:Node Text="Inactive" IconCls="x-fa fa-trash" Leaf="true" />
                                            </Children>
                                        </ext:Node>

                                        <ext:Node Text="Groups" IconCls="x-fa fa-group" Leaf="true" />

                                        <ext:Node Text="Settings" IconCls="x-fa fa-wrench">
                                            <Children>
                                                <ext:Node Text="Sharing" IconCls="x-fa fa-share-alt" Leaf="true" />
                                                <ext:Node Text="Network" IconCls="x-fa fa-signal" Leaf="true" />
                                            </Children>
                                        </ext:Node>
                                    </Children>
                                </ext:Node>
                            </Root>
                        </ext:TreeStore>
                    </Store>
                    <Listeners>
                        <SelectionChange Fn="onSelectionChange" />
                    </Listeners>
                </ext:TreeList>
            </Items>
        </ext:Container>

        <ext:Component
            ID="TreeListLog"
            runat="server"
            Cls="treelist-log"
            Padding="10"
            Height="50"
            Html="No node selected" />
    </Items>
    <CustomConfig>
        <ext:ConfigItem Name="otherContent">
            <ext:Parameter Name="type" Value="JavaScript" Mode="Value" />
            <ext:Parameter Name="path" Value="resources/js/examples/treelist.js" Mode="Value" />
        </ext:ConfigItem>
    </CustomConfig>
</ext:Panel>

