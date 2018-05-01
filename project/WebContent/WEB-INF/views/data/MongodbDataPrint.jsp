<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>몽고디비내용 출력</title>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
$(function () { 
    var myChart = Highcharts.chart('container1', {
        chart: {
            type: 'line'
        },
        title: {
            text: '서울지역 총 매출금액(월별)[금액:억원]'
        },
        subtitle: {
            text: 'Modified by 유태선',
            x: -20
        },
        xAxis: {
            categories: ['201611', '201612', '201701', '201702', '201703', '201704', '201705', '201706', '201707', '201708']
        },
        yAxis: {
            title: {
                text: '총 매출 금액'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        series: [{
            name: '서울전체',
            data: [14481,15652,17197,16785,14224,16642,16262,16424,16176,14945]
        }],
        
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        tooltip: {
            valueSuffix: '억원'
        }
    });
});
    
</script>
</head>
<body>
<h2>공공데이터</h2>
<br><br><br>
<div id="container1" style="width:600px; height:400px;"></div>
</body>
</html>