<%@ Control Language="C#" %>

<ext:FormPanel runat="server">
    <CustomConfig>
        <ext:ConfigItem Name="viewModel"
            Value="{ formulas: { quad: function(get) { return get('twice') * 2; }, twice: { get: function (get) { return get('x') * 2; } } }, data: { x: 1 } }"
            Mode="Raw" />
    </CustomConfig>
    <Items>
        <ext:FieldSet runat="server"
            Instructions="As the field changes, the formula calculates the 2x and 4x values.">
            <Items>
                <ext:SpinnerField runat="server" Label="Number" StepValue="1" BindString="{x}" />
                <ext:TextField runat="server" ReadOnly="true" Label="Times 2" BindString="{x} * 2 = {twice}" />
                <ext:TextField runat="server" ReadOnly="true" Label="Times 4" BindString="{x} * 4 = {quad}" />
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>