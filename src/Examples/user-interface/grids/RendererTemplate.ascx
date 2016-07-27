<%@ Control Language="C#" %>

<script runat="server">
    public static List<object> Data = new List<object>
    {
        new 
        { 
            name = "Lisa"
        },
        
        new 
        { 
            name = "Bart"  
        },
        
        new 
        { 
            name = "Homer" 
        },
        
        new 
        { 
            name = "Marge" 
        }
    };
</script>

<ext:Grid runat="server" Title="Simpsons">
    <Store>
        <ext:Store runat="server" DataSource="<%# Data %>" AutoDataBind="true">
            <Fields>
                <ext:ModelField Name="name" />
            </Fields>
        </ext:Store>
    </Store>
    <Columns>
        <ext:Column runat="server" Text="Name" DataIndex="name" Width="200">
            <Renderer Handler="return value + ' Simpson';" />
        </ext:Column>

        <ext:Column runat="server" Text="Email" Width="200">
            <Tpl runat="server">
                <Html>
                    {name:lowercase}@simpsons.com
                </Html>
            </Tpl>
        </ext:Column>
    </Columns>
</ext:Grid>