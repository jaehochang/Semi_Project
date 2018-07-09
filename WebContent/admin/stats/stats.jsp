<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>


<!-- Basic sample for Pie 2D chart -->
<div id="chart-container" style=" margin-top:100px; margin-left:150px; float: left;" >연령별 파이 그래프</div>
<div id="chart-container2"style=" margin-top:100px; margin-left:50px; float: left;">연령별 파이 그래프</div>

<script>
FusionCharts.ready(function () {
    var ageGroupChart = new FusionCharts({
        type: 'pie2d',
        renderAt: 'chart-container',
        width: '600',
        height: '400',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "연령별 회원",
                "subCaption": "",
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
                    "value": ${adto.ten}
                }, 
                {
                    "label": "20대",
                    "value": ${adto.twenty}
                }, 
                {
                    "label": "30대",
                    "value": ${adto.thirty}
                }, 
                {
                    "label": "40대",
                    "value": ${adto.forty}
                },
                {
                    "label": "50대 이상",
                    "value": ${adto.fifty}
                }
            ]
        }
    }).render();
});

FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'scrollColumn2d',
        renderAt: 'chart-container2',
        width: '600',
        height: '400',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "관심사",
                "subcaption": "",
                "xaxisname": "카테고리",
                "yaxisname": "인원",
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
                        { "label": "여행" },
                        { "label": "영화" },
                        { "label": "소프트웨어" },
                        { "label": "게임" },
                        { "label": "강아지" },
                        { "label": "사진" },
                        { "label": "음악" },
                        { "label": "동물" },
                        { "label": "캠핑" },
                        { "label": "경영" },
                        { "label": "메이크업" },
                        { "label": "자기탐색" },
                        { "label": "봉사활동" }, 
                        { "label": "교육" }, 
                        { "label": "문화" }, 
                        { "label": "스포츠" }, 
                        { "label": "운동" }, 
                        { "label": "가족" }, 
                        { "label": "부동산" }, 
                        { "label": "독서" }, 
                        { "label": "기술" }, 
                        { "label": "건강" }, 
                        { "label": "피트니스" }, 
                        { "label": "학습" }
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

</script>

