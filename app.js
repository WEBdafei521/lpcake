const express=require("express");
const mysql=require("mysql");
//1.1 引入模块 cors  解决跨域问题
const cors=require("cors");
//1.2 配置允许访问列
const bodyParser=require('body-parser');//中间件

var server=express();
server.use(cors({
    origin:["http://127.0.0.1:8080","http://localhost:8080"],
    credentials:true
}));
//加载 express-session模块
const session=require("express-session");
//配置模块
server.use(session({
  secret:"128位随机字符串",
  resave:false,
  saveUninitialized:true,
  cookie:{//cookie辅助 session工作
    maxAge:1000*60*60  //session 对象存货
  }
}));
server.use(express.static("public"));
server.listen(5050);
server.use(bodyParser.urlencoded({
    extended:false
}));
var pool=mysql.createPool({
    host:'127.0.0.1',
    port:3306,
    user:'root',
    password:'',
    database:'Pcake'
});
// 用户注册
server.post("/reg",(req,res)=>{
  var uname=req.body.uname;
  var upwd=req.body.upwd;
  var phone=req.body.phone;
  var birth=req.body.birth;
  var sql="insert into user values(null,?,?,?,?)";
  pool.query(sql,[uname,upwd,phone,birth],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,data:"注册成功"})
    }
  })
});
// 验证用户名是否存在
server.get("/search",(req,res)=>{
  var uname=req.query.uname;
  var sql="select id from user where uname=?";
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:"用户名存在,请重新输入"})
    }
  })
});
// 用户登录
server.post("/login",(req,res)=>{
  var uname=req.body.uname;
  var upwd=req.body.upwd;
  var sql="select * from user where uname=? and upwd=?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,data:"用户名或密码不正确"})
    }
  })
});

