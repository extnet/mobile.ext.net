<%@ Page Language="C#" MasterPageFile="~/Examples/ExampleWithoutResourceManager.Master" %>

<asp:Content ContentPlaceHolderID="ExampleName" runat="server">DirectEvents</asp:Content>

<asp:Content ContentPlaceHolderID="Head" runat="server">
    <script runat="server">
        public void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                if (this.Request.QueryString["theme"] != null)
                {
                    Theme theme = (Theme)Enum.Parse(typeof(Theme), this.Request.QueryString["theme"]);
                    X.ResourceManager.Theme = theme;
                }
            }
        }

        protected void UpdateTimeStamp(object sender, DirectEventArgs e)
        {
            X.Js.Call("alert", "The Server Time is: " + DateTime.Now.ToLongTimeString());
        }
    </script>

    <style>
        .box, .box-wihtout-event {
            width: 100px;
            height: 50px;
            border: 1px solid #000;
            cursor: pointer;
            text-align: center;
            margin-bottom: 4px;
            background-color: white;
        }

        .red {
            color: #fff;
            cursor: default;
            background-color: red;
        }

        .blue {
            color: #fff;
            background-color: blue;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder_ResourceManager">
    <ext:ResourceManager runat="server">
        <Listeners>
            <DocumentReady Fn="onReady" />
        </Listeners>
        <CustomDirectEvents>
            <ext:DirectEvent Target="Button1" OnEvent="UpdateTimeStamp" />
            <ext:DirectEvent Target="Button2" OnEvent="UpdateTimeStamp" />
            <ext:DirectEvent Target="Span1" OnEvent="UpdateTimeStamp" />
            <ext:DirectEvent Target="Ext.select('div.box', true)" OnEvent="UpdateTimeStamp" />
        </CustomDirectEvents>
    </ext:ResourceManager>
</asp:Content>

<asp:Content ContentPlaceHolderID="ExampleContent" runat="server">
    <ext:Container runat="server">
        <Content>
            <p>The action of each of the following samples will trigger a DirectEvent Ajax request to the server and return a Notification Window to the browser.</p>

            <h2>Add a &lt;Click> DirectEvent to &lt;ext:Button></h2>

            <ext:Button ID="Button1" runat="server" Text="Click Me" OnDirectTap="UpdateTimeStamp" />

            <h2>Add a &lt;Click> DirectEvent with confirmation to &lt;ext:Button></h2>

            <ext:Button ID="Button4" runat="server" Text="Click Me">
                <DirectEvents>
                    <Tap OnEvent="UpdateTimeStamp">
                        <Confirmation ConfirmRequest="true" Title="Title" Message="Sample Confirmation Message..." />
                    </Tap>
                </DirectEvents>
            </ext:Button>

            <h2>Add a Click DirectEvent to &lt;asp:Button></h2>

            <asp:Button ID="Button2" runat="server" Text="Click Me" />

            <h2>Add a Click DirectEvent to a standard html &lt;input> button</h2>

            <input id="Button3" type="button" value="Click Me" />

            <h2>Add a Click DirectEvent to html &lt;span> element</h2>

            <span id="Span1" style="cursor: pointer;">*Click Me*</span>

            <h2>Add a Click DirectEvent to several html &lt;div> elements by using a Target Query</h2>

            <p>By using a Target Query we can attach the same DirectEvent (or Listener) to several html elements or Controls and fire a server-side event.</p>
            <p>The target(s) do not require an "id" and do not need a runat="server" attribute. The elements can be any html element available on the Page.</p>
            <p>The following Target Query will select all &lt;div> elements on the Page that contain the css class "box", but do not contain the css class "red".</p>

            <div class="box">Click Me</div>
            <div class="box-wihtout-event red">Not Me</div>
            <div class="box blue">Click Me too!</div>
        </Content>
    </ext:Container>
</asp:Content>
