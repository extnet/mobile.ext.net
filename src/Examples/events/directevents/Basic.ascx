<%@ Control Language="C#" %>

<ext:Container runat="server">
    <LayoutConfig>
        <ext:VBoxLayoutConfig Align="Start" />
    </LayoutConfig>
    <Defaults>
        <ext:Parameter Name="margin" Value="10 0 0 10" Mode="Value" />
    </Defaults>
    <Items>
        <ext:Component runat="server" Html="Simple DirectEvent:" />

        <ext:Button runat="server" Text="Click Me" DirectTapUrl="~/Data/GetServerTime.ashx" />

        <ext:Component runat="server" Html="DirectEvent with confirmation:" />

        <ext:Button runat="server" Text="Click Me">
            <DirectEvents>
                <Tap Url="~/Data/GetServerTime.ashx">
                    <Confirmation ConfirmRequest="true" Title="Title" Message="Sample Confirmation Message..." />
                </Tap>
            </DirectEvents>
        </ext:Button>

        <ext:Component runat="server" Html="DirectEvent with mask:" />

        <ext:Button runat="server" Text="Click Me">
            <DirectEvents>
                <Tap Url="~/Data/GetServerTime.ashx">
                    <EventMask ShowMask="true" MinDelay="2000" />
                </Tap>
            </DirectEvents>
        </ext:Button>
    </Items>
</ext:Container>