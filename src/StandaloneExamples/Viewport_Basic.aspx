<%@ Page Language="C#" MasterPageFile="~/Examples/Example2.Master" %>

<asp:Content ContentPlaceHolderID="ExampleName" runat="server">Viewport Basic</asp:Content>

<asp:Content ContentPlaceHolderID="Head" runat="server">
    <style>
        .my-viewport {
            background-color: yellow;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="ExampleContent" runat="server">
    <ext:Viewport runat="server">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Pack="Justify" Align="Stretch" />
        </LayoutConfig>
        <Items>
            <ext:Container runat="server" Flex="1">
                <LayoutConfig>
                    <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
                </LayoutConfig>
                <Items>
                    <ext:Button runat="server" Text="Button 1" />

                    <ext:Button runat="server" Text="Button 2" />
                </Items>
            </ext:Container>
        </Items>
    </ext:Viewport>
</asp:Content>