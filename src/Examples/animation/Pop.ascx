<%@ Control Language="C#" %>

<%@ Register TagPrefix="sld" TagName="loremipsum2" Src="~/Examples/animation/Slide/LoremIpsum2.ascx" %>

<ext:Panel runat="server" Cls="card card3" Scrollable="Both">
    <Items>
        <ext:Container runat="server" Docked="Top" Html="Pop Animation" />
        <ext:Container runat="server">
            <Content>
                <sld:loremipsum2 runat="server" />
            </Content>
        </ext:Container>
    </Items>
</ext:Panel>