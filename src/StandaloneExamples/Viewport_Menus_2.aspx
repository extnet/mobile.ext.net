<%@ Page Language="C#" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Ext.NET Mobile - Viewport Menus</title>
</head>
<body>
    <ext:ResourceManager runat="server" />

    <ext:Viewport runat="server">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
        </LayoutConfig>
        <Items>
            <ext:Button runat="server" Text="Show top menu" Handler="Ext.Viewport.showMenu('top');" />
            <ext:Button runat="server" Text="Show right menu" Handler="Ext.Viewport.showMenu('right');" />
            <ext:Button runat="server" Text="Show bottom menu" Handler="Ext.Viewport.showMenu('bottom');" />
            <ext:Button runat="server" Text="Show left menu" Handler="Ext.Viewport.showMenu('left');" />
        </Items>
        <Menus>
            <ext:Menu runat="server" Side="Top">
                <Items>
                    <ext:Button runat="server" Text="Top Button 1" />
                    <ext:Button runat="server" Text="Top Button 2" />
                </Items>
            </ext:Menu>
            <ext:Menu runat="server" Side="Right">
                <Items>
                    <ext:Button runat="server" Text="Right Button 1" />
                    <ext:Button runat="server" Text="Right Button 2" />
                </Items>
            </ext:Menu>
            <ext:Menu runat="server" Side="Bottom">
                <Items>
                    <ext:Button runat="server" Text="Bottom Button 1" />
                    <ext:Button runat="server" Text="Bottom Button 2" />
                </Items>
            </ext:Menu>
            <ext:Menu runat="server" Side="Left">
                <Items>
                    <ext:Button runat="server" Text="Left Button 1" />
                    <ext:Button runat="server" Text="Left Button 2" />
                </Items>
            </ext:Menu>
        </Menus>
    </ext:Viewport>
</body>
</html>