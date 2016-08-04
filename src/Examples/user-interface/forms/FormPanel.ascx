<%@ Control Language="C#" %>

<ext:FormPanel ID="basicform" runat="server">
    <Items>
        <ext:FieldSet
            runat="server"
            ID="fieldset1"
            Title="Personal Info"
            Instructions="Please enter the information above.">
            <Defaults>
                <ext:Parameter Name="labelWidth" Value="35%" />
            </Defaults>
            <Items>
                <ext:TextField
                    runat="server"
                    Name="name"
                    Label="Name"
                    PlaceHolder="Tom Roy"
                    AutoCapitalize="true"
                    Required="true"
                    ClearIcon="true" />
                <ext:PasswordField
                    runat="server"
                    Revealable="true"
                    Name="password"
                    Label="Password"
                    ClearIcon="true" />
                <ext:EmailField
                    runat="server"
                    Name="email"
                    Label="Email"
                    PlaceHolder="me@ext.net"
                    ClearIcon="true" />
                <ext:UrlField
                    runat="server"
                    Name="url"
                    Label="Url"
                    PlaceHolder="http://ext.net/"
                    ClearIcon="true" />
                <ext:SpinnerField
                    runat="server"
                    Name="spinner"
                    Label="Spinner"
                    MinValue="0"
                    MaxValue="10"
                    StepValue="1"
                    Cycle="true">
                </ext:SpinnerField>
                <ext:Checkbox
                    runat="server"
                    Name="cool"
                    Label="Cool" />
                <ext:DatePickerField
                    runat="server"
                    DestroyPickerOnHide="true"
                    Name="date"
                    Label="Start Date">
                    <Picker runat="server" YearFrom="1990" DateValue="2016-06-24" />
                </ext:DatePickerField>
                <ext:SelectField
                    runat="server"
                    Name="rank"
                    Label="Rank">
                    <Options>
                        <ext:ListItem Text="Master" Value="master" />
                        <ext:ListItem Text="Journeyman" Value="journeyman" />
                        <ext:ListItem Text="Apprentice" Value="apprentice" />
                    </Options>
                </ext:SelectField>
                <ext:Slider
                    runat="server"
                    Name="slider"
                    Label="Slider" />
                <ext:ToggleField
                    runat="server"
                    Name="toggle"
                    Label="Toggle" />
                <ext:TextArea
                    runat="server"
                    Name="bio"
                    Label="Bio" />
            </Items>
        </ext:FieldSet>
        <ext:FieldSet
            runat="server"
            ID="fieldset2"
            Title="Favorite color">
            <Defaults>
                <ext:Parameter Name="labelWidth" Value="35%" />
            </Defaults>
            <Items>
                <ext:Radio
                    runat="server"
                    Name="color"
                    Label="Red">
                    <CustomConfig>
                        <ext:ConfigItem Name="value" Value="red" />
                    </CustomConfig>
                </ext:Radio>
                <ext:Radio
                    runat="server"
                    Name="color"
                    Label="Blue">
                    <CustomConfig>
                        <ext:ConfigItem Name="value" Value="blue" />
                    </CustomConfig>
                </ext:Radio>
                <ext:Radio
                    runat="server"
                    Name="color"
                    Label="Green">
                    <CustomConfig>
                        <ext:ConfigItem Name="value" Value="green" />
                    </CustomConfig>
                </ext:Radio>
                <ext:Radio
                    runat="server"
                    Name="color"
                    Label="Purple">
                    <CustomConfig>
                        <ext:ConfigItem Name="value" Value="purple" />
                    </CustomConfig>
                </ext:Radio>
            </Items>
        </ext:FieldSet>
        <ext:Container runat="server" Layout="HBoxLayout">
            <Defaults>
                <ext:Parameter Name="style" Value="margin: 1em" />
                <ext:Parameter Name="flex" Value="1" Mode="Raw" />
                <%-- Use the value 1 not string "1" --%>
            </Defaults>
            <Items>
                <ext:Button
                    runat="server"
                    Text="Disable fields"
                    UI="Action"
                    Scope="this"
                    ID="formToggleBtn"
                    Handler="var fieldset1 = Ext.getCmp('fieldset1'),
                                 fieldset2 = Ext.getCmp('fieldset2'),
                                 btn = App.formToggleBtn;

                             if (btn.hasDisabled) {
                                 fieldset1.enable();
                                 fieldset2.enable();
                                 btn.hasDisabled = false;
                                 btn.setText('Disable fields');
                             } else {
                                 fieldset1.disable();
                                 fieldset2.disable();
                                 btn.hasDisabled = true;
                                 btn.setText('Enable fields');
                             }">
                    <CustomConfig>
                        <ext:ConfigItem Name="hasDisabled" Value="false" Mode="Raw" />
                    </CustomConfig>
                </ext:Button>
                <ext:Button
                    runat="server"
                    Text="Reset"
                    UI="Action"
                    Handler="Ext.getCmp('basicform').reset();" />
            </Items>
        </ext:Container>
    </Items>
</ext:FormPanel>