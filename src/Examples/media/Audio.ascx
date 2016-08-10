<%@ Control Language="C#" %>

<%@ Implements Interface="Ext.Net.Mobile.IDynamicUserControl" %>

<script runat="server">
    public void BeforeRender()
    {
        if (RequestManager.IsAndroid)
        {
            this.AudioPanel.Items.Add(new Ext.Net.Mobile.Button()
            {
                Text = "Play audio",
                Handler = @"var audio = this.up().down('audio');
                            if (audio.isPlaying()) {
                                audio.pause();
                                this.setText('Play audio');
                            } else {
                                audio.play();
                                this.setText('Pause audio');
                            };"
            });

            this.AudioPanel.LayoutConfig.Add(new VBoxLayoutConfig()
            {
                Pack = BoxPack.Center,
                Align = BoxAlign.Center
            });
        }
        else
        {
            this.AudioPanel.Layout = "fit";
        }
    }
</script>

<ext:Panel
    ID="AudioPanel"
    runat="server"
    Cls="card">
    <Listeners>
        <Hide Handler="this.down('audio').fireEvent('hide'); 
                       if (this.down('button')) { 
                           this.down('button').setText('Play audio');
                       }" />

        <Show Handler="this.down('audio').fireEvent('show');" />
    </Listeners>
    <Items>
        <ext:Audio
            runat="server"
            Url="resources/audio/crash.mp3"
            Loop="true"
            Cls="myAudio" />
    </Items>
</ext:Panel>