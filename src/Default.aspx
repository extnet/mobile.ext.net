<%@ Page Language="C#" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!X.IsAjaxRequest)
        {
            // Preloading for smoother loading of Charts and Draw components
            ResourceManager.RegisterControlResources<DrawContainer>();
        }
    }

    [DirectMethod]
    public string GetView(string viewName)
    {
        var path = @"~\Examples\";

        viewName = viewName.Remove(0, "KitchenSink.view.".Length);
        viewName = viewName.Replace(".", @"\");
        path = String.Concat(path, viewName, ".ascx");

        return ComponentLoader.ToConfig(path);
    }
</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Ext.NET Mobile Examples</title>

    <link rel="stylesheet" type="text/css" href="/resources/css/KitchenSink-all.css" />

    <script src="resources/js/classes/StoreDemos.js?v=5"></script>
    <script src="resources/js/classes/SourceOverlay.js?v=1"></script>

    <script src="resources/js/main.js"></script>
</head>
<body>
    <ext:ResourceManager runat="server" />

    <ext:NestedList
        ID="MainNestedList"
        runat="server"
        UseTitleAsBackText="false"
        StoreID="Demos"
        Title="Kitchen Sink"
        TemplateWidget="true">
        <Toolbar
            ID="MainNavigationBar"
            runat="server"
            Docked="Top">
            <Items>
                <ext:Button
                    ID="ViewSourceButton"
                    runat="server"
                    Hidden="true"
                    Align="Right"
                    UI="Action"
                    Text="Source" />
            </Items>
        </Toolbar>
    </ext:NestedList>
</body>
</html>
