<%@ Page Language="C#" MasterPageFile="~/Examples/Example2.Master" %>

<asp:Content ContentPlaceHolderID="ExampleName" runat="server">Viewport Form</asp:Content>

<asp:Content ContentPlaceHolderID="Head" runat="server">
    <script runat="server">
        protected void Button1_DirectTap(object sender, DirectEventArgs e)
        {
            X.Js.Call("alert", "Pressed: " + this.Button1.Pressed);
        }
    </script>
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
                    <ext:Button ID="Button1" runat="server" Text="Toggle Me" EnableToggle="true" OnDirectTap="Button1_DirectTap" />
                </Items>
            </ext:Container>
        </Items>
    </ext:Viewport>
</asp:Content>