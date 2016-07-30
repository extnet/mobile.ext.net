<%@ Control Language="C#" %>

<%@ Import Namespace="Ext.Net.Mobile.Examples.Models.KitchenSink" %>

<script runat="server">
    private void bleh()
    {

    }
</script>

<ext:FormPanel runat="server" ID="FormPanel">
    <CustomConfig>
        <ext:ConfigItem Name="viewModel"
            Value="{
                stores: {
                    countries: App.CountriesStore,
                    states: App.StatesStore
                }
            }"
            Mode="Raw" />
        <ext:ConfigItem Name="ReferenceHolder" Value="true" Mode="Raw" />
    </CustomConfig>
    <Bin>
        <ext:Store runat="server" ID="CountriesStore" Data="<%# Countries.Get() %>" />
        <%-- Seems the only way to bind a store with filters is by 'extending' it. --%>
        <ext:Store runat="server" ID="StatesStore" Data="<%# States.GetAll() %>">
            <Filters>
                <%-- FIXME: This should, somehow, be defined inside the viewModel block in order to work. --%>
                <%--<ext:DataFilter Property="CountryId" Value="{countryField.selection.data.Id}" />--%>
            </Filters>
        </ext:Store>
    </Bin>
    <Items>
        <ext:FieldSet runat="server"
            Instructions="'The states store contains all states, however it filters based upon the id of the selected record in the country field.">
            <Items>
                <ext:SelectField runat="server"
                    Label="Country"
                    Reference="countryField"
                    ValueField="Id"
                    DisplayField="Name">
                    <Bind>
                        <ext:Parameter Name="store" Value="{countries}" />
                    </Bind>
                </ext:SelectField>
                <ext:SelectField runat="server"
                    Label="States"
                    PlaceHolder="Choose a country"
                    ValueField="Id"
                    DisplayField="Name">
                    <Bind>
                        <ext:Parameter Name="store" Value="{states}" />
                        <%-- Complains about missing setFilters method if used. --%>
                        <%--<ext:Parameter Name="filters"
                            Value="{ property: 'CountryId', value: '1' }"
                            Mode="Raw" />--%>
                    </Bind>
                </ext:SelectField>
            </Items>
        </ext:FieldSet>
    </Items>
</ext:FormPanel>