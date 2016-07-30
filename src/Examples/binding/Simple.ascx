<%@ Control Language="C#" %>

<script runat="server">
    public class SimpleViewModel
    {
        public static object Model = new
        {
            data = new
            {
                title = "ViewModel Title",
                padding = 10,
                content = "This content is defined in the ViewModel. " +
                    "Each bind uses a bind descriptor to specify what data " +
                    "is required from the ViewModel. The title bar uses the " +
                    "defaultBindProperty to bind to one of the most common " +
                    "configurations for that class. This component binds to multiple " +
                    "configurations by specifying each in the bind descriptor."
            }
        };
    }
</script>

<ext:Container
    runat="server"
    Scrollable="Both"
    ViewModel="<%# SimpleViewModel.Model %>"
    AutoDataBind="true">
    <Items>
        <ext:TitleBar runat="server" Docked="Top" BindString="{title}" />
        <ext:Component runat="server">
            <Bind>
                <ext:Parameter Name="html" Value="{content}" />
                <ext:Parameter Name="padding" Value="{padding}" />
            </Bind>
        </ext:Component>
    </Items>
</ext:Container>