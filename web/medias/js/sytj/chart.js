/**
 * Created by sjfx on 2018/5/17.
 */
optionXzry = {
    title:{
        text:'新增人员',
        textStyle:{
            color:'white',
            fontStyle:'oblique',
            fontSize:12
        },
        left:'center'
    },
    grid:{
        left:'30%',
        top:'10%',
        bottom:'15%'
    },
    xAxis: {
        type: 'category',
        data: [
            {
                value: '自动',
                textStyle: {
                    color: '#ffffff'
                }
            },
            {
                value: '核查',
                textStyle: {
                    color: '#ffffff'
                }
            }
        ],
        axisLine:{
            lineStyle:{
                color:'#ffffff'
            }
        }
    },
    yAxis: {
        type: 'value',
        splitLine: {
            show: false
        },
        nameTextStyle:{
            color:'#ffffff'
        },
        axisLine:{
            lineStyle:{
                color:'#ffffff'
            }
        },
        axisLabel:{
            formatter:function(value){
                if(value>=10000){
                    return value/10000 +'万'
                }else  if(value>=1000){
                    return value/1000 +'千'
                }
                return value
            }
        }
    },
    series: [{
        data: [],
        itemStyle:{
            color:'#6d9eeb'
        },
        label:{
            show:true
        },
        type: 'bar'
    }]
};


optionNlfb = {
    title : {
        text: '年龄分布',
        x:'center',
        textStyle:{
            color:'white',
            fontSize:10,
            fontStyle:'oblique'
        }
    },
    tooltip : {
        trigger: 'item',
        formatter: "{b} : {c} ({d}%)",
        position:'top'
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:[],
        textStyle:{
            color:'white',
            fontSize:5,
            fontStyle:'oblique'
        }
    },
    calculable : true,
    series : [
        {
            name:'年龄分布',
            type:'pie',
            radius : '50%',
            center: ['50%', '50%'],
            data:[],
            labelLine:{
                length:5,
                length2:3,
                smooth:true
            }
        }
    ]
};


optionQyfb = {
    title:{
        text:'区域分布',
        textStyle:{
            color:'white',
            fontSize:10,
            fontStyle:'oblique'
        },
        left:'center'
    },
    grid:{
        left:'30%',
        top:'10%',
        bottom:'15%'
    },

    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    label: {
        show: true,
        position:'right',
        color:'#ffffff'
    },
    calculable : true,

    xAxis : [
        {
            type : 'value',
            splitLine:{
                show:false
            },
            axisLine:{
                lineStyle:{
                    color:'#ffffff'
                }
            },
            axisLabel:{
                show:false,
                interval:0,
                fontSize:10
            }
        }
    ],
    yAxis : [
        {
            type : 'category',
            data : [],
            nameTextStyle:{
                color:'#ffffff',
                // fontSize:1,
                fontWeight:'lighter'
            },
            axisLine:{
                lineStyle:{
                    color:'#ffffff'
                }
            },
            axisLabel:{
                interval:0
                // ,
                // fontSize:12
            }
        }
    ],
    series : [
        {
            type:'bar',
            data:[],
            itemStyle:{
                color:'#61a0a8'
            }
        }
    ]
};






optionGxBar = {
    title:{
        text:'数据项更新',
        textStyle:{
            color:'#FFFFFF',
            fontStyle:'oblique',
            fontSize:12
        },
        left:'right'
    },
    grid:{
        left:'30%',
        top:'15%',
        bottom:'15%'
    },
    xAxis: {
        type: 'category',
        data: [
            {
                value: '主项',
                textStyle: {
                    color: '#ffffff'
                }
            },
            {
                value: '辅项',
                textStyle: {
                    color: '#ffffff'
                }
            }
        ],
        axisLine:{
            lineStyle:{
                color:'#ffffff'
            }
        }
    },
    yAxis: {
        type: 'value',
        splitLine: {
            show: false
        },
        nameTextStyle:{
            color:'#ffffff'
        },
        axisLine:{
            lineStyle:{
                color:'#ffffff'
            }
        },
        axisLabel:{
            formatter:function(value){
                if(value>=10000){
                    return value/10000 +'万'
                }else  if(value>=1000){
                    return value/1000 +'千'
                }
                return value
            }
        }
    },
    series: [{
        data: [],
         itemStyle:{
                color:'#CD919E'
            },
            label:{
                show:true
            },
        type: 'bar'
    }]
};

