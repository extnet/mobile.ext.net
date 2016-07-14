<%@ Control Language="C#" %>

<ext:FormPanel runat="server">
    <CustomConfig>
        <ext:ConfigItem Name="viewModel" Value="true" Mode="Raw" />
    </CustomConfig>
    <Items>
        <ext:FieldSet runat="server"
            Instructions="The admin key field is disabled when the admin checkbox is not checked. The high priority field is hidden when the priority is toggled.">
            <Items>
                <ext:Checkbox runat="server" Label="Is Admin" Reference="isAdmin" />
                <ext:TextField runat="server" Label="Admin Key">
                    <Bind>
                        <ext:Parameter Name="disabled" Value="{!isAdmin.checked}" />
                    </Bind>
                </ext:TextField>
                <ext:ToggleField runat="server" Label="Priority" Reference="priority" />
                <ext:TextField runat="server" Label="High Priority Code">
                    <Bind>
                        <ext:Parameter Name="hidden" Value="{!priority.value}" />
                    </Bind>
                </ext:TextField>
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>