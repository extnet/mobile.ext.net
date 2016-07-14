<%@ Control Language="C#" %>

<script runat="server">
    public class SimpleViewModel
    {
        public static object data = new
        {
            title = "ViewModel Title",
            padding = 10,
            content = "This content is defined in the ViewModel. " +
                "Each bind uses a bind descriptor to specify what data " +
                "is required from the ViewModel. The title bar uses the " +
                "defaultBindProperty to bind to one of the most common " +
                "configurations for that class. This component binds to multiple " +
                "configurations by specifying each in the bind descriptor."
        };
    }
</script>

<script type="text/javascript">
    var viewModelData = {
        title: 'ViewModel Title',
        padding: 10,
        content: [
                'This content is defined in the ViewModel. ',
                'Each bind uses a bind descriptor to specify what data ',
                'is required from the ViewModel. The title bar uses the ',
                'defaultBindProperty to bind to one of the most common ',
                'configurations for that class. This component binds to multiple ',
                'configurations by specifying each in the bind descriptor.'
        ].join('')
    };
</script>

<ext:Container runat="server" Scrollable="Both">
    <CustomConfig>
        <%-- FIXME: I should look nice as the JavaScript block above. Not golfed like this. --%>
        <ext:ConfigItem Name="viewModel"
            Value="{ data: { title: 'ViewModel Title', padding: 10, content: 'This content is defined in the ViewModel. Each bind uses a bind descriptor to specify what data is required from the ViewModel. The title bar uses the defaultBindProperty to bind to one of the most common configurations for that class. This component binds to multiple configurations by specifying each in the bind descriptor.' } }"
            Mode="Raw" />
    </CustomConfig>
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