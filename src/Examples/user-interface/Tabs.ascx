<%@ Control Language="C#" %>

<ext:TabPanel runat="server" ActiveTabIndex="1" Cls="card">
    <TabBarConfig>
        <LayoutConfig>
            <ext:LayoutConfig>
                <CustomConfig>
                    <ext:ConfigItem
                        Name="pack"
                        Value="Ext.filterPlatform('ie10') ? 'start' : 'center'"
                        Mode="Raw" />
                </CustomConfig>
            </ext:LayoutConfig>
        </LayoutConfig>
    </TabBarConfig>
    <Defaults>
        <ext:Parameter
            Name="scrollable"
            Value="true"
            Mode="Raw" />
    </Defaults>
    <Items>
        <ext:Panel
            runat="server"
            Title="Tab 1"
            Html="By default, tabs are aligned to the top of a view."
            Cls="card">
            <CustomConfig>
                <ext:ConfigItem
                    Name="iconCls"
                    Value="Ext.theme.is.Blackberry || Ext.theme.is.Tizen ? 'home' : null"
                    Mode="Raw" />
            </CustomConfig>
        </ext:Panel>
        <ext:Panel
            runat="server"
            Title="Tab 2"
            Html="A TabPanel can use different animations by setting <code>layout.animation.</code>"
            Cls="card">
            <CustomConfig>
                <ext:ConfigItem
                    Name="iconCls"
                    Value="Ext.theme.is.Blackberry || Ext.theme.is.Tizen ? 'organize' : null"
                    Mode="Raw" />
            </CustomConfig>
        </ext:Panel>
        <ext:Panel
            runat="server"
            Title="Tab 3"
            Html="<span class=&quot;action&quot;>User tapped Tab 3</span>"
            Cls="card">
            <CustomConfig>
                <ext:ConfigItem
                    Name="iconCls"
                    Value="Ext.theme.is.Blackberry || Ext.theme.is.Tizen ? 'favorites' : null"
                    Mode="Raw" />
            </CustomConfig>
        </ext:Panel>
    </Items>
</ext:TabPanel>