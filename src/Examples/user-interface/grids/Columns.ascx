<%@ Control Language="C#" %>

<script runat="server">
    public static List<object> Data = new List<object>
    {
        new
        {
            name = "Item 1",
            amount = 1000,
            visible = true,
            duedate = DateTime.Now
        },

        new
        {
            name = "Item 2",
            amount = 500,
            visible = false,
            duedate = DateTime.Now.AddDays(5)
        },

        new
        {
            name = "Item 3",
            amount = 1550,
            visible = false,
            duedate = DateTime.Now.AddMonths(1)
        },

        new
        {
            name = "Item 4",
            amount = 700,
            visible = true,
            duedate = DateTime.Now.AddYears(1)
        }
    };
</script>

<ext:Grid runat="server">
    <Store>
        <ext:Store runat="server" DataSource="<%# Data %>" AutoDataBind="true">
            <Fields>
                <ext:ModelField Name="name" Type="String" />
                <ext:ModelField Name="amount" Type="Int" />
                <ext:ModelField Name="visible" Type="Boolean" />
                <ext:ModelField Name="duedate" Type="Date" />
            </Fields>
        </ext:Store>
    </Store>
    <Columns>
        <ext:Column
            runat="server"
            Text="String"
            DataIndex="name"
            Width="100" />
        <ext:NumberColumn
            runat="server"
            Text="Number"
            DataIndex="amount"
            Width="110" />
        <ext:BooleanColumn
            runat="server"
            Text="Boolean"
            DataIndex="visible"
            Width="110"
            Align="Center" />
        <ext:DateColumn
            runat="server"
            Text="Date"
            DataIndex="duedate"
            Width="150" />
    </Columns>
</ext:Grid>