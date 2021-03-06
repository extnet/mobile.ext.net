﻿<%@ Control Language="C#" %>

<ext:Container runat="server">
    <LayoutConfig>
        <ext:VBoxLayoutConfig Pack="Center" Align="Stretch" />
    </LayoutConfig>
    <Items>
        <ext:Container runat="server" Flex="1">
            <LayoutConfig>
                <ext:HBoxLayoutConfig Align="Center" />
            </LayoutConfig>
            <Defaults>
                <ext:Parameter Name="flex" Value="1" Mode="Raw" />
                <ext:Parameter Name="margin" Value="10" Mode="Raw" />
            </Defaults>
            <Items>
                <ext:Button runat="server" Text="Normal" Handler="Ext.toast('User tapped Normal', 500);" />
                <ext:Button runat="server" Text="Round" UI="Round" Handler="Ext.toast('User tapped Round', 500);" />
                <ext:Button runat="server" Text="Small" UIName="small" Handler="Ext.toast('User tapped Small', 500);" />
            </Items>
        </ext:Container>

        <ext:Container runat="server" Flex="1">
            <LayoutConfig>
                <ext:HBoxLayoutConfig Align="Center" />
            </LayoutConfig>
            <Defaults>
                <ext:Parameter Name="flex" Value="1" Mode="Raw" />
                <ext:Parameter Name="margin" Value="10" Mode="Raw" />
            </Defaults>
            <Items>
                <ext:Button runat="server" Text="Action" UI="Action" Handler="Ext.toast('User tapped Action', 500);" />
                <ext:Button runat="server" Text="Round" UI="ActionRound" Handler="Ext.toast('User tapped Action Round', 500);" />
                <ext:Button runat="server" Text="Small" UIName="action small" Handler="Ext.toast('User tapped Action Small', 500);" />
            </Items>
        </ext:Container>

        <ext:Container runat="server" Flex="1">
            <LayoutConfig>
                <ext:HBoxLayoutConfig Align="Center" />
            </LayoutConfig>
            <Defaults>
                <ext:Parameter Name="flex" Value="1" Mode="Raw" />
                <ext:Parameter Name="margin" Value="10" Mode="Raw" />
            </Defaults>
            <Items>
                <ext:Button runat="server" Text="Decline" UI="Decline" Handler="Ext.toast('User tapped Decline', 500);" />
                <ext:Button runat="server" Text="Round" UI="DeclineRound" Handler="Ext.toast('User tapped Decline Round', 500);" />
                <ext:Button runat="server" Text="Small" UIName="decline small" Handler="Ext.toast('User tapped Decline Small', 500);" />
            </Items>
        </ext:Container>

        <ext:Container runat="server" Flex="1">
            <LayoutConfig>
                <ext:HBoxLayoutConfig Align="Center" />
            </LayoutConfig>
            <Defaults>
                <ext:Parameter Name="flex" Value="1" Mode="Raw" />
                <ext:Parameter Name="margin" Value="10" Mode="Raw" />
            </Defaults>
            <Items>
                <ext:Button runat="server" Text="Confirm" UI="Confirm" Handler="Ext.toast('User tapped Confirm', 500);" />
                <ext:Button runat="server" Text="Round" UI="ConfirmRound" Handler="Ext.toast('User tapped Confirm Round', 500);" />
                <ext:Button runat="server" Text="Small" UIName="confirm small" Handler="Ext.toast('User tapped Confirm Small', 500);" />
            </Items>
        </ext:Container>
    </Items>
</ext:Container>