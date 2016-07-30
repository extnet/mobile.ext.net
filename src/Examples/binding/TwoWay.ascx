<%@ Control Language="C#" %>

<script runat="server">
    public class TwoWayViewModel
    {
        public static object Model = new
        {
            data = new
            {
                title = "Default Title"
            }
        };
    }
</script>

<ext:FormPanel
    ID="FormPanel1"
    runat="server"
    ViewModel="<%# TwoWayViewModel.Model %>"
    AutoDataBind="true">
    <Items>
        <ext:TitleBar runat="server" Docked="Top" BindString="{title}">
            <Items>
                <ext:Button runat="server" Text="Random Title" Handler="makeRandomTitle();" />
            </Items>
        </ext:TitleBar>
        <ext:FieldSet
            runat="server"
            Instructions="Change the text field which will alter the title bar text using binding. The random title button sets the title on the ViewModel, which is propagated to both the field and the title bar text.">
            <Items>
                <ext:TextField runat="server" Label="Title" BindString="{title}" />
            </Items>
        </ext:FieldSet>
    </Items>
    <HtmlBin>
        <script type="text/javascript">
            var makeRandomTitle = function (viewModel) {
                App.FormPanel1.getViewModel().set('title', 'Title ' + Ext.Number.randomInt(0, 1000));
            };
        </script>
    </HtmlBin>
</ext:FormPanel>