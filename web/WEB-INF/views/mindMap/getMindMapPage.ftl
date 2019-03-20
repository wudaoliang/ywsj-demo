<#assign base=request.contextPath/>
<!doctype html>
<html lang="utf-8">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=8">
    <link rel="stylesheet" type="text/css" href="${base}/medias/css/jsmind/style/jsmind.css">
    <link rel="stylesheet" type="text/css" href="${base}/medias/css/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="${base}/medias/css/easyui/themes/icon.css">
</head>

<body>
<div class="easyui-panel" style="padding:5px;">
    <a href="${base}/mindMap/getMindMapPage" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'" onclick="save_mindMap_data()">保存</a>
</div>
<div id="jsmind_container">
</div>

<div id="mm" class="easyui-menu" style="width:120px; z-index:99999">
    <div data-options="iconCls:'icon-add'" onclick="add_node()">新建标签</div>
    <div data-options="iconCls:'icon-edit'" onClick="modify_node()">编辑标签</div>
    <div data-options="iconCls:'icon-remove'" onclick="delete_node()">删除标签</div>
</div>

<div id="win"></div>

<script src="${base}/medias/js/jsmind/jquery-1.4.4.min.js"></script>
<script src="${base}/medias/js/easyui/jquery.easyui.min.js"></script>
<script src="${base}/medias/js/jsmind/jsmind.js" type="text/javascript"></script>
<script src="${base}/medias/js/jsmind/jsmind.draggable.js" type="text/javascript"></script>
<script src="${base}/medias/js/jsmind/jquery.contextmenu.r2.js" type="text/javascript"></script>
<script src="${base}/medias/js/jsmind/html5shiv.js" type="text/javascript"></script>
<script type="text/javascript">
    var _jm = null;
    var mindMapData = null;
    function load_jsmind(){
        var mind = {
            "meta":{
                "name":"demo",
                "author":"hizzgdev@163.com",
                "version":"0.2"
            },
            "format":"node_array",
            "data": mindMapData
        };
        var options = {
            container:'jsmind_container',
            editable:true,
            theme:'primary',
            mode :'full'
        }
        _jm = jsMind.show(options,mind);
    }

    function add_node(){
        var selected_node = _jm.get_selected_node();
        if(!selected_node) {
            alert("请选中节点");
            return;
        }
        $.messager.prompt('新增标签', '请输入标签名', function(r){
            if (r){
                var nodeid = jsMind.util.uuid.newid();
                var topic = r;
                _jm.enable_edit();
                //扩展方法， right 将子节点增加到右侧， left 将子节点增加到左侧，默认右侧
                var node = _jm.add_node(selected_node, nodeid, topic, null, "right");
                //_jm.disable_edit();
            }
        });
    }

    function modify_node(){
        var selected_node = _jm.get_selected_node();
        if(!selected_node) {
            alert("请选中节点");
            return;
        }
        $.messager.prompt('编辑标签', '请输入新的标签名', function(r){
            if (r){
                var selected_id = selected_node.id;
                var topic = r;
                _jm.enable_edit();
                _jm.update_node(selected_id, topic);
                //_jm.disable_edit();
            }
        });
    }

    function delete_node() {
        var selected_node = _jm.get_selected_node();
        if(!selected_node) {
            alert("请选中节点");
            return;
        }
        _jm.enable_edit();
        _jm.remove_node(selected_node);
        //_jm.disable_edit();
    }

    function init_mindMapData() {
        $.ajax({
            type:"POST",
            url:"${base}/mindMap/getMindMapData",
            contentType: "application/json;charset=UTF-8",
            dataType:"JSON",
            success:function (data) {
                mindMapData = JSON.parse(data);
                load_jsmind();
                $("jmnode").live('contextmenu',function(e){
                    e.preventDefault();
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY,
                        hideOnUnhover: false
                    });
                });
                _jm.add_event_listener(event_listener_function);
            },
            error:function () {

            }
        });
    }

    function save_mindMap_data() {
        $.ajax({
            type:"POST",
            url:"${base}/mindMap/saveMindMapData",
            data:JSON.stringify(mindMapData),
            contentType: "application/json;charset=UTF-8",
            dataType:"JSON",
            success:function (data) {
                if(data === '1') {
                    //alert("保存成功");
                    //init_mindMapData();
                } else {
                    //alert("保存失败")
                }
            },
            error:function () {
                //alert("保存失败");
            }
        });
    }

    function get_node(id) {
        for(var i = 0; i < mindMapData.length; i++) {
            if(mindMapData[i].id === id) {
                return mindMapData[i];
            }
        }
    }

    function event_listener_function(type, data) {
        var node_id;
        var topic;
        var node;

        if(data.evt === "add_node") {
            var parent_id = data.data[0];
            node_id = data.data[1];
            topic = data.data[2];
            node = {
                "id":node_id,
                "parentid":parent_id,
                "preNodeId":parent_id,
                "topic":topic,
                "isadded":true
            };
            var parent_node = get_node(parent_id);
            var parent_next_node_id = parent_node.nextNodeId;
            parent_node.nextNodeId = node_id;
            parent_node.ismodified = true;
            if(!parent_next_node_id) {
                mindMapData.push(node);
                console.log(JSON.stringify(parent_node));
                console.log(JSON.stringify(node));
                return;
            }
            var parent_next_node = get_node(parent_next_node_id);
            parent_next_node.preNodeId = node_id;
            parent_next_node.ismodified = true;
            node.nextNodeId = parent_next_node_id;
            mindMapData.push(node);
            console.log(JSON.stringify(parent_node));
            console.log(JSON.stringify(node));
            console.log(JSON.stringify(parent_next_node));
        }

        if(data.evt === "insert_node_after") {
            var pre_node_id = data.data[0];
            node_id = data.data[1];
            topic = data.data[2];
            var pre_node = get_node(pre_node_id);
            node = {
                "id":node_id,
                "parentid":pre_node.parentid,
                "preNodeId":pre_node.id,
                "topic":topic,
                "isadded":true
            };
            var pre_node_next_node_id = pre_node.nextNodeId;
            pre_node.nextNodeId = node_id;
            pre_node.ismodified = true;
            if(!pre_node_next_node_id) {
                mindMapData.push(node);
                console.log(JSON.stringify(pre_node));
                console.log(JSON.stringify(node));
                return;
            }
            var pre_node_next_node = get_node(pre_node_next_node_id);
            pre_node_next_node.preNodeId = node_id;
            pre_node_next_node.ismodified = true;
            node.nextNodeId = pre_node_next_node_id;
            mindMapData.push(node);
            console.log(JSON.stringify(pre_node));
            console.log(JSON.stringify(node));
            console.log(JSON.stringify(pre_node_next_node));
        }

        if(data.evt === "update_node") {
            node_id = data.data[0];
            topic = data.data[1];
            node = get_node(node_id);
            node.topic = topic;
            if(!node.isadded) {
                node.ismodified = true;
            }
        }

        if(data.evt === "remove_node") {
            node_id = data.data[0];
            node = get_node(node_id);
            node.isdeleted = true;
            node.isadded = false;
            node.ismodified = false;
        }

        if(data.evt === "move_node") {
            console.log(JSON.stringify(data.data));
        }
    }

    $(function(){
        init_mindMapData();
    });
</script>
</body>
</html>
