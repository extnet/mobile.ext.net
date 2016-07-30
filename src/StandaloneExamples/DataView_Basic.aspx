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
    </script>

    <style>
        .selected-item {
            background-color: yellow;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="ExampleContent" runat="server">
    <ext:DataView runat="server" SelectedCls="selected-item">
        <ItemTpl runat="server">
            <Html>
                <div>{name} is {age} years old</div>
            </Html>
        </ItemTpl>
        <Store>
            <ext:Store ID="Store1" runat="server">
                <Model>
                    <ext:Model runat="server">
                        <Fields>
                            <ext:ModelField Name="name" />
                            <ext:ModelField Name="age" />
                        </Fields>
                    </ext:Model>
                </Model>
            </ext:Store>
        </Store>
    </ext:DataView>
</asp:Content>