sjxoption = {
    title : {
        text: '数据项更新情况',
        x:'center',
        top:'1',
        textStyle: {
            color: "#fff",
            fontSize:12
        }
    },
    // textStyle: {
    //     fontSize:3
    // },

    //显示series中信息，提示框组件
    tooltip : {
        trigger: 'item',
        formatter: "{b} : {c} ({d}%)",
        position:'top'
    },
    series : [
        {
            type: 'pie',    //图表类型，柱状图：bar
            //饼图：pie  (南丁格尔图在series中加上roseType:’angle’)移开后不显示原来信息
            radius : '50%',    //半径
            center: ['50%', '50%'],
            data:[],
            labelLine:{
                length:5,
                length2:3,
                smooth:true
            },
            itemStyle: {  //itemStyle有正常显示：normal，有鼠标hover的高亮显示：emphasis
                emphasis: {  //normal显示阴影,与shadow有关的都是阴影的设置
                    shadowBlur: 10,  //阴影大小
                    shadowOffsetX: 0,  //阴影水平方向上的偏移
                    shadowColor: 'rgba(0, 0, 0, 0.5)'  //阴影颜色
                }
            }
            // ,
            // label:{
            //     fontSize:2
            // }
        }
    ]
};


optionCyry={
    title:{
        text:'从业人员',
        textStyle:{
            //color:'white',
            //fontStyle:'oblique',
            fontSize:14
        },
        top:"1%",
        left:'20%'
    },
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        },
        position:[50,0]
    },
    legend: {
        data:['新增','撤销'],
        left:'right',
        itemWidth:10,
        itemHeight:10,
        itemGap:5
    },
    grid: {
        left: '8%',
        right: '4%',
        bottom: '20%',
        top:'20%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['自动','核查']
        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel:{
                formatter:function(value){
                    if(value>=10000){
                        return value/10000 +'万'
                    }else  if(value>=1000){
                        return value/1000 +'千'
                    }
                    return value
                }
            }
        }
    ],
    series : []
};


optionSjzl={
//    tooltip: {
//    show:false,
//    trigger: 'item',
//    formatter: "{a} <br/>{b}: {c} ({d}%)",
//     textStyle:{
//         fontSize:'5'
//     }
//        //,
//        //position:['60%','50%']
//},
    color:['#3CB371','#7A8B8B','#8B6969','#C23531'],
    series: [
        {
            //name:'访问来源',
            type:'pie',
            radius: ['35%', '60%'],
            //center:['40%','50%'],
            data:[],
            //selectedMode:'single',
            //avoidLabelOverlap:false,
            labelLine:{
                length:5,
                length2:3,
              smooth:true
            },
            label:{
                    show:true,
                    position:'outside',
                    //formatter: "{b}\n{d}%",
                    fontSize:12
                //width:10,
                //height:3

            }
        }
    ]
};



optionCxry = {
    title:{
        text:'撤销人员',
        textStyle:{
            color:'white',
            fontStyle:'oblique',
            fontSize:12
        },
        left:'right'
    },
    grid:{
        left:'30%',
        top:'10%',
        bottom:'30%'
    },
    xAxis: {
        type: 'category',
        data: [
            {
                value: '自动',
                textStyle: {
                    color: '#ffffff'
                }
            },
            {
                value: '核查',
//                        'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
                textStyle: {
                    color: '#ffffff'
                }
            }
        ],
        axisLine:{
            lineStyle:{
                color:'#ffffff'
            }
        }
    },
    yAxis: {
        type: 'value',
        splitLine: {
            show: false
        },
        nameTextStyle:{
            color:'#ffffff'
        },
        axisLine:{
            lineStyle:{
                color:'#ffffff'
            }
        },
        axisLabel:{
            formatter:function(value){
                if(value>=10000){
                    return value/10000 +'万'
                }else  if(value>=1000){
                    return value/1000 +'千'
                }
                return value
            }
        }
    },
    series: [{
        data: [],
        itemStyle:{
            color:'#8DB76B'
        },
        label:{
            show:true
        },
        type: 'bar'
    }]
};

