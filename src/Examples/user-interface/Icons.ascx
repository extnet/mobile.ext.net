<%@ Control Language="C#" %>

<%-- If tab panel is added inside a panel, must specify its height manually.
 If tab panel (like below) is defined directly, not specifying height works
 but tab body is not displayed (even if height is specified!). --%>
<ext:TabPanel runat="server" ActiveTabIndex="0" Cls="card">
    <LayoutConfig>
        <ext:LayoutConfig>
            <CustomConfig>
                <ext:ConfigItem Name="animation" Value="{ type: 'slide', duration: 250 }" Mode="Raw" />
            </CustomConfig>
        </ext:LayoutConfig>
    </LayoutConfig>
    <TabBarConfig Docked="Bottom" Scrollable="Disabled">
    </TabBarConfig>
    <Defaults>
        <ext:Parameter Name="scrollable" Value="true" Mode="Raw" />
    </Defaults>
    <Items>
        <ext:Panel
            runat="server"
            Title="Info"
            Cls="card"
            Html="Tabs and buttons can display any <a href='http://fortawesome.github.io/Font-Awesome/icons/'>Font Awesome</a> icon using the <code>iconCls</code> config."
            IconCls="x-fa fa-info-circle" />

        <ext:Panel
            runat="server"
            Title="Download"
            Cls="card dark"
            Html="<span class=&quot;action&quot;>User tapped Download</span>"
            IconCls="x-fa fa-download" />

        <ext:Panel
            runat="server"
            Title="Favorites"
            Cls="card"
            Html="<span class=&quot;action&quot;>User tapped Favorites</span>"
            IconCls="x-fa fa-star">
            <CustomConfig>
                <ext:ConfigItem
                    Name="hidden"
                    Value="(Ext.filterPlatform('ie10') && Ext.os.is.Phone) ? true : false"
                    Mode="Raw" />
            </CustomConfig>
        </ext:Panel>

        <ext:Panel
            runat="server"
            Title="Bookmarks"
            Cls="card dark"
            Html="<span class=&quot;action&quot;>User tapped Bookmarks</span>"
            IconCls="x-fa fa-bookmark" />

        <ext:Panel
            runat="server"
            Title="More"
            Cls="card"
            Html="<span class=&quot;action&quot;>User tapped More</span>"
            IconCls="x-fa fa-ellipsis-h" />

        <ext:Toolbar runat="server" Docked="Top" UIName="neutral">
            <LayoutConfig>
                <ext:LayoutConfig>
                    <CustomConfig>
                        <ext:ConfigItem
                            Name="pack"
                            Value="(Ext.filterPlatform('ie10') && !Ext.os.is.Phone) ? 'start' : 'center'"
                            Mode="Raw" />
                    </CustomConfig>
                </ext:LayoutConfig>
            </LayoutConfig>
            <Items>
                <ext:Button runat="server" IconCls="x-fa fa-check" UIName="plain" />
                <ext:Button runat="server" IconCls="x-fa fa-plus" UIName="plain" />
                <ext:Button runat="server" IconCls="x-fa fa-pencil-square-o" UIName="plain" />
                <ext:Button runat="server" IconCls="x-fa fa-times" UIName="plain" />
                <ext:Button runat="server" IconCls="x-fa fa-refresh" UIName="plain" />
                <ext:Button runat="server" IconCls="x-fa fa-reply" UIName="plain" />
            </Items>
        </ext:Toolbar>
    </Items>
</ext:TabPanel>