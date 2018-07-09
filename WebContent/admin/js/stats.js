FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'scrollColumn2d',
        renderAt: 'chart-container2',
        width: '600',
        height: '400',
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
