<%@ Control Language="C#" %>

<ext:List runat="server" ScrollToTopOnRefresh="false">
    <ItemTpl runat="server">
        <Html>{Company}, Loaded At: {LastUpdate:date('H:i:s')}</Html>
    </ItemTpl>
    <Store>
        <ext:Store runat="server" PageSize="15">
            <Proxy>
                <ext:AjaxProxy Url="Data/Company.ashx">
                    <Reader>
                        <ext:JsonReader RootProperty="data" />
                    </Reader>
                </ext:AjaxProxy>
            </Proxy>
            <Model>
                <ext:Model runat="server">
                    <Fields>
                        <ext:ModelField Name="Company" />
                        <ext:ModelField Name="LastUpdate" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
    </Store>
    <Plugins>
        <ext:ListPaging runat="server" />
    </Plugins>
</ext:List>