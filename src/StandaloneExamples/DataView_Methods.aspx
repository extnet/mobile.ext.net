<%@ Page Language="C#" MasterPageFile="~/Examples/Example.Master" %>

<asp:Content ContentPlaceHolderID="ExampleName" runat="server">DataView Basic</asp:Content>

<asp:Content ContentPlaceHolderID="Head" runat="server">
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                this.Store1.DataSource = new object[]
                {
                    new
                    {   name = "Peter",
                        age = 26
                    },
                    new
                    {   name = "Ray",
                        age = 21
                    },
                    new
                    {   name = "Egon",
                        age = 24
                    },
                    new
                    {   name = "Winston",
                        age = 24
                    }
                };
            }
        }

        protected void SelectByIds(object sender, DirectEventArgs e)
        {
            this.DataView1.Select(new string[] { "Peter", "Egon" });
        }

        protected void SelectByIndexes(object sender, DirectEventArgs e)
        {
            this.DataView1.Select(new int[] { 0, 1, 3 });
        }

        protected void SelectAll(object sender, DirectEventArgs e)
        {
            this.DataView1.SelectAll();
        }

        protected void DeselectAll(object sender, DirectEventArgs e)
        {
            this.DataView1.DeselectAll();
        }
    </script>

    <style>
        .selected-item {
            background-color: yellow;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="ExampleContent" runat="server">
    <ext:Container runat="server">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Stretch" />
        </LayoutConfig>
        <Items>
            <ext:Button runat="server" Text="Select Peter and Egon" OnDirectTap="SelectByIds" />
            <ext:Button runat="server" Text="Select 1, 2 and 4" OnDirectTap="SelectByIndexes" />
            <ext:Button runat="server" Text="Select all" OnDirectTap="SelectAll" />
            <ext:Button runat="server" Text="Deselect all" OnDirectTap="DeselectAll" />

            <ext:DataView
                ID="DataView1"
                runat="server"
                SelectedCls="selected-item"
                Mode="Simple">
                <ItemTpl runat="server">
                    <Html>
                        <div>{name} is {age} years old</div>
                    </Html>
                </ItemTpl>
                <Store>
                    <ext:Store ID="Store1" runat="server">
                        <Model>
                            <ext:Model runat="server" IDProperty="name">
                                <Fields>
                                    <ext:ModelField Name="name" />
                                    <ext:ModelField Name="age" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
            </ext:DataView>
        </Items>
    </ext:Container>
</asp:Content>