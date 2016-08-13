<%@ Control Language="C#" %>

<script runat="server">
    public static List<object> Data = new List<object>
    {
        new
        {
            name = "Lisa",
            email = "lisa@simpsons.com",
            phone = "555-111-1224"
        },

        new
        {
            name = "Bart",
            email = "bart@simpsons.com",
            phone = "555-222-1234"
        },

        new
        {
            name = "Homer",
            email = "homer@simpsons.com",
            phone = "555-222-1244"
        },

        new
        {
            name = "Marge",
            email = "marge@simpsons.com",
            phone = "555-222-1254"
        }
    };
</script>

<ext:Grid runat="server" Title="Simpsons">
    <Store>
        <ext:Store runat="server" DataSource="<%# Data %>" AutoDataBind="true">
            <Fields>
                <ext:ModelField Name="name" />
                <ext:ModelField Name="email" />
                <ext:ModelField Name="phone" />
            </Fields>
        </ext:Store>
    </Store>
    <Columns>
        <ext:Column runat="server" Text="Name" DataIndex="name" Width="100" />
        <ext:Column runat="server" Text="Email" DataIndex="email" Width="210" />
        <ext:Column runat="server" Text="Phone" DataIndex="phone" Width="150" />
    </Columns>
</ext:Grid>