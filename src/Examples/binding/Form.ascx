<%@ Control Language="C#" %>

<ext:FormPanel runat="server" Layout="VBoxLayout" Scrollable="Both">
    <CustomConfig>
        <ext:ConfigItem Name="viewModel"
            Value="{ data: { red: 255, green: 100, blue: 150 } }"
            Mode="Raw" />
    </CustomConfig>
    <Items>
        <ext:FieldSet runat="server" Flex="1" MinHeight="400" Layout="VBoxLayout"
            Instructions="'The style of the color block is controlled by either the numeric field or the slider. Both the numeric fields and the slider are bound to the same value in the View Model.">
            <Items>
                <ext:Container runat="server" Layout="HBoxLayout">
                    <Defaults>
                        <ext:Parameter Name="maxValue" Value="255" Mode="Raw" />
                        <ext:Parameter Name="minValue" Value="0" Mode="Raw" />
                    </Defaults>
                    <Items>
                        <ext:NumberField runat="server" Label="Red" Width="150"
                            BindString="{red}" LabelWidthPercent="50" />
                        <ext:SingleSlider runat="server" Flex="1" BindString="{red}" LiveUpdate="true" />
                    </Items>
                </ext:Container>
                <ext:Container runat="server" Layout="HBoxLayout">
                    <Defaults>
                        <ext:Parameter Name="maxValue" Value="255" Mode="Raw" />
                        <ext:Parameter Name="minValue" Value="0" Mode="Raw" />
                    </Defaults>
                    <Items>
                        <ext:NumberField runat="server" Label="Green" Width="150"
                            BindString="{green}" LabelWidthPercent="50" />
                        <ext:SingleSlider runat="server" Flex="1" BindString="{green}" LiveUpdate="true" />
                    </Items>
                </ext:Container>
                <ext:Container runat="server" Layout="HBoxLayout">
                    <Defaults>
                        <ext:Parameter Name="maxValue" Value="255" Mode="Raw" />
                        <ext:Parameter Name="minValue" Value="0" Mode="Raw" />
                    </Defaults>
                    <Items>
                        <ext:NumberField runat="server" Label="Blue" Width="150"
                            BindString="{blue}" LabelWidthPercent="50" />
                        <ext:SingleSlider runat="server" Flex="1" BindString="{blue}" LiveUpdate="true" />
                    </Items>
                </ext:Container>
                <ext:Component runat="server" Flex="1">
                    <Bind>
                        <ext:Parameter Name="style">
                            <ext:Parameter Name="backgroundColor" Value="rgba({red}, {green}, {blue}, 1)" />
                        </ext:Parameter>
                    </Bind>
                </ext:Component>
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>