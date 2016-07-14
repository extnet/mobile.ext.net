<%@ Page Language="C#" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Ext.NET Mobile Examples - Basic</title>
</head>
<body>
    <ext:ResourceManager runat="server" />

    <ext:Menu runat="server" Side="Bottom" Reveal="true">
        <Items>
            <ext:Button runat="server" Text="Bottom Button 1" />
            <ext:Button runat="server" Text="Bottom Button 2" />
        </Items>
    </ext:Menu>

    <ext:Menu runat="server" Side="Top" Cover="true">
        <Items>
            <ext:Button runat="server" Text="Top Button 1" />
            <ext:Button runat="server" Text="Top Button 2" />
        </Items>
    </ext:Menu>

    <ext:Viewport runat="server">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
        </LayoutConfig>
        <Items>
            <ext:Button runat="server" Text="Show Bottom Menu" Handler="Ext.Viewport.showMenu('bottom');" />

            <ext:Button runat="server" Text="Show Top Menu" Handler="Ext.Viewport.showMenu('top');" />
        </Items>
    </ext:Viewport>
</body>
</html>
