<ext:FormPanel runat="server" PaddingSpec="2em">
    <Items>
        <ext:TextField runat="server" PlaceHolder="Title">
            <Plugins>
                <ext:PlaceHolderLabel runat="server" />
            </Plugins>
        </ext:TextField>
        <ext:Container runat="server" Cls="container-borders" Layout="HBoxLayout">
            <Defaults>
                <ext:Parameter Name="flex" Value="1" Mode="Raw" />
            </Defaults>
            <Items>
                <ext:TextField runat="server" PlaceHolder="Price">
                    <Plugins>
                        <ext:PlaceHolderLabel runat="server" />
                    </Plugins>
                </ext:TextField>
                <ext:TextField runat="server" PlaceHolder="Specific Location (optional)">
                    <Plugins>
                        <ext:PlaceHolderLabel runat="server" />
                    </Plugins>
                </ext:TextField>
            </Items>
        </ext:Container>
        <ext:TextArea runat="server" PlaceHolder="Description">
            <Plugins>
                <ext:PlaceHolderLabel runat="server" />
            </Plugins>
        </ext:TextArea>
    </Items>
</ext:FormPanel>
