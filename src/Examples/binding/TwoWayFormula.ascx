<%@ Control Language="C#" %>

<ext:FormPanel runat="server">
    <CustomConfig>
        <ext:ConfigItem Name="viewModel"
            Value="{ 
                formulas: {
                    // The calls to correctFloat here are to preserve the stability
                    // of the values, we don't want precision rounding to cause the
                    // viewmodel to think the data is different.
                    celsius: {
                        get: function(get) {
                            return Ext.Number.correctFloat(get('kelvin') - 273.15);
                        },
                        set: function(v) {
                            this.set('kelvin', Ext.Number.correctFloat(v + 273.15));
                        }
                    },
                    fahrenheit: {
                        get: function(get) {
                            return Ext.Number.correctFloat(get('celsius') * 1.8 + 32);
                        },
                        set: function(v) {
                            this.set('celsius', Ext.Number.correctFloat((v - 32) / 1.8));
                        }
                    }
                },
                data: {
                    kelvin: 300.1
                }
            }"
            Mode="Raw" />
    </CustomConfig>
    <Items>
        <ext:FieldSet runat="server"
            Instructions="The Celsius value is calculated from Kelvin. When the Celsius value changes, the Kelvin value is updated via the formula. The Fahrenheight value is calculated from Celsius. When the Fahrenheit value changes, the Celsius value is updated via the formula.">
            <Items>
                <ext:SpinnerField runat="server" Label="Kelvin °" StepValue="0.1" BindString="{kelvin}" />
                <ext:SpinnerField runat="server" Label="Fahrenheit °" StepValue="0.1" BindString="{fahrenheit}" />
                <ext:SpinnerField runat="server" Label="Celsius °" StepValue="0.1" BindString="{celsius}" />
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>