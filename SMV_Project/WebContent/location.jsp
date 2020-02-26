<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
ul {
	/* width : 450px; */
	display: table;
  margin-left: auto;
  margin-right: auto;
}

 li{
  list-style: none
 }
 ol{
  list-style: none
 }
 #li1{
 font-size : 15pt
 text-align : center
 }

</style>
<meta charset="UTF-8">
<title>SMV 즐거운 영화의 시작</title>
 <style>
	html, body {width:100%;height:100%;margin:0 auto;padding:0;} 
	.map_wrap {position:relative;overflow:hidden;width:500px;height:350px; margin :0 auto;}
	.radius_border{border:1px solid #919191;border-radius:5px;}     
	.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
	.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
	.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
	.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
	.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
	.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
	.custom_typecontrol .selected_btn:hover {color:#fff;}   
	.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
	.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
	.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
	.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
</style>
</head>
<body>



<header>
<c:if test = "${!empty user_data }"> 
	<%@ include file="login_head.jsp" %>
</c:if>
<c:if test = "${empty user_data }"> 
	<%@ include file="head.jsp" %>
</c:if>
</header>
       

<div class = "main">

<h1 align="center"> SMV 위치 안내</h1>
<h2 align="center"> 
     [ &nbsp;&nbsp;&nbsp;SMV 위치 안내 입니다.&nbsp;&nbsp;&nbsp; ] <!-- 회사쪽에 회사이름 넣으면 됨 -->
     </h2>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
    <!-- 지도타입 컨트롤 div 입니다 -->
    <div class="custom_typecontrol radius_border">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
    </div>
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
</div>
<br><br><br>
<hr>
<h2>&nbsp;&nbsp;오시는 길 (교통편) </h2>
<br>
<h2>[  지하철  ]</h2>
<ul> 
  <!-- <li id="li1">지하철</li><br> -->
  <li><img src="./images/metro3.png" ><span style="color:orange; font-weight:bold "> 3호선 </span> <strong> 종로3가역</strong> [9번출구] </li>
  <li><img src="./images/metro1.png" ><span style="color:blue; font-weight:bold "> 1호선 </span> <strong> 종로3가역 </strong> [10번출구] </li>  
</ul>

<br>
<h2>[  버스  ]</h2>
<ul>
  <li><strong>종로4가, 종묘</strong></li>
  
  
    <li><span style = "color:blue; font-weight:bold">간선버스 : </span><strong>101, 103, 143, 150, 201, 260, 270, 271, 370, 720, 721</strong></li>
    <li><span style = "color:green; font-weight:bold">지선버스 : </span><strong>7212</strong></li>
    <li><span style = "color:red; font-weight:bold">직행버스 : </span><strong>9301</strong></li>
</ul>
  <br>
  
<ul>
  <li><strong>종로3가, 탑골공원</strong></li>
  
    <li><span style = "color:blue; font-weight:bold">간선버스 : </span><strong>101, 103, 143, 150, 201, 260, 270, 271, 370, 720, 721</strong></li>
    <li><span style = "color:green; font-weight:bold">지선버스 : </span><strong>7212</strong></li>
    <li><span style = "color:red; font-weight:bold">직행버스 : </span><strong>9301</strong></li>
  </ul><br>
</ul>

<br>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d99e3518cb0ffa7434b4b7ed1d7886a8"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.570970, 126.992505), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

var markerPosition  = new kakao.maps.LatLng(37.570970, 126.992505); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:10px;">Hello World!!!!!!!!!!</div>', //Hello World 자리에 회사이름 // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

function setCenter() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.570970, 126.992505);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.570970, 126.992505);
    

    // 지도 중심으로 이동    
    map.panTo(moveLatLon);            
}
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}
</script>
</div>
<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>