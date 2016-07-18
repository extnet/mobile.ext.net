<%@ Control Language="C#" %>

<%@ Implements Interface="Ext.Net.Mobile.IDynamicUserControl" %>

<script runat="server">
    public void BeforeRender()
    {
        var panel = Ext.Net.Utilities.ControlUtils.FindChildControl<Ext.Net.Mobile.Panel>(this);

        panel.Items.Add(new GenericComponent<DrawContainer>
        {
            GenericXType = "vicon",
        });
    }
</script>

<ext:Panel runat="server" Layout="FitLayout">
    <ResourceItems>
        <ext:ClientResourceItem Path="resources/js/examples/vectoricons.js" />
    </ResourceItems>
</ext:Panel>
