<%@ Control Language="C#" %>

<ext:FormPanel runat="server" Scrollable="Both">
    <Items>
        <ext:FieldSet runat="server">
            <Defaults>
                <ext:Parameter Name="labelWidth" Value="35%" />
                <ext:Parameter Name="labelAlign" Value="top" />
            </Defaults>
            <Items>
                <ext:Slider runat="server" Name="thumb" Number="20" Label="Single Thumb" />
                <ext:Slider runat="server" Name="thumb" Number="30" Disabled="true" Label="Disabled Single Thumb" />
                <ext:Slider runat="server" Name="multithumb" Numbers="10, 70" Label="Multiple Thumbs" />
                <ext:ToggleField runat="server" Name="toggle" Label="Toggle" />
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>
