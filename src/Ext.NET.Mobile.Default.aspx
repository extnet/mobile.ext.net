<%@ Page Language="C#" %>

<script runat="server">
    protected void Button1_Tap(object sender, DirectEventArgs e)
    {
        X.Msg.Alert("Working", e.ExtraParams["text"]).Show();
    }
</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Ext.NET Mobile Example</title>
</head>
<body>
    <ext:ResourceManager runat="server" Theme="Triton" />

    <ext:Viewport runat="server" Layout="VBoxLayout" Padding="10">
        <Items>
            <ext:Container runat="server">
                <Content>
                    <header>
                        <a href="http://ext.net/">
                            <img src="http://speed.ext.net/identity/extnet-logo-small.png" />
                        </a>
                    </header>

                    <h1>Welcome to Ext.NET Mobile!</h1>

                    <p>Thank you for installing Ext.NET Mobile.</p>

                    <p>You can check that everything is working correctly by submitting a value in the message box below.</p>
                </Content>
            </ext:Container>

            <ext:TextArea
                ID="TextArea1"
                runat="server"
                Label="Message"
                LabelWidth="80"
                PlaceHolder=">> Enter a Test Message Here <<"
                Height="85"
                MarginSpec="10 0 5 0" />

            <ext:Button
                ID="Button1"
                runat="server"
                Text="Submit"
                Icon="Accept">
                <DirectEvents>
                    <Tap OnEvent="Button1_Tap">
                        <ExtraParams>
                            <ext:Parameter Name="text" Value="App.TextArea1.getValue()" Mode="Raw" />
                        </ExtraParams>
                    </Tap>
                </DirectEvents>
            </ext:Button>
        </Items>
    </ext:Viewport>
</body>
</html>