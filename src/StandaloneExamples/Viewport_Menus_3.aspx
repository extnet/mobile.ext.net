<%@ Page Language="C#" %>

<script runat="server">
    protected void ShowTopMenu(object sender, DirectEventArgs e)
    {
        X.Viewport.ShowMenu(Direction.Top);

        // A regular approach with ID is also possible
        // X.Viewport.ShowMenu(Direction.Top);
    }

    protected void ShowBottomMenu(object sender, DirectEventArgs e)
    {
        X.Viewport.ShowMenu(Direction.Bottom);
    }

    protected void HideTopMenu(object sender, DirectEventArgs e)
    {
        X.Viewport.HideMenu(Direction.Top);
    }

    protected void HideBottomMenu(object sender, DirectEventArgs e)
    {
        X.Viewport.HideMenu(Direction.Bottom);
    }

    protected void ToggleLeftMenu(object sender, DirectEventArgs e)
    {
        X.Viewport.ToggleMenu(Direction.Left);
    }

    protected void ToggleRightMenu(object sender, DirectEventArgs e)
    {
        X.Viewport.ToggleMenu(Direction.Right);
    }

    protected void HideAllMenus(object sender, DirectEventArgs e)
    {
        X.Viewport.HideAllMenus();
    }

    protected void RemoveLeftMenu(object sender, DirectEventArgs e)
    {
        X.Viewport.RemoveMenu(Direction.Left);
    }

    protected void SetLeftMenu(object sender, DirectEventArgs e)
    {
        var menu = new Ext.Net.Mobile.Menu
        {
            Items =
            {
                new Ext.Net.Mobile.Button("New Left Button 1"),
                new Ext.Net.Mobile.Button("New Left Button 2")
            }
        };

        // Side and Cover settings can be set up on the Menu itself
        X.Viewport.SetMenu(
            menu,
            new MenuConfig
            {
                Side = Direction.Left,
                Cover = true
            });
    }
</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Ext.NET Mobile - Viewport Menus API</title>
</head>
<body>
    <ext:ResourceManager runat="server" />

    <ext:Viewport runat="server">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
        </LayoutConfig>
        <Items>
            <ext:Button runat="server" Text="Show Top Menu" OnDirectTap="ShowTopMenu" />
            <ext:Button runat="server" Text="Show Bottom Menu" OnDirectTap="ShowBottomMenu" />
            <ext:Button runat="server" Text="Hide Top Menu" OnDirectTap="HideTopMenu" />
            <ext:Button runat="server" Text="Hide Bottom Menu" OnDirectTap="HideBottomMenu" />
            <ext:Button runat="server" Text="Toggle Left Menu" OnDirectTap="ToggleLeftMenu" />
            <ext:Button runat="server" Text="Toggle Right Menu" OnDirectTap="ToggleRightMenu" />
            <ext:Button runat="server" Text="Hide All Menus" OnDirectTap="HideAllMenus" />
            <ext:Button runat="server" Text="Remove Left Menu" OnDirectTap="RemoveLeftMenu" />
            <ext:Button runat="server" Text="Set Left Menu" OnDirectTap="SetLeftMenu" />
        </Items>
        <Menus>
            <ext:Menu runat="server" Reveal="true" Side="Top">
                <Items>
                    <ext:Button runat="server" Text="Top Button 1" />
                    <ext:Button runat="server" Text="Top Button 2" />
                </Items>
            </ext:Menu>
            <ext:Menu runat="server" Reveal="true" Side="Right">
                <Items>
                    <ext:Button runat="server" Text="Right Button 1" />
                    <ext:Button runat="server" Text="Right Button 2" />
                </Items>
            </ext:Menu>
            <ext:Menu runat="server" Reveal="true" Side="Bottom">
                <Items>
                    <ext:Button runat="server" Text="Bottom Button 1" />
                    <ext:Button runat="server" Text="Bottom Button 2" />
                </Items>
            </ext:Menu>
            <ext:Menu runat="server" Reveal="true" Side="Left">
                <Items>
                    <ext:Button runat="server" Text="Left Button 1" />
                    <ext:Button runat="server" Text="Left Button 2" />
                </Items>
            </ext:Menu>
        </Menus>
    </ext:Viewport>
</body>
</html>
