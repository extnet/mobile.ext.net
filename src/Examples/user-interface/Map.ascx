<%@ Control Language="C#" %>

<ext:Container runat="server" FullScreen="true" StyleSpec="border: 1px solid red">
    <Content>
        <style type="text/css">
            .x-innerhtml { height: 100% }
            .x-innerhtml .x-hidden { height: 100% }
        </style>
        <iframe id="mapIframe" src="../../StandaloneExamples/Map_Basic.aspx" class="x-innerhtml" />
    </Content>
</ext:Container>