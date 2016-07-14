<%-- Example not working at all. Seems some JavaScript must be included in order for this to work. --%>
<%-- Works fine on Sencha. --%>

<ext:FormPanel runat="server">
    <Items>
        <ext:FieldSet runat="server">
            <Defaults>
                <ext:Parameter Name="labelAlign" Value="top" />
            </Defaults>
            <Items>
                <ext:TextField runat="server" Label="Title">
                    <CustomConfig>
                        <ext:ConfigItem Name="labelAsPlaceHolder" Value="true" Mode="Raw" />
                    </CustomConfig>
                </ext:TextField>
                <ext:TextField runat="server" Label="Price">
                    <CustomConfig>
                        <ext:ConfigItem Name="labelAsPlaceHolder" Value="true" Mode="Raw" />
                    </CustomConfig>
                </ext:TextField>
                <ext:TextField runat="server" Label="Specific Location (optional)">
                    <CustomConfig>
                        <ext:ConfigItem Name="labelAsPlaceHolder" Value="true" Mode="Raw" />
                    </CustomConfig>
                </ext:TextField>
                <ext:TextArea runat="server" Label="Description">
                    <CustomConfig>
                        <ext:ConfigItem Name="labelAsPlaceHolder" Value="true" Mode="Raw" />
                    </CustomConfig>
                </ext:TextArea>
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>