// 修改用户信息
server.post("/change",(req,res)=>{
  var id=req.body.uid;
  var sql="select * from user where id=?";
  pool.query(sql,[id],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,data:"用户名或密码不正确"})
    }
  })
});
// 轮播图
server.get("/index_banner",(req,res)=>{
  var sql="select * from index_banner";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
// 九宫图
server.get("/index_four",(req,res)=>{
  var sql="select direction,img_url,title from index_four";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 新品列表
server.get("/index_new",(req,res)=>{
  var sql="select pid,new_url,new_http,pro_name,pro_price,pro_type,pro_details from index_new";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 人气列表
server.get("/index_popular",(req,res)=>{
  var sql="select pid,new_url,new_http,pro_name,pro_price,pro_type,pro_details from index_popular";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 生日列表
server.get("/index_birth",(req,res)=>{
  var sql="select pid,new_url,new_http,pro_name,pro_price,pro_type,pro_details from index_birth";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 首页文章列表
server.get("/index_text",(req,res)=>{
  var sql="select pid,text_img,text_title from index_text";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 文章列表
server.get("/text_list",(req,res)=>{
	var pno=req.query.pno;
	var pageSize=4;
	if(!pno){pno=1}
	var sql="select * from text_list LIMIT ?,?"
	var offset = (pno-1)*pageSize;
    pageSize = parseInt(pageSize);
	pool.query(sql,[offset,pageSize],(err,result)=>{
		if(err) throw err;
		res.send(result);
	})
});
// 文章详情 时间标题
server.get("/text_details_time",(req,res)=>{
  var pid=req.query.pid;
  var sql="select * from text_details_time where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    res.send({code:1,data:result})
  })
});
// 文章详情 图片
server.get("/text_details_img",(req,res)=>{
  var pid=req.query.pid;
  var sql="select * from text_details_img where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    res.send({code:1,data:result})
  })
});

// 商品详情
server.get("/details_introduce",(req,res)=>{
  var pid=req.query.pid;
  var sql="select * from details_introduce where pid=?"
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result[0]})
  })
});
// 商品分类
server.get("/details_type",(req,res)=>{
  var pid=req.query.pid;
  var sql="select * from details_type where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
// 商品的保存条件
server.get("/details_sweet",(req,res)=>{
  var pid=req.query.pid;
  console.log(pid)
  var sql="select * from details_sweet where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
// 上拉框数据
server.get("/details_box",(req,res)=>{
  var pid=req.query.pid;
  var sql="select * from details_box where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
// // 上拉框商品重量
server.get("/details_box_weight",(req,res)=>{
  var pid=req.query.pid;
  var sql="select * from details_box_weight where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
// 添加购物车
server.get("/addcart",(req,res)=>{
	var uid=req.query.uid; //用户id
	var pid=req.query.pid;//商品id
	var pname=req.query.pname;//商品名称
	var price=req.query.price;//商品价格
  var pweight=req.query.weight;//商品价格
  console.log(uid,pid,pname,price,pweight)
	var sql="select id from usercart";
	sql+=" where uid=? and pid=? and pweight=?";
	pool.query(sql,[uid,pid,pweight],(err,result)=>{
	  if(err) throw err;
	  if(result.length!=0){
      //如果查到数据
      var sql="update usercart set count=count+1 where uid=? and pid=? and pweight=?"
      pool.query(sql,[uid,pid,pweight],(err,result)=>{
        if(err) throw err;
        res.send("1")
		})
	  }else{
	  //如果没有查到数据
		  var sql="insert into usercart(id,uid,pid,pname,price,pweight,count) values(null,?,?,?,?,?,1)";
		  pool.query(sql,[uid,pid,pname,price,pweight],(err,result)=>{
        if(err) throw err;
        res.send({code:1,})
		  })
	  }
	});
});
// 获取用户商品列表
server.get("/productList",(req,res)=>{
	var uid=req.query.uid; //用户id
	var sql="select * from usercart where uid=?";
	pool.query(sql,[uid],(err,result)=>{
	  if(err) throw err;
    res.send({code:1,data:result})
	});
});
// 清空购物车
server.get("/clearAll",(req,res)=>{
  var uid=req.query.uid;
  var sql="DELETE FROM usercart WHERE uid = ?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:"购物车已清空"})
  })
});
// 修改购买数量 增加
server.get("/shopcart_add",(req,res)=>{
  var uid=req.query.uid;
  var pid=req.query.pid;
  var pweight=req.query.pweight;
  var sql="update usercart set count=count+1 where uid=? and pid=? and pweight=?";
  pool.query(sql,[uid,pid,pweight],(err,result)=>{
    if(err) throw err;
  var pweight=req.query.uid;
  console.log(uid,pid,pweight)
    res.send({code:1,data:""})
  })
});
// 修改购买数量 减少
server.get("/shopcart_reduce",(req,res)=>{
  var uid=req.query.uid;
  var pid=req.query.pid;
  var pweight=req.query.pweight;
  var sql="update usercart set count=count-1 where uid=? and pid=? and pweight=?";
  pool.query(sql,[uid,pid,pweight],(err,result)=>{
    if(err) throw err;
  var pweight=req.query.uid;
  console.log(uid,pid,pweight)
    res.send({code:1,data:""})
  })
});
// 修改购买数量 删除
server.get("/shopcart_delete",(req,res)=>{
  var uid=req.query.uid;
  var pid=req.query.pid;
  var pweight=req.query.pweight;
  var sql="DELETE FROM usercart WHERE uid=? and pid=? and pweight=?";
  pool.query(sql,[uid,pid,pweight],(err,result)=>{
    if(err) throw err;
  var pweight=req.query.uid;
  console.log(uid,pid,pweight)
    res.send({code:1,data:""})
  })
});
// 修改用户的详细信息
server.post("/changeinfo",(req,res)=>{
  var uid=req.body.uid;
  var phone=req.body.phone;
  var uname=req.body.uname;
  var upwd=req.body.upwd;
  var birth=req.body.birth;
  console.log(uid,phone,uname,birth,birth)
  var sql="update user set uname=?,upwd=?,phone=?,birth=? where id=?";
  pool.query(sql,[uname,upwd,phone,birth,uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,data:"登陆成功"})
    }
  })
});