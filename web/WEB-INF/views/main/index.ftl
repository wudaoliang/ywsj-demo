<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>业务数据Demo</title>
	    <#include "../header.ftl">
    <style type="text/css">
        html,
        body {
            height: 100%;
            overflow: hidden;
            background-color: #000f1f;
        }
        /*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/

        ::-webkit-scrollbar {
            width: 5px;
            height: 16px;
            background-color: #0f1d2c;
        }
        /*定义滚动条轨道 内阴影+圆角*/

        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            /*border-radius: 10px;*/
            background-color: #0f1d2c;
        }
        /*定义滑块 内阴影+圆角*/

        ::-webkit-scrollbar-thumb {
            /*border-radius: 10px;*/
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
            background-color: #005e80;
        }
        html,body {
            scrollbar-face-color:#005e80; /*滚动条3D表面（ThreedFace）的颜色*/
            scrollbar-highlight-color:#005e80; /*滚动条3D界面的亮边（ThreedHighlight）颜色*/
            scrollbar-shadow-color:#005e80; /*滚动条3D界面的暗边（ThreedShadow）颜色*/
            scrollbar-3dlight-color:#0f1d2c; /*滚动条亮边框颜色*/
            scrollbar-arrow-color:#0f1d2c; /*滚动条方向箭头的颜色 */
            scrollbar-track-color:#0f1d2c; /*滚动条的拖动区域(TrackBar)颜色*/
            scrollbar-darkshadow-color:#005e80; /*滚动条暗边框（ThreedDarkShadow）颜色*/
        }
    </style>
</head>

<body onload="mr_click_load('${(aid)!''}','${(aaid)!''}');">
<div class="top">
    <div class="logo">
        <img src="${base}/medias/image/logo_ybss.jpg" title="工作平台" />
    </div>
    <div class="toptip">
        <p>欢迎您：
            <a href="#">wdl</a>
        </p>
    </div>
</div>
<div class="left_side" id="leftContent">
    <div class="nav_container">
        <ul class="ce">
            <li>
                <a href="${base}/mindMap/getMindMapPage" target="MainIframeR">思维导图</a>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
</div>

<div class="right_content">
    <iframe name="MainIframeR" id="test" frameborder="0" width="100%" height="100%" scrolling="auto" src="">

    </iframe>
</div>

<script type="text/javascript" language="javascript">
    $(function() {
        //初始化菜单内容区域高度
        $(".nav_container").height($(window).height() - 2);
    });
    //页面大小改变时，触发jquery的resize方法，自适应拖拽
    $(window).resize(function() {
        $(".nav_container").height($(window).height() - 2);
    });
    $(function() {
        var flag = 1;
        //初始化尺寸
        $(".right_content").width($(window).width() - $(".left_side").outerWidth());

        $(window).resize(function() {
            if(flag === 1) {
                $(".right_content").width($(window).width() - $(".left_side").outerWidth());
            } else {
                $(".right_content").width($(window).width());
            }
        })

    });

    function mr_click_load(aid,aaid) {
        if(aaid !== ''){
            if( aid !== ''){
                $("#"+aid).trigger("click");
            }else{
                document.getElementById(aaid).click();
            }
        }
    }

    function click_load(aaid) {
        document.getElementById(aaid).click();
    }
</script>
</body>

</html>