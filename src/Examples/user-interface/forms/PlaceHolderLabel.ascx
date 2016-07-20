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
                    <CustomConfig>
                        <ext:ConfigItem Name="plugins">
                            <ext:Parameter Name="type" Value="placeholderlabel" />
                        </ext:ConfigItem>
                    </CustomConfig>
                </ext:TextField>
                <ext:TextField runat="server" PlaceHolder="Specific Location (optional)">
                    <CustomConfig>
                        <ext:ConfigItem Name="plugins">
                            <ext:Parameter Name="type" Value="placeholderlabel" />
                        </ext:ConfigItem>
                    </CustomConfig>
                </ext:TextField>
            </Items>
        </ext:Container>
        <ext:TextArea runat="server" PlaceHolder="Description">
            <CustomConfig>
                <ext:ConfigItem Name="plugins">
                    <ext:Parameter Name="type" Value="placeholderlabel" />
                </ext:ConfigItem>
            </CustomConfig>
        </ext:TextArea>
    </Items>
</ext:FormPanel>
