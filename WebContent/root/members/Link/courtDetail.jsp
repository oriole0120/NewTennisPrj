
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcCourtDao"%>
<%@page import="com.htmtennis.prj.model.Court"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	
	String code = request.getParameter("c");
	Court ct = new JdbcCourtDao().getCourt(code);
	pageContext.setAttribute("ct", ct);
		
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../../js/map.js"></script>
    
    <script type="text/javascript" src="../../js/modernizr.js"></script>
    <link href="css/bind.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript">
	
	var MarkersArray = [];
	var Coordinates= [];
	var travelPathArray = [];
	var map;

	function initialize() {
	  var myLatlng = new google.maps.LatLng(37.5651, 126.98955);
	  var myOptions = {
	  zoom: 10,
	  center: myLatlng,
	  mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	google.maps.event.addListener(map, 'click', function(event) { 
	  var marker = new google.maps.Marker({ 
	  position: event.latLng, 
	  map: map,
	  title: '위치마커'
	});
	attachMessage(marker, event.latLng); 
	//선을 그리기 위해 좌표를 넣는다.
	Coordinates.push( event.latLng ); 
	//마커 담기
	MarkersArray.push(marker);
	        //array에 담은 위도,경도 데이타를 가지고 동선 그리기
	flightPath();
	});
	}

	//해당 위치에 주소를 가져오고, 마크를 클릭시 infowindow에 주소를 표시한다.
	function attachMessage(marker, latlng) {
	geocoder = new google.maps.Geocoder();
	 geocoder.geocode({'latLng': latlng}, function(results, status) {
	     if (status == google.maps.GeocoderStatus.OK) {
	if (results[0]) {
	var address_nm = results[0].formatted_address;
	var infowindow = new google.maps.InfoWindow(
	     { content: address_nm,
	size: new google.maps.Size(50,50)
	     });
	 google.maps.event.addListener(marker, 'click', function() {
	   infowindow.open(map,marker);
	 });
	}
	     } else {
	alert('주소 가져오기 오류!'); 
	     }
	});
	}

	//동선그리기
	function flightPath(){
	for (i in travelPathArray){
	travelPathArray[i].setMap(null);
	}
	var flightPath = new google.maps.Polyline({
	path: Coordinates,
	strokeColor: "#FF0000",
	strokeOpacity: 0.3,
	strokeWeight: 2
	});
	flightPath.setMap(map);
	travelPathArray.push(flightPath);
	}

	</script>
    
    
</head>

<style type="text/css">
        html, body {
          height: 100%;
          margin: 0;
          padding: 0;
        }
 
        #map-canvas, #map_canvas {
          height: 100%;
        }
 
        @media print {
          html, body {
            height: auto;
          }
 
          #map_canvas {
            height: 650px;
          }
        }
 
        #panel {
          position: absolute;
          top: 5px;
          left: 50%;
          margin-left: -180px;
          z-index: 5;
          background-color: #fff;
          padding: 5px;
          border: 1px solid #999;
        }
    </style>

<body onload="initialize()">
   <!-- header -->
    <jsp:include page="../../inc/header.jsp"></jsp:include>

    <div id="body">
        <div class="content-wrapper clearfix">
        
        	<!-- aside -->
            <jsp:include page="../../inc/aside.jsp"></jsp:include>


            <main id="main">
                <!--<h2 id="main-title">Link</h2>-->


                <div class="text-center space-top">
                    <div class="wrapper">
                        <div class="main-item">
                            <!--<h3>영상게시물 검색폼</h3>-->
                            <form>
                                <fieldset>
                                    <a>지도를 클릭하시면 서울 및 지역구별 검색을 할수 있습니다</a>
                                    <input class="input-normal" type="text" name="query" />
                                    <input class="btn btn-search" type="submit" value="검색" />
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="space-top">
                    <table class="board-tabled text-center">
                        <thead>
                            <tr class="board-rowd">
                                <th class="board-cell-thd board-cell-width-60d  text-center"><a href="">번호</a></th>
                                <th class="board-cell-thd board-cell-width-140d  text-center"><a href="">이름</a></th>
                                <th class="board-cell-thd board-cell-width-270d  text-center"><a href="">주소</a></th>
                                <th class="board-cell-thd board-cell-width-100d  text-center"><a href="">전화번호</a></th>
                                <th class="board-cell-th board-cell-width-100d text-center"><a href="">사이트</a></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="board-rowd">
                                <th class="board-celld board-cell-width-60d">${ct.code}</th>
                                <th class="board-celld board-cell-width-140d">${ct.name}</th>
                                <th class="board-celld board-cell-width-270d">${ct.address}</th>
                                <th class="board-celld board-cell-width-100d">${ct.phoneNumber}</th>
                                <th class="board-cell-th board-cell-width-100d">${ct.site}</th>
                            </tr>
                        </tbody>

                    </table>
                </div>

                <div id="map_canvas" class="text-center" style="width:500px; height:300px;"></div>
                <div id="map_addr">
                
                </div>
            </main>



        </div>
    </div>



    <footer id="footer">
        <!--  footer part  -->
        <div class="content-wrapper clearfix">

            <div id="logo-footer-container">
                <h2><img src="../../images/logo_m.png" alt="동아리정보" /></h2>
            </div>

            <div id="company-info-container">
                <div id="company-info">
                    <h3 class="hidden">동아리정보</h3>
                    <dl class="clearfix">
                        <dt class="company-info-item item-title item-newline"> 주소</dt>
                        <dd class="company-info-item item-data">서울특별시 성북구 삼선교로 16길 116</dd>
                        <dt class="company-info-item item-title">연락처</dt>
                        <dd class="company-info-item item-data">02-760-5528</dd>

                        <dt class="company-info-item item-title item-newline">관리자메일</dt>
                        <dd class="company-info-item item-data">oriole0120@naver.com</dd>
                        <dt class="company-info-item item-title">회장</dt>
                        <dd class="company-info-item item-data">###</dd>
                        <dt class="company-info-item item-title">HTM</dt>
                        <dd class="company-info-item item-data">[Hansung Tennis Membership]</dd>
                    </dl>
                </div>

                <div id="copyright">
                    <h3 class="hidden">저작권정보</h3>
                    <p>Copyright@chanCompany 2015</p>
                </div>
            </div>
        </div>

    </footer>

</body>
</html>