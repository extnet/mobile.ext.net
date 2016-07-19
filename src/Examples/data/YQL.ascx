<%@ Control Language="C#" %>

<%-- Demonstrates using YQL to fetch data from remote sources (in this case loading from the Sencha blog) --%>
<ext:Container runat="server" Scrollable="Both">
    <Items>
        <ext:Panel runat="server" ID="YQL" StyleHtmlContent="true" />
        <ext:Toolbar runat="server" Docked="Top">
            <Items>
                <ext:Button runat="server" Text="Load using YQL" Handler="loadYQL();" />
            </Items>
        </ext:Toolbar>
    </Items>
    <HtmlBin>
        <script type="text/javascript">
            Ext.YQL = {
                useAllPublicTables: true,
                yqlUrl: 'http://query.yahooapis.com/v1/public/yql',
                request: function (cfg) {
                    var p = cfg.params || {};
                    p.q = cfg.query;
                    p.format = 'json';
                    if (this.useAllPublicTables) {
                        p.env = 'store://datatables.org/alltableswithkeys';
                    }

                    Ext.data.JsonP.request({
                        url: this.yqlUrl,
                        callbackKey: 'callback',
                        params: p,
                        callback: cfg.callback,
                        scope: cfg.scope || window
                    });
                }
            };

            var loadYQL = function () {
                var panel = App.YQL,
                    tpl = new Ext.XTemplate([
                        '<tpl for="item">',
                            '<div class="blog-post">',
                                '<h3><a href="{link}" target="_blank">{title}</a></h3>',
                                '<p>{description}</p>',
                            '</div>',
                        '</tpl>'
                    ]);

                panel.getParent().setMasked({
                    xtype: 'loadmask',
                    message: 'Loading...'
                });

                Ext.YQL.request({
                    query: "select * from rss where url='http://feeds.feedburner.com/sencha' limit 5",
                    callback: function (success, response) {
                        if (success && response.query && response.query.results) {
                            panel.setHtml(tpl.apply(response.query.results));
                        }
                        else {
                            Ext.Msg.alert('Error', 'There was an error retrieving the YQL request.', Ext.emptyFn);
                        }

                        panel.getParent().unmask();
                    }
                });
            };
        </script>
    </HtmlBin>
</ext:Container>