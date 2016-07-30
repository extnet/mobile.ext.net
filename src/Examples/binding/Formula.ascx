<%@ Control Language="C#" %>

<script runat="server">
    public class FormulaViewModel
    {
        public static object Model = new
        {
            formulas = new
            {
                quad = new JFunction("return get('twice') * 2;", "get"),
                twice = new { get = new JFunction("return get('x') * 2;", "get") }
            },
            data = new
            {
                x = 1
            }
        };
    }
</script>
<ext:FormPanel runat="server" ViewModel="<%# FormulaViewModel.Model %>" AutoDataBind="true">
    <Items>
        <ext:FieldSet
            runat="server"
            Instructions="As the field changes, the formula calculates the 2x and 4x values.">
            <Items>
                <ext:SpinnerField
                    runat="server"
                    Label="Number"
                    StepValue="1"
                    BindString="{x}" />
                <ext:TextField
                    runat="server"
                    ReadOnly="true"
                    Label="Times 2"
                    BindString="{x} * 2 = {twice}" />
                <ext:TextField
                    runat="server"
                    ReadOnly="true"
                    Label="Times 4"
                    BindString="{x} * 4 = {quad}" />
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>