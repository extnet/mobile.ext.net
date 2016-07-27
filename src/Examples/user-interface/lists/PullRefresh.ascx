<%@ Control Language="C#" %>

<ext:List runat="server">
    <ItemTpl runat="server">
        <Html>{Company}, Server Time: {LastUpdate:date('H:i:s')}</Html>
    </ItemTpl>
    <Store>
        <ext:Store runat="server">
            <Proxy>
                <ext:AjaxProxy Url="Data/Company.ashx">
                    <Reader>
                        <ext:JsonReader RootProperty="data" />
                    </Reader>
                    <ExtraParams>
                        <ext:Parameter Name="count" Value="50" Mode="Raw" />
                    </ExtraParams>
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
        <ext:PullRefresh runat="server" LastUpdatedDateFormat="yyyy-MM-dd HH:mm:ss" />
    </Plugins>
</ext:List>

