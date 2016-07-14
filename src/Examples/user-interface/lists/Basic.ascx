<%@ Control Language="C#" %>

<script runat="server">
    public object[] people_list {
        get
        {
            var rv = new List<object>();

            for (var x = 1; x < 50; x++)
            {
                rv.Add(new { FirstName = "Firstname" + x, LastName = "Lastname" + x });
            }

            return rv.ToArray();
        }
    }
</script>

<ext:Container runat="server">
    <CustomConfig>
        <ext:ConfigItem Name="layout" Value="Ext.os.deviceType == 'Phone' ? 'fit' : { type: 'vbox', align: 'center', pack:'center' }" Mode="Raw" />
    </CustomConfig>
    <Items>
        <ext:List runat="server">
            <ItemTpl runat="server">
                <Html>{FirstName} {LastName}</Html>
            </ItemTpl>
            <Store>
                <ext:Store runat="server" Data="<%# people_list %>" ID="store1">
                    <Model>
                        <ext:Model runat="server">
                            <Fields>
                                <ext:ModelField Name="FirstName" />
                                <ext:ModelField Name="LastName" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
        </ext:List>
    </Items>
</ext:Container>

