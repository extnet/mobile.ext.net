<%@ Control Language="C#" %>

<%@ Implements Interface="Ext.Net.Mobile.IDynamicUserControl" %>

<script runat="server">
    public void BeforeRender()
    {
        if (RequestManager.IsAndroid)
        {
            this.Panel1.Items.Add(new Ext.Net.Mobile.Button()
            {
                ID = "playbtn",
                Text = "Play audio",
                Handler = @"
                    if (App.audio1.isPlaying()) {
                        App.audio1.pause();
                        this.setText('Play audio');
                    } else {
                        App.audio1.play();
                        this.setText('Pause audio');
                    };"
            });

            this.Panel1.LayoutConfig.Add(new VBoxLayoutConfig()
            {
                Pack = BoxPack.Center,
                Align = BoxAlign.Center
            });
        }
        else
        {
            this.Panel1.Layout = "fit";
        }
    }
</script>

<ext:Panel
    ID="Panel1"
    runat="server"
    Cls="card">
    <Listeners>
        <Hide Handler="this.down('audio').fireEvent('hide'); this.down('button').setText('Play audio');" />
        <Show Handler="this.down('audio').fireEvent('show');" />
    </Listeners>
    <Items>
        <ext:Audio runat="server" ID="audio1" Url="resources/audio/crash.mp3" Loop="true" Cls="myAudio" />
    </Items>
</ext:Panel>
