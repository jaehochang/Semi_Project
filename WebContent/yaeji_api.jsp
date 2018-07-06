<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=hTfZ8LBKYtX1MfWBN1fK&submodules=geocoder">


    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72bc28de313df7398364bb8371a65642"></script>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKxwlQzLFSDHDwe0Wf_J9bmYrGNxC-R-E
&callback=initMap">


    </script>
    <style>
        div {
            border: 1px dotted black;
            box-sizing: border-box;
            float: left;
        }

        #naverMap {
            width: 400px;
            height: 300px;
            margin: auto;
            margin-right: 50PX;
        }

        #daumMap {
            width: 400px;
            height: 300px;
            margin: auto;
            margin-right: 50PX;
        }

        #googleMap {
            width: 400px;
            height: 300px;
            margin: auto;
        }

    </style>
</head>

<body>
    <div id="naverMap"></div>
    <div id="daumMap"></div>
    <div id="googleMap"></div>
    <script>
        var mapOptions = {
            zoomControl: true,
            zoomControlOptions: {
                style: naver.maps.ZoomControlStyle.SMALL,
                position: naver.maps.Position.TOP_RIGHT
            },
            center: new naver.maps.LatLng(37.3595704, 127.105399),
            zoom: 10,
            mapTypeControl: true,
            mapTypeControlOptions: {
                style: naver.maps.MapTypeControlStyle.DROPDOWN
            }
        };

        var map = new naver.maps.Map('naverMap', mapOptions);

        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.3595704, 127.105399),
            map: map
        })



        ///////////////// 다음 지도

        var mapContainer = document.getElementById('daumMap'), // 지도를 표시할 div 
            mapOption = {
                center: new daum.maps.LatLng(37.3595704, 127.105399), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new daum.maps.Map(mapContainer, mapOption);

        //////////////// 구글맵

        function initMap() {
            map = new google.maps.Map(document.getElementById('googleMap'), {
                center: {
                    lat: 37.3595704,
                    lng: 127.105399
                },
                zoom: 8
            });
        }

    </script>
</body>

</html>