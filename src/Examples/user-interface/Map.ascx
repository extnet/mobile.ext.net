<%@ Control Language="C#" %>

<ext:Container runat="server" FullScreen="true">
    <Content>
        <style type="text/css">
            .x-innerhtml { height: 100%; border: 0 }
            .x-innerhtml .x-hidden { height: 100% }
        </style>
        <iframe id="mapIframe" src="../../StandaloneExamples/Map_Locations.aspx" class="x-innerhtml" />
    </Content>
</ext:Container>