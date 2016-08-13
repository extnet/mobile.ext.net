<%@ Control Language="C#" %>

<ext:Container runat="server" Layout="FitLayout">
    <Items>
        <ext:Panel ID="IntroPanel" runat="server" Padding="10">
            <Items>
                <ext:Button
                    runat="server"
                    Text="Console"
                    UI="Confirm"
                    MarginSpec="0 0 10 0"
                    Handler="showTouchPanel();" />

                <ext:Component runat="server">
                    <Content>
                        <p>
                            Ext.NET Mobile comes with a multitude of touch
                            events available on components. Included touch
                            events that can be used are:
                        </p>
                        <ul>
                            <li>touchstart</li>
                            <li>touchmove</li>
                            <li>touchend</li>
                            <li>dragstart</li>
                            <li>drag</li>
                            <li>dragend</li>
                            <li>tap</li>
                            <li>singletap</li>
                            <li>doubletap</li>
                            <li>longpress</li>
                            <li>swipe</li>
                            <li>pinch (on iOS and Android 3+)</li>
                            <li>rotate (on iOS and Android 3+)</li>
                        </ul>
                    </Content>
                </ext:Component>
            </Items>
            <HtmlBin>
                <script>
                    var showTouchPanel = function () {
                        App.IntroPanel.hide();
                        App.TouchPanel.show();
                    };
                </script>
            </HtmlBin>
        </ext:Panel>
        <ext:Container ID="TouchPanel" runat="server" Hidden="true">
            <LayoutConfig>
                <ext:VBoxLayoutConfig Pack="Center" Align="Stretch" />
            </LayoutConfig>
            <Items>
                <ext:Container
                    ID="touchpad"
                    runat="server"
                    Flex="1"
                    Margin="10">
                    <LayoutConfig>
                        <ext:VBoxLayoutConfig Pack="Center" Align="Stretch" />
                    </LayoutConfig>
                    <Items>
                        <ext:Container runat="server">
                            <Content>Touch here!</Content>
                            <PreInit Handler="initTouchEvents();" />
                        </ext:Container>
                    </Items>
                    <HtmlBin>
                        <script>
                            var initTouchEvents = function () {
                                var onTouchPadEvent = function (e, target, options) {
                                    var scroller = App.logger.getScrollable();

                                    App.logger.innerHtmlElement.createChild({ html: e.type });

                                    setTimeout(function () {
                                        scroller.scrollTo(0, scroller.getSize().y - scroller.getClientSize().y);
                                    }, 50);
                                };

                                Ext.get('touchpad').on({
                                    scope: this,
                                    touchstart: onTouchPadEvent,
                                    touchend: onTouchPadEvent,
                                    touchmove: onTouchPadEvent,
                                    swipe: onTouchPadEvent,
                                    dragstart: onTouchPadEvent,
                                    drag: onTouchPadEvent,
                                    dragendd: onTouchPadEvent,
                                    tap: onTouchPadEvent,
                                    singletap: onTouchPadEvent,
                                    doubletap: onTouchPadEvent,
                                    longpress: onTouchPadEvent,
                                    pinch: onTouchPadEvent,
                                    rotate: onTouchPadEvent
                                });
                            };
                        </script>
                    </HtmlBin>
                </ext:Container>
                <ext:Container runat="server" Layout="FitLayout" Flex="1">
                    <Items>
                        <ext:Toolbar
                            runat="server"
                            UIName="light"
                            Docked="Top"
                            Title="Event Log" />

                        <ext:Container
                            ID="logger"
                            runat="server"
                            Scrollable="Both"
                            StyleHtmlContent="true"
                            Padding="10">
                            <Content>
                                <span>Try using gestures on the indicated area to see how events are fired.</span>
                            </Content>
                        </ext:Container>
                    </Items>
                </ext:Container>
            </Items>
        </ext:Container>
    </Items>
</ext:Container>