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

    [DirectMethod]
    public string GetServerSideFileContents(string file)
    {
        return Ext.Net.Examples.Mobile.Class.GetFileContents.JsAndHTMLFriendly(file);
    }
</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Ext.NET Mobile Examples</title>

    <link rel="stylesheet" type="text/css" href="/resources/css/KitchenSink-all.css" />

    <script src="resources/js/classes/StoreDemos.js?v=7"></script>
    <script src="resources/js/classes/SourceOverlay.js?v=3"></script>

    <script src="resources/js/main.js?v=1"></script>

    <style>
        .links-menu {
            background-color: #2a333c;
        }

            .links-menu a {
                color: #b0bcc7;
                text-decoration: none;
            }
    </style>

    <script>
        Ext.dataview.NestedList.override({
            doBack: function (me, node, lastActiveList, detailCardActive) {
                var layout = me.getLayout(),
                    animation = layout ? layout.getAnimation() : null;

                if (detailCardActive && lastActiveList) {
                    if (animation) {
                        animation.setReverse(true);
                    }

                    me.goToNode(node.parentNode); // This replaces the commented out code below

                    // This doesn't work as expected causing wrong navigation
                    // if a sample is opened via a direct link
                    // me.setActiveItem(lastActiveList);
                    // me.setLastNode(node.parentNode);
                    // me.syncToolbar();
                } else {
                    me.goToNode(node.parentNode);
                }
            }
        });
    </script>
</head>
<body>
    <ext:ResourceManager runat="server" />

    <ext:Menu
        ID="LinksMenu"
        runat="server"
        Side="Right"
        Cls="links-menu"
        WidthSpec="40%">
        <Items>
            <ext:Component runat="server" Html="<a href='http://ext.net'>Ext.NET Home</a>" />
            <ext:Component runat="server" Html="<a href='http://forums.ext.net'>Forums</a>" />
            <ext:Component runat="server" Html="<a href='http://ext.net/download'>Download</a>" />
        </Items>
    </ext:Menu>

    <ext:NestedList
        ID="MainNestedList"
        runat="server"
        UseTitleAsBackText="false"
        StoreID="Demos"
        Title="Ext.NET Mobile"
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

                <ext:Button
                    ID="MenuButton"
                    runat="server"
                    Align="Right"
                    IconCls="x-fa fa-navicon"
                    MarginSpec="0 0 0 5" />
            </Items>
        </Toolbar>
    </ext:NestedList>
</body>
</html>
