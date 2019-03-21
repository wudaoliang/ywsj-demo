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
        _jm.disable_edit();
        $.messager.prompt('新增标签', '请输入标签名', function(r){
            if (r){
                var nodeid = jsMind.util.uuid.newid();
                var topic = r;
                _jm.enable_edit();
                //扩展方法， right 将子节点增加到右侧， left 将子节点增加到左侧，默认右侧
                var node = _jm.add_node(selected_node, nodeid, topic, null, "right");
            }
        });
    }

    function modify_node(){
        var selected_node = _jm.get_selected_node();
        if(!selected_node) {
            alert("请选中节点");
            return;
        }
        _jm.disable_edit();
        $.messager.prompt('编辑标签', '请输入新的标签名', function(r){
            if (r){
                var selected_id = selected_node.id;
                var topic = r;
                _jm.enable_edit();
                _jm.update_node(selected_id, topic);
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
        var topic;
        var node_id;
        var node;
        var pre_node;
        var pre_node_id;
        var next_node;
        var next_node_id;
        var child_nodes;
        var i;
        var direction;

        if(data.evt === "add_node") {
            console.log(JSON.stringify(data));
            var parent_id = data.data[0];
            node_id = data.data[1];
            topic = data.data[2];
            node = {
                "id":node_id,
                "parentid":parent_id,
                "topic":topic,
                "isadded":true
            };
            var parent_node = get_node(parent_id);
            child_nodes = list_all_node_in_root(parent_node);
            if(child_nodes.length > 0) {
                for(i = child_nodes.length - 1; i >= 0; i--) {
                    if(child_nodes[i].parentid === parent_id) {
                        pre_node = child_nodes[i];
                        next_node_id = child_nodes[i].nextNodeId;
                        break;
                    }
                }
            } else {
                pre_node = parent_node;
                next_node_id = parent_node.nextNodeId;
            }
            node.preNodeId = pre_node.id;
            pre_node.nextNodeId = node_id;
            if(!pre_node.isadded) {
                pre_node.ismodified = true;
            }
            if(!next_node_id) {
                mindMapData.push(node);
                //console.log(JSON.stringify(parent_node));
                //console.log(JSON.stringify(node));
                return;
            }
            next_node = get_node(next_node_id);
            next_node.preNodeId = node_id;
            if(!next_node.isadded) {
                next_node.ismodified = true;
            }
            node.nextNodeId = next_node_id;
            mindMapData.push(node);
            //console.log(JSON.stringify(parent_node));
            //console.log(JSON.stringify(node));
            //console.log(JSON.stringify(next_node));
        }

        if(data.evt === "insert_node_after") {
            console.log(JSON.stringify(data));
            pre_node_id = data.data[0];
            node_id = data.data[1];
            topic = data.data[2];

            pre_node = get_node(pre_node_id);
            node = {
                "id":node_id,
                "parentid":pre_node.parentid,
                "preNodeId":pre_node.id,
                "topic":topic,
                "isadded":true
            };
            if(data.data[4] === -1) {
                node.direction = "left";
            }
            var pre_node_next_node_id = pre_node.nextNodeId;
            pre_node.nextNodeId = node_id;
            if(!pre_node.isadded) {
                pre_node.ismodified = true;
            }
            if(!pre_node_next_node_id) {
                mindMapData.push(node);
                console.log(JSON.stringify(pre_node));
                console.log(JSON.stringify(node));
                return;
            }
            var pre_node_next_node = get_node(pre_node_next_node_id);
            pre_node_next_node.preNodeId = node_id;
            if(!pre_node_next_node.isadded) {
                pre_node_next_node.ismodified = true;
            }
            node.nextNodeId = pre_node_next_node_id;
            mindMapData.push(node);
            console.log(JSON.stringify(pre_node));
            console.log(JSON.stringify(node));
            console.log(JSON.stringify(pre_node_next_node));
        }

        if(data.evt === "update_node") {
            console.log(JSON.stringify(data));
            node_id = data.data[0];
            topic = data.data[1];
            node = get_node(node_id);
            node.topic = topic;
            if(!node.isadded) {
                node.ismodified = true;
            }
            console.log(JSON.stringify(node));
        }

        if(data.evt === "remove_node") {
            //console.log(JSON.stringify(data));
            node_id = data.data[0];
            node = get_node(node_id);
            pre_node = get_node(node.preNodeId);
            next_node = get_node(node.nextNodeId);
            var delete_nodes = [node];
            child_nodes = list_all_node_in_root(node);
            if(child_nodes.length > 0) {
                var last_child_node = child_nodes[child_nodes.length - 1];
                next_node = get_node(last_child_node.nextNodeId);
                delete_nodes.push(child_nodes);
            }
            if(!next_node) {
                delete pre_node.nextNodeId;
            } else {
                pre_node.nextNodeId = next_node.id;
                next_node.preNodeId = pre_node.id;
                if(!next_node.isadded) {
                    next_node.ismodified = true;
                }
            }
            if(!pre_node.isadded) {
                pre_node.ismodified = true;
            }
            for(i = 0; i < delete_nodes.length; i++) {
                var delete_node = delete_nodes[i];
                delete_node.isdeleted = true;
                delete_node.isadded = false;
                delete_node.ismodified = false;
            }
            console.log(JSON.stringify(pre_node));
            console.log(JSON.stringify(node));
            console.log(JSON.stringify(next_node));
        }

        if(data.evt === "move_node") {
            console.log(JSON.stringify(data));
            var old_pre_node;
            var old_next_node;
            var old_next_node_id;
            var new_pre_node;
            var new_next_node;
            node_id = data.data[0];
            next_node_id = data.data[1];
            parent_id = data.data[2];
            direction = data.data[3];
            node = get_node(node_id);
            if(direction === 1) {
                node.direction = "right";
            } else if(direction === -1) {
                node.direction = "left";
            }
            if(!node.isadded) {
                node.ismodified = true;
            }
            if(next_node_id === "_last_") {
                parent_node = get_node(parent_id);
                var parent_child_nodes = list_all_node_in_root(parent_node);
                if(parent_child_nodes.length === 0) {
                    new_pre_node = parent_node;
                } else {
                    for(i = parent_child_nodes.length - 1; i >= 0; i--) {
                        var parent_child_node = parent_child_nodes[i];
                        if(parent_child_node.parentid === parent_id) {
                            new_pre_node = parent_child_node;
                            break;
                        }
                    }
                }
                if(new_pre_node.nextNodeId) {
                    new_next_node = get_node(new_pre_node.nextNodeId);
                }
            } else {
                new_next_node = get_node(next_node_id);
                new_pre_node = get_node(new_next_node.preNodeId);
            }
            if(new_pre_node.id === node.id) {
                return;
            }
            child_nodes = list_all_node_in_root(node);
            old_pre_node = get_node(node.preNodeId);
            node.parentid = parent_id;
            node.preNodeId = new_pre_node.id;
            new_pre_node.nextNodeId = node.id;
            if(!new_pre_node.isadded) {
                new_pre_node.ismodified = true;
            }
            if(child_nodes.length === 0) {
                old_next_node_id = node.nextNodeId;
            } else {
                old_next_node_id = child_nodes[child_nodes.length - 1].nextNodeId;
                node = child_nodes[child_nodes.length - 1];
                if(!node.isadded) {
                    node.ismodified = true;
                }
            }
            old_pre_node.nextNodeId = old_next_node_id;
            if(!old_pre_node.isadded) {
                old_pre_node.ismodified = true;
            }
            if(old_next_node_id) {
                old_next_node = get_node(old_next_node_id);
                old_next_node.preNodeId = old_pre_node.id;
                if(!old_next_node.isadded) {
                    old_next_node.ismodified = true;
                }
            }
            if(!new_next_node) {
                delete node.nextNodeId;
            } else {
                node.nextNodeId = new_next_node.id;
                new_next_node.preNodeId = node.id;
                if(!new_next_node.isadded) {
                    new_next_node.ismodified = true;
                }
            }
        }
    }

    $(function(){
        init_mindMapData();
    });

    function list_all_node_in_root(root) {
        var nodes = [];
        var next_node = get_node(root.nextNodeId);
        while(next_node && is_in_this_root(root.id, next_node)) {
            nodes.push(next_node);
            next_node = get_node(next_node.nextNodeId);
        }
        return nodes;
    }

    function is_in_this_root(rootId, node) {
        if(node.parentid === rootId) {
            return true;
        }
        if(node.isroot) {
            return false;
        }
        return is_in_this_root(rootId, get_node(node.parentid));
    }
</script>
</body>
</html>
