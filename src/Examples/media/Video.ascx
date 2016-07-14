<%@ Control Language="C#" %>

<ext:Panel
    runat="server"
    Cls="card" >
    <Listeners>
        <Hide Handler="this.down('video').fireEvent('hide');" />
        <Show Handler="this.down('video').fireEvent('show');" />
    </Listeners>
    <Items>
        <ext:Video runat="server"
            PosterUrl="resources/images/bigbuckvideo_cover.jpg"
            Loop="true"
            UrlList="resources/video/BigBuck.m4v, resources/video/BigBuck.webm" />
    </Items>
</ext:Panel>
