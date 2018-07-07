FusionCharts.ready(function () {
    var ageGroupChart = new FusionCharts({
        type: 'pie2d',
        renderAt: 'chart-container',
        width: '600',
        height: '400',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "Split of Visitors by Age Group",
                "subCaption": "Last year",
                "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                "bgColor": "#ffffff",
                "showBorder": "0",
                "use3DLighting": "0",
                "showShadow": "0",
                "enableSmartLabels": "0",
                "startingAngle": "0",
                "showPercentValues": "1",
                "showPercentInTooltip": "0",
                "decimals": "1",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "subcaptionFontBold": "0",
                "toolTipColor": "#ffffff",
                "toolTipBorderThickness": "0",
                "toolTipBgColor": "#000000",
                "toolTipBgAlpha": "80",
                "toolTipBorderRadius": "2",
                "toolTipPadding": "5",
                "showHoverEffect":"1",
                "showLegend": "1",
                "legendBgColor": "#ffffff",
                "legendBorderAlpha": '0',
                "legendShadow": '0',
                "legendItemFontSize": '10',
                "legendItemFontColor": '#666666'
            },
            "data": [
                {
                    "label": "10대",
                    "value": "100"
                }, 
                {
                    "label": "20대",
                    "value": "200"
                }, 
                {
                    "label": "30대",
                    "value": "250"
                }, 
                {
                    "label": "40대",
                    "value": "50"
                },
                {
                    "label": "50대 이상",
                    "value": "20"
                }
            ]
        }
    }).render();
});

FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'scrollColumn2d',
        renderAt: 'chart-container2',
        width: '550',
        height: '350',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "Sales Trends",
                "subcaption": "2016 - 2017",
                "xaxisname": "젠장",
                "yaxisname": "에라이",
                "showvalues": "1",
                "placeValuesInside" : "1",
                "rotateValues": "1",
                "valueFontColor" : "#ffffff",
                "numberprefix": "",
                
                //Cosmetics
                "baseFontColor" : "#333333",
                "baseFont" : "Helvetica Neue,Arial",
                "captionFontSize" : "14",
                "subcaptionFontSize" : "14",
                "subcaptionFontBold" : "0",
                "showborder": "0",
                "paletteColors" : "#0075c2",
                "bgcolor": "#FFFFFF",
                "showalternatehgridcolor": "0",
                "showplotborder": "0",
                "labeldisplay": "WRAP",
                "divlinecolor": "#CCCCCC",
                "showcanvasborder": "0",
                "linethickness": "3",
                "plotfillalpha": "100",
                "plotgradientcolor": "",
                "numVisiblePlot" : "12",
                "divlineAlpha" : "100",
                "divlineColor" : "#999999",
                "divlineThickness" : "1",
                "divLineIsDashed" : "1",
                "divLineDashLen" : "1",
                "divLineGapLen" : "1",
                "scrollheight" : "10",
                "flatScrollBars" : "1",
                "scrollShowButtons" : "0",
                "scrollColor" : "#cccccc",
                "showHoverEffect" : "1",
            },
            "categories": [
                {
                    "category": [
                        { "label": "Jan 2016" },
                        { "label": "Feb 2016" },
                        { "label": "Mar 2016" },
                        { "label": "Apr 2016" },
                        { "label": "May 2016" },
                        { "label": "Jun 2016" },
                        { "label": "Jul 2016" },
                        { "label": "Aug 2016" },
                        { "label": "Sep 2016" },
                        { "label": "Oct 2016" },
                        { "label": "Nov 2016" },
                        { "label": "Dec 2016" },
                        { "label": "Jan 2017" }, 
                        { "label": "Feb 2017" }, 
                        { "label": "Mar 2017" }, 
                        { "label": "Apr 2017" }, 
                        { "label": "May 2017" }, 
                        { "label": "Jun 2017" }, 
                        { "label": "Jul 2017" }, 
                        { "label": "Aug 2017" }, 
                        { "label": "Sep 2017" }, 
                        { "label": "Oct 2017" }, 
                        { "label": "Nov 2017" }, 
                        { "label": "Dec 2017" }
                    ]
                }
            ],
            "dataset": [
                {
                    "data": [
                        { "value": "27" },
                        { "value": "29" },
                        { "value": "25" },
                        { "value": "26" },
                        { "value": "29" },
                        { "value": "32" },
                        { "value": "31" },
                        { "value": "36" },
                        { "value": "29" },
                        { "value": "31" },
                        { "value": "34" },
                        { "value": "24" },
                        { "value": "26" },
                        { "value": "31" },
                        { "value": "30" },
                        { "value": "33" },
                        { "value": "36" },
                        { "value": "32" },
                        { "value": "37" },
                        { "value": "38" },
                        { "value": "35" },
                        { "value": "38" },
                        { "value": "33" },
                        { "value": "38" }
                    ]
                }
            ]
        }
    });
    
    revenueChart.render();
});
