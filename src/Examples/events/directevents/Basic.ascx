<%@ Control Language="C#" %>

<ext:Container runat="server">
    <LayoutConfig>
        <ext:VBoxLayoutConfig Align="Start" />
    </LayoutConfig>
    <Items>
        <ext:Component runat="server" Html="Simple DirectEvent:" />

        <ext:Button runat="server" Text="Click Me" DirectTapUrl="~/Data/GetServerTime.ashx" />

        <ext:Component runat="server" Html="<br/>DirectEvent with confirmation:" />

        <ext:Button runat="server" Text="Click Me">
            <DirectEvents>
                <Tap Url="~/Data/GetServerTime.ashx">
                    <Confirmation ConfirmRequest="true" Title="Title" Message="Sample Confirmation Message..." />
                </Tap>
            </DirectEvents>
        </ext:Button>

        <ext:Component runat="server" Html="<br/>DirectEvent with mask:" />

        <ext:Button runat="server" Text="Click Me">
            <DirectEvents>
                <Tap Url="~/Data/GetServerTime.ashx">
                    <EventMask Message="Loading..." MinDelay="2000" />
                </Tap>
            </DirectEvents>
        </ext:Button>
    </Items>
</ext:Container>
