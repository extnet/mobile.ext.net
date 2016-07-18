App.ColumnChart = {
    onDownload: function () {
        var chart = App.ColumnChart.chart;

        if (Ext.os.is.Desktop) {
            chart.download({
                filename: 'Redwood City Climate Data Chart'
            });
        } else {
            chart.preview();
        }
    },

    onReloadData: function () {
        var chart = App.ColumnChart.chart;

        chart.getStore().refreshData();
    },

    onInitialize: function () {
        Ext.Viewport.on('orientationchange', App.ColumnChart.updateChartTitle, App.ColumnChart);
        App.ColumnChart.updateChartTitle();
    },

    updateChartTitle: function (viewport, orientation, width, height) {
        var chart = App.ColumnChart.chart,
            chartSurface = chart.getSurface('chart'),
            title = chartSurface.getItems()[0];

        width = width || Ext.Viewport.getWindowWidth();

        title.setAttributes({
            hidden: width < 500
        });
    },

    onAfterRender: function () {
        var chart = App.ColumnChart.chart,
            axis = chart.getAxis(0),
            store = chart.getStore();

        function onAxisRangeChange() {
            App.ColumnChart.onAxisRangeChange(axis);
        }

        store.on({
            datachanged: onAxisRangeChange,
            update: onAxisRangeChange
        });
    },

    onAxisRangeChange: function (axis, range) {
        var chart = axis.getChart(),
            store = chart.getStore(),
            sum = 0,
            mean;

        store.each(function (rec) {
            sum += rec.get('highF');
        });

        mean = sum / store.getCount();

        axis.setLimits({
            value: mean,
            line: {
                title: {
                    text: 'Average high: ' + mean.toFixed(2) + '°F'
                },
                lineDash: [2, 2]
            }
        });
    },

    itemAnimationDuration: 0
}