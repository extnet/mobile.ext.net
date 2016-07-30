<%@ Control Language="C#" %>

<script runat="server">
    public class TWFViewModel
    {
        public static object Model = new
        {
            formulas = new
            {
                // The calls to correctFloat here are to preserve the stability
                // of the values, we don't want precision rounding to cause the
                // viewmodel to think the data is different.
                celsius = new
                {
                    get = new JFunction("return Ext.Number.correctFloat(get('kelvin') - 273.15);", "get"),
                    set = new JFunction("this.set('kelvin', Ext.Number.correctFloat(v + 273.15));", "v")
                },
                fahrenheit = new
                {
                    get = new JFunction("return Ext.Number.correctFloat(get('celsius') * 1.8 + 32);", "get"),
                    set = new JFunction("this.set('celsius', Ext.Number.correctFloat((v - 32) / 1.8));", "v")
                }
            },
            data = new
            {
                kelvin = 300.1
            }
        };
    }
</script>

<ext:FormPanel runat="server" ViewModel="<%# TWFViewModel.Model %>" AutoDataBind="true">
    <Items>
        <ext:FieldSet
            runat="server"
            Instructions="The Celsius value is calculated from Kelvin. When the Celsius value changes, the Kelvin value is updated via the formula. The Fahrenheight value is calculated from Celsius. When the Fahrenheit value changes, the Celsius value is updated via the formula.">
            <Items>
                <ext:SpinnerField
                    runat="server"
                    Label="Kelvin °"
                    StepValue="0.1"
                    BindString="{kelvin}" />
                <ext:SpinnerField
                    runat="server"
                    Label="Fahrenheit °"
                    StepValue="0.1"
                    BindString="{fahrenheit}" />
                <ext:SpinnerField
                    runat="server"
                    Label="Celsius °"
                    StepValue="0.1"
                    BindString="{celsius}" />
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>