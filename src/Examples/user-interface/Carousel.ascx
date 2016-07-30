<%@ Control Language="C#" %>

<ext:Container runat="server" Cls="cards">
    <LayoutConfig>
        <ext:VBoxLayoutConfig Align="Stretch" />
    </LayoutConfig>
    <Defaults>
        <ext:Parameter Name="flex" Value="1" Mode="Raw" />
    </Defaults>
    <Items>
        <ext:Carousel runat="server">
            <Items>
                <ext:Component runat="server" Html="<p>Swipe left to show the next card&hellip;</p>" Cls="card" />
                <ext:Component runat="server" Html="<p>You can also tap on either side of the indicators.</p>" Cls="card" />
                <ext:Component runat="server" Html="Card #3" Cls="card" />
            </Items>
        </ext:Carousel>

        <ext:Carousel runat="server" UI="Light" Direction="Vertical">
            <Items>
                <ext:Component runat="server" Html="<p>Carousels can also be vertical <em>(swipe up)&hellip;</p>" Cls="card dark" />
                <ext:Component runat="server" Html="And can also use <code>UI=&quot;Light&quot;</code>." Cls="card dark" />
                <ext:Component runat="server" Html="Card #3" Cls="card dark" />
            </Items>
        </ext:Carousel>
    </Items>
</ext:Container>