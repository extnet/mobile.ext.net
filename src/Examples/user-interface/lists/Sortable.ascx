<%@ Control Language="C#" %>

<script runat="server">
    public List<object> GetData()
    {
        var data = new List<object>();

        for (int i = 0; i < 5; i++)
        {
            data.Add(new
            {
                name = "Item " + i
            });
        }

        return data;
    }
</script>

<ext:Container runat="server" Layout="VBoxLayout">
    <Items>
        <ext:Component runat="server" Html="Tap a gray square and drag" Margin="10" />

        <ext:List runat="server" Infinite="true" Flex="1">
            <ItemTpl runat="server">
                <Html>
                    <span class="x-list-sortablehandle" style="height: 30px; width: 30px; background-color: gray; float: left;"></span>
                    &nbsp;{name}
                </Html>
            </ItemTpl>
            <Store>
                <ext:Store runat="server" DataSource="<%# this.GetData() %>" AutoDataBind="true">
                    <Model>
                        <ext:Model runat="server">
                            <Fields>
                                <ext:ModelField Name="name" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
            <Plugins>
                <ext:SortableList runat="server" />
            </Plugins>
        </ext:List>
    </Items>
</ext:Container>