optionDz = {
    tooltip:{
        trigger:'item',
        position:['60%','5%'],
        triggerOn:'click',
        hideDelay:2000
    },
    series: [
        {
            name:'标准地址',
            type:'pie',
            selectedOffset:0,
            radius: [0, '30%'],
            center:['50%','35%'],
            label: {
                normal: {
                    position: 'center',
                    color:'#ffffff',
                    fontSize:15
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[]
        },
        {
            name:'资源地址',
            type:'pie',
            radius: ['40%', '55%'],
            // selectedMode:'single',
            center:['50%','35%'],
            label: {
                normal: {
                    formatter:function(data){
                        // JSON.stringify(data);
                        var content='';
                        var rs=data.data.rs;
                        rs=parseInt(rs);
                        if(rs>0){
                            content='{b|'+data.data.ywy+': }'+'{abc|'+data.data.yz+'}';
                        }else{
                            content='{b|'+data.data.ywy+': }'+'{a|'+data.data.yz+'}';
                        }
                        return content;
                    },
                    position: 'outside',
                    rich: {
                        abc:{
                            color: '#f49f42',
                            lineHeight: 20,
                            align: 'center',
                        },
                        a: {
                            color: '#999',
                            lineHeight: 20,
                            align: 'center'
                        },
                        b:{
                            color: '#00df00',
                            lineHeight: 20,
                            align: 'center',
                            // fontStyle:'italic',
                            fontWight:'bolder'
                        },
                        hr: {
                            borderColor: '#aaa',
                            width: '100%',
                            borderWidth: 0.5,
                            height: 0
                        },
                        per: {
                            color: '#eee',
                            backgroundColor: '#334455',
                            padding: [2, 4],
                            borderRadius: 2
                        }
                    }
                }
            },
            data:[]
        }
    ]
};

var datas = [{
    name: '安徽省芜湖市弋江区利民东路\n松韵园小区14幢1单元401室',
    symbolSize:160,
    itemStyle:{
        color:'#73a373',
        borderColor:'#000',
        borderWidth:1
    }

}, {
    name: '户籍',
     value: '弋江区利民东路松韵园14栋1-0401',
    symbolSize:80,
    itemStyle:{
        color:'#dd6b66',
    }
}, {
    name: '网格化',
    value:'弋江区松韵园14栋1-0401',
    // name: '网格化：弋江区松韵\n园14栋1-0401',
    symbolSize:80,
    itemStyle:{
        color:'#dd6b66',
    }
}, {
    name: '人社局',
    value: '利民东路松韵园14栋1-0401',
    symbolSize:80,
    itemStyle:{
        color:'#dd6b66',
    }
}, {
    name: '工商',
    value: '利民东路松韵园14栋1-0401',
    symbolSize:80,
    itemStyle:{
        color:'#dd6b66',
    }
}, {
//         name: '池淑娟\n340203199011151226',
        name: '池淑娟',
    value:'340203199011151226',
    symbolSize:40,
    itemStyle:{
        color:'#cc70af',
    }
    },
    {
        name: '池正云',
        symbolSize:40,
        itemStyle:{
            color:'#f49f42',
        }
    }
];

optionDz111 = {
    label:{
        normal:{
            show:true,
            textStyle:{
                fontSize:16
            }
        }
    },

    tooltip:{
        show:true,
        showContent:true,
        formatter:'{b}:{c}'
    },
    legend:{show:true,},
    edgeLabel:{
        show:true,

    },
    animationEasingUpdate: 'quinticInOut',
    series: [{
        type: 'graph',
        layout: 'force',
         focusNodeAdjacency: true,
         roam: true,
        draggable: false,
        circular:{
            rotateLabel:true,
        },
        force: {
            repulsion: 2000,
            gravity:0.2,
            edgeLength:50,
            layoutAnimation:true
        },
            edgeSymbolSize:[4,50],
        label: {
            normal: {
                show: true,
                textStyle: {
                    fontSize: 16
                },
                color:'',
            }
        },
        itemStyle:{
          normal:{
              label:{
                  show:true
              },
              borderType:'solid',
              borderColor:'rgba(205,149,12,0.4)',
              borderWidth:2,
              opacity:1
          }
        },
        lineStyle: {
            normal: {
                opacity: 0.9,
                width: 1,
                curveness:0.1
            },
            emphasis:{
                color: '#ec407a'
            }
        },
        data: datas,
        links: [{
            source: 0,
            target: 1,
        }, {
            source: 0,
            target: 2,
        }, {
            source: 0,
            target: 3,
        }, {
            source: 2,
            target: 5,
        }, {
            source: 3,
            target: 6,
        }, {
            source: 0,
            target: 4,
        }]
    }]
};





