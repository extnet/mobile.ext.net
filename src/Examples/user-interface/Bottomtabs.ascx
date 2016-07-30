<%@ Control Language="C#" %>

<ext:TabPanel runat="server" ActiveTabIndex="0" Cls="card">
    <TabBarConfig Docked="Bottom">
        <CustomConfig>
            <ext:ConfigItem
                Name="platformConfig"
                Value="{ blackberry: { ui: 'dark' } }"
                Mode="Raw" />
        </CustomConfig>
        <LayoutConfig>
            <ext:LayoutConfig>
                <CustomConfig>
                    <ext:ConfigItem Name="pack" Value="center" />
                    <ext:ConfigItem Name="align" Value="center" />
                </CustomConfig>
            </ext:LayoutConfig>
        </LayoutConfig>
        <Defaults>
            <ext:Parameter Name="iconAlign" Value="top" />
        </Defaults>
    </TabBarConfig>
    <Defaults>
        <ext:Parameter Name="scrollable" Value="true" Mode="Raw" />
    </Defaults>
    <Items>
        <ext:Panel
            runat="server"
            Title="About"
            Cls="card"
            Html="<p>Docking tabs to the bottom will automatically change their style.</p>"
            IconCls="x-fa fa-info-circle">
        </ext:Panel>
        <ext:Panel
            runat="server"
            Title="Favorites"
            Cls="card"
            IconCls="x-fa fa-star"
            Html="Badges <em>(like the 4, below)</em> can be added by setting <code>badgeText</code> when creating a tab or by using <code>setBadgeText()</code> on the tab later."
            BadgeText="4">
        </ext:Panel>
        <ext:Panel
            ID="tab3"
            runat="server"
            Title="Downloads"
            Cls="card"
            IconCls="x-fa fa-download"
            Html="Badge labels will truncate if the text is wider than the tab."
            BadgeText="Overflow test">
            <CustomConfig>
                <ext:ConfigItem
                    Name="hidden"
                    Value="(Ext.filterPlatform('ie10') && Ext.os.is.Phone) ? true : false"
                    Mode="Raw" />
            </CustomConfig>
        </ext:Panel>
        <ext:Panel
            runat="server"
            Title="Settings"
            Cls="card"
            Html="Tabbars are <code>ui:&quot;dark&quot;</code> by default, but also have light variants."
            IconCls="x-fa fa-gear">
            <CustomConfig>
                <ext:ConfigItem
                    Name="hidden"
                    Value="(Ext.filterPlatform('ie10') && Ext.os.is.Phone) ? true : false"
                    Mode="Raw" />
            </CustomConfig>
        </ext:Panel>
        <ext:Panel
            runat="server"
            Title="User"
            Cls="card"
            Html="<span class=&quot;action&quot;>User tapped User</span>"
            IconCls="x-fa fa-user">
        </ext:Panel>
    </Items>
</ext:TabPanel>