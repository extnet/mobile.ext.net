<%@ Control Language="C#" %>

<ext:Container runat="server" Layout="VBoxLayout">
    <Defaults>
        <ext:Parameter Name="margin" Value="0 0 7 0" Mode="Value"></ext:Parameter>
    </Defaults>
    <Items>
        <ext:Component runat="server" Html="Long running requests to server:" />
        <ext:Container runat="server" Layout="HBoxLayout">
            <Items>
                <ext:Button runat="server" Text="Run" Width="75">
                    <DirectEvents>
                        <Tap Url="Data/DurationMessages.ashx" Complete="Ext.Msg.alert('Done', 'The operation has been completed.');">
                            <EventMask>
                                <DurationMessages>
                                    <ext:DurationMessage Duration="1000" Message="Hm... taking a bit longer than expected..." />
                                    <ext:DurationMessage Duration="3500" Message="Well, this is a bit unexpected... almost there now..." />
                                    <ext:DurationMessage Duration="5000" Message="The server is taking really long. Sorry... still waiting..." />
                                </DurationMessages>
                            </EventMask>
                        </Tap>
                    </DirectEvents>
                </ext:Button>
                <ext:Component runat="server" Html="&nbsp;- DirectEvent</div>" />
            </Items>
        </ext:Container>
        <ext:Container runat="server" Layout="HBoxLayout">
            <Items>
                <ext:Button runat="server" Text="Run" Width="75">
                    <DirectEvents>
                        <Tap Url="Data/DurationMessages.ashx" Complete="Ext.Msg.alert('Done', 'The operation has been completed.');">
                            <EventMask ShowMask="true" ShowDurationMessages="false" />
                        </Tap>
                    </DirectEvents>
                </ext:Button>
                <ext:Component runat="server" Html="&nbsp;- Turn off duraction messages" />
            </Items>
        </ext:Container>
        <ext:Container runat="server" Layout="HBoxLayout">
            <Items>
                <ext:Button runat="server" Text="Run" Width="75">
                    <Listeners>
                        <Tap Handler="Ext.net.DirectMethod.request({
                                            url: 'Data/DurationMessages.ashx',
                                            eventMask: {
                                                durationMessages: [{
                                                    duration: 1000,
                                                    message: 'DirectMethod duration message for 1000 milliseconds'
                                                }, {
                                                    duration: 3000,
                                                    message: 'DirectMethod duration message for 3000 milliseconds'
                                                }]
                                            },
                                            complete: function() {
                                                Ext.Msg.alert('Done', 'The operation has been completed.');
                                            }
                                        });" />
                    </Listeners>
                </ext:Button>
                <ext:Component runat="server" Html="&nbsp;- DirectMethod" />
            </Items>
        </ext:Container>
    </Items>
</ext:Container>
