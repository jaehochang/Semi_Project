<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>


<!-- Basic sample for Pie 2D chart -->
<div id="chart-container">연령별 파이 그래프</div>

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
</script>