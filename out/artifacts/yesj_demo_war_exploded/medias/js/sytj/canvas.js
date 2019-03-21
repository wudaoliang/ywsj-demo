/**
 * Created by sjfx on 2018/5/17.
 */
function drawXzry(sl){
    draw(sl,"新增人口总数","#7A8B8B","xzcav","tbcanvas");
}

function drawGx(sl){
    draw(sl,"更新数据项","#8B6969","gxcav","gxcanvas")
}

function drawZxry(sl){
    draw(sl,"注销人员数","#C23531","zxcav","zxcanvas")
}

function drawCyry(sl){
    draw(sl,"从业人员数","#3CB371","xyrycav","cyrycanvas")
}

function draw(sl,text,color,divid,cavid){
    var xzr=document.getElementById(divid);
    var tbc=document.getElementById(cavid);
    tbc.width=xzr.offsetWidth;
    tbc.height=xzr.offsetHeight;
    var tbctx=tbc.getContext("2d");
    tbctx.fillStyle="white";
    tbctx.font=(tbc.width/8)+"px Arial";
    tbctx.fillText(text,(tbc.width/2-tbctx.measureText(text).width/2),(tbc.width/8));
    tbctx.beginPath();
    tbctx.arc(tbc.width/2,tbc.height/2,tbc.width/2-10,30,360,false);
    tbctx.lineWidth=5;
    tbctx.fillStyle=color;
    tbctx.fill();//画空心圆

    tbctx.fillStyle="white";
    tbctx.font=tbc.width/8*1.8+"px Arial";
    tbctx.fillText(toDecimal(sl),(tbc.width/2)-
    (tbctx.measureText(toDecimal(sl)).width/2),
        tbc.height/2+8);
    tbctx.closePath();
}


function toDecimal(x){
    if(x>=1000000){
       return (x/10000).toFixed(0)+"万";
    }else if(x >=100000){
        return (x/10000).toFixed(1)+"万"
    }else if(x >=10000){
        return (x/10000).toFixed(2)+"万"
    }
    return x;
}



function drawBt(text,sj){
    var midcav=document.getElementById("midcav");
    var c=document.getElementById("canvas");
    c.width=midcav.offsetWidth;
    c.height=midcav.offsetHeight;
    var ctx = c.getContext("2d");
    ctx.font = c.width*0.7/(text.length+6)+"px Arial";
    ctx.fillStyle = "white";
    ctx.fillText(text+"下发数据总量", 10, c.width*0.7/(text.length+6));
    if(sj>0){
        sj=sj.toString();
        var length=sj.length;
        var ks=c.width-c.width*0.8;
        var high=c.height*0.45;
        var x=c.width*0.2/2;
        for(var i=0;i<length;i++) {
            var ksi= ks + i * x;
            ctx.rect(ksi, high, x * 0.9, x * 1.3);
            ctx.fillStyle = "#075CDB";
            ctx.fill();
        }
            ctx.font = x*1.1+ "px Arial";
            ctx.fillStyle = "#ffd200";
        for(var j=0;j<length;j++) {
            var ksj=ks + j * x;
            ctx.fillText(sj.substr(j,1), ksj+(x * 0.9 *0.2), (high+x*1.3-x*1.3*0.2));
        }
    }
}