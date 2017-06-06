<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <title>百度地图API自定义地图</title>
    <!--引用百度地图API-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=UsOl1I3DwUUGFjODBMM9DvnAWsxfnPpz"></script>
    <script type="text/javascript" src="/js/RichMarker_min.js"></script>
</head>

<body>
<!--百度地图容器-->
<div style="width:100%;height:800px;border:#ccc solid 1px;font-size:12px" id="map"></div>
</body>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMapOverlay();//向地图添加覆盖物
        addAdvancedMarker();
        addAdvancedInfo();
    }
    //创建地图
    function createMap(){
        map = new BMap.Map("map");
        map.centerAndZoom(new BMap.Point(119.869822,31.402828),15);
    }
    //设置地图事件
    function setMapEvent(){
        map.enableScrollWheelZoom(); //开启鼠标滚轮缩放
        map.enableKeyboard();
        map.enableDragging();
        map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
        target.addEventListener("click",function(){
            target.openInfoWindow(window);
        });
    }
    function addMapOverlay(){
    }
    //向地图添加控件
    function addMapControl(){
        var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        scaleControl.setUnit(BMAP_UNIT_METRIC);
        map.addControl(scaleControl);
        var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:0});
        map.addControl(navControl);
    }

    function addAdvancedMarker(){
        var htm1 = "<div id='overLay' style='width:93px;height:116px;background:url(images/back.png) left top no-repeat; position: absolute;'>"
                +      "<img style='margin-left:9px;margin-top: 8px;' src='images/small.jpg' />"
                + "</div>",
            myRichMarker1 = new BMapLib.RichMarker(htm1,  new BMap.Point(119.879822,31.422828),{
                "anchor" : new BMap.Size(-47, -116),
                "enableDragging" : false});
        map.addOverlay(myRichMarker1);


        var html2 = '<div style="position: absolute; margin: 0pt; padding: 0pt; width: 80px; height: 26px; left: -10px; top: -35px; overflow: hidden;">'
                +     '<img id="rm3_image" style="border:none;left:0px; top:0px; position:absolute;" src="images/back1.png">'
                + '</div>'
                + '<label class=" BMapLabel" unselectable="on" style="position: absolute; -moz-user-select: none; display: inline; cursor: inherit; border: 0px none; padding: 2px 1px 1px; white-space: nowrap; font: 12px arial,simsun; z-index: 80; color: rgb(255, 102, 0); left: 15px; top: -35px;">$ 20 B</label>',
            myRichMarker2 = new BMapLib.RichMarker(html2,  new BMap.Point(119.859822,31.412828),{
                "anchor" : new BMap.Size(-18, -27),
                "enableDragging" : false});
        map.addOverlay(myRichMarker2);
        myRichMarker2.addEventListener("onmouseover", function(e) {
            document.getElementById("rm3_image").src = "images/back2.png";
        });
        myRichMarker2.addEventListener("onmouseout", function(e) {
            document.getElementById("rm3_image").src = "images/back1.png";
        });


        var sContent =
            "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>天安门</h4>" +
            "<img style='float:right;margin:4px' id='imgDemo' src='http://app.baidu.com/map/images/tiananmen.jpg' width='139' height='104' title='天安门'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>天安门坐落在中国北京市中心,故宫的南侧,与天安门广场隔长安街相望,是清朝皇城的大门...</p>" +
            "</div>";

        var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象

        myRichMarker2.addEventListener("click", function(){
            map.openInfoWindow(infoWindow);
        });

    }

    function addAdvancedInfo(){
        // 百度地图API功能
        var sContent =
            "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>天安门</h4>" +
            "<img style='float:right;margin:4px' id='imgDemo' src='http://app.baidu.com/map/images/tiananmen.jpg' width='139' height='104' title='天安门'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>天安门坐落在中国北京市中心,故宫的南侧,与天安门广场隔长安街相望,是清朝皇城的大门...</p>" +
            "</div>";
        var point = new BMap.Point(119.898722,31.428228);
        var marker = new BMap.Marker(point);
        var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
        map.centerAndZoom(point, 15);
        map.addOverlay(marker);
        marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        marker.addEventListener("click", function(){
            this.openInfoWindow(infoWindow);
        });
    }

    var map;
    initMap();
</script>
</html>