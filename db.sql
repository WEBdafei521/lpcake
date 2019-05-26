/*用户列表*/
create table user(
    id int primary key auto_increment,
    uname varchar(128),
    upwd varchar(128),
    phone varchar(128),
    birth varchar(128)
);

/*轮播图*/
create table index_banner(
    id int primary key auto_increment,
    bid int(100),
    http_url varchar(128),
    img_url varchar(128)
);
insert into index_banner values(null,1,"/details.html?lid=1","img/banner_1.jpg");
insert into index_banner values(null,2,"/details.html?lid=2","img/banner_2.jpg");
insert into index_banner values(null,3,"/details.html?lid=3","img/banner_3.jpg");
insert into index_banner values(null,4,"/details.html?lid=4","img/banner_4.jpg");
insert into index_banner values(null,5,"/details.html?lid=5","img/banner_5.png");
/*九宫格*/
create table index_four(
    id int primary key auto_increment,
    direction varchar(128),
    img_url varchar(128),
    title varchar(128)
   
);
insert into index_four values(null,"/bread","img/bread.png","面包");
insert into index_four values(null,"/cake","img/cake.png","蛋糕");
insert into index_four values(null,"/tea","img/tea.png","下午茶");
insert into index_four values(null,"/other","img/other.png","企业专区");

/*新品商品列表*/
create table index_new(
    id int primary key auto_increment,
    pid int,
    new_url varchar(128),
    new_http varchar(128),
    pro_name varchar(128),
    pro_price varchar(128),
    pro_type varchar(128),
    pro_details varchar(128)
);
insert into index_new values(null,1,"img/new1.jpg","/details","可可岛","298","1.0磅","隐藏着春天的岛屿");
insert into index_new values(null,2,"img/new2.jpg","/details","草莓奶油","228","2.0磅","甜润奶肉,与草莓的自然甜蜜搭配");
insert into index_new values(null,3,"img/new3.jpg","/details","栗蓉暗香","198","1.0磅","关于栗子的高级尝试");
insert into index_new values(null,4,"img/new4.jpg","/details","小重组","298","160g","均一,轻褐的千层酥,三种重组可能");

/*人气商品列表*/
create table index_popular(
    id int primary key auto_increment,
    pid int,
    new_url varchar(128),
    new_http varchar(128),
    pro_name varchar(128),
    pro_price varchar(128),
    pro_type varchar(128),
    pro_details varchar(128)
);
insert into index_popular values(null,5,"img/popalar1.jpg","/details","百利甜情人","298","2.0磅","爱尔兰百利甜酒/新西兰奶油/云南玫瑰甘露");
insert into index_popular values(null,6,"img/popalar2.jpg","/details","芒果奶油","198","2.0磅","坚持自然成熟，应季鲜切芒果");
insert into index_popular values(null,7,"img/popalar3.jpg","/details","榴莲飘飘","298","2.0磅","严格捍卫榴莲狂热者的权利");
insert into index_popular values(null,8,"img/popalar4.jpg","/details","（彼尔德）黑白巧克力","298","2.0磅","新鲜奶油慕斯，轻盐味，丰富甜");


/*生日商品列表*/
create table index_birth(
    id int primary key auto_increment,
    pid int,
    new_url varchar(128),
    new_http varchar(128),
    pro_name varchar(128),
    pro_price varchar(128),
    pro_type varchar(128),
    pro_details varchar(128)
);
insert into index_birth values(null,9,"img/birth1.jpg","/details","冻慕斯与焗芝士","298","2.0磅","新鲜奶油慕斯，轻盐味，丰富甜");
insert into index_birth values(null,10,"img/birth2.jpg","/details","(撒粉生日)黑白巧克力慕斯","298","2.0磅","口感冰凉细腻，白巧克力慕斯的甜");

/*文章列表*/
create table index_text(
    id int primary key auto_increment,
    pid int,
    text_img varchar(128),
    text_title varchar(128)
);
insert into index_text values(null,1,"img/text1.jpg","冬季刊·进博会");
insert into index_text values(null,2,"img/text2.jpg","廿一志秋刊·客服Q&A");
insert into index_text values(null,3,"img/text3.jpg","春季刊 · 茶");
insert into index_text values(null,4,"img/text4.jpg","春季刊·私享");
/*文章列表*/
create table text_list(
    id int primary key auto_increment,
    pid int,
    text_img varchar(128),
    text_title varchar(128),
    text_time varchar(128)
);
insert into text_list values(null,1,"img/text1.jpg","冬季刊·进博会","2016-11-01");
insert into text_list values(null,2,"img/text2.jpg","廿一志秋刊·客服Q&A","2017-10-01");
insert into text_list values(null,3,"img/text3.jpg","春季刊 · 茶","2018-06-21");
insert into text_list values(null,4,"img/text4.jpg","春季刊·私享","2019-05-24");
insert into text_list values(null,5,"img/text5.jpg","春季刊·蛋糕.JPEG","2018-03-01");
insert into text_list values(null,6,"img/text6.jpg","一月刊·姜","2019-05-24");
insert into text_list values(null,7,"img/text7.jpg","十二月刊·松子","2019-05-24");
insert into text_list values(null,8,"img/text8.jpg","十一月刊·栗子","2019-05-24");
insert into text_list values(null,9,"img/text9.jpg","十月刊·啤酒","2019-05-24");
insert into text_list values(null,10,"img/text10.jpg","十月刊·啤酒","2019-05-24");
insert into text_list values(null,11,"img/text11.jpg","八月刊·乳酪","2019-05-24");
/*文章详情页*/
create table text_details_time(
    id int primary key auto_increment,
    pid int,
    text_title varchar(128),
    text_time varchar(128)
);  
insert into text_details_time values(null,1,"冬季刊·进博会","2016-11-01");
insert into text_details_time values(null,2,"廿一志秋刊·客服Q&A","2017-10-01");
insert into text_details_time values(null,3,"春季刊 · 茶","2018-06-21");
insert into text_details_time values(null,4,"春季刊·私享","2019-05-24");
insert into text_details_time values(null,5,"春季刊·蛋糕.JPEG","2019-03-01");
insert into text_details_time values(null,6,"一月刊·姜","2019-05-24");
insert into text_details_time values(null,7,"十二月刊·松子","2019-05-24");
insert into text_details_time values(null,8,"十一月刊·栗子","2019-05-24");
insert into text_details_time values(null,9,"十月刊·啤酒","2019-05-24");
insert into text_details_time values(null,10,"十月刊·啤酒","2019-05-24");
insert into text_details_time values(null,11,"十月刊·奶酪","2019-05-24");
/*文章详情页*/
create table text_details_img(
    id int primary key auto_increment,
    pid int,
    text_img1 varchar(128),
    text_img2 varchar(128),
    text_img3 varchar(128),
    text_img4 varchar(128),
    text_img5 varchar(128),
    text_img6 varchar(128),
    text_img7 varchar(128),
    text_img8 varchar(128),
    text_img9 varchar(128) 
);
insert into text_details_img values(null,1,"img/text1_1.jpg","img/text1_2.jpg","img/text1_3.jpg","img/text1_4.jpg","img/text1_5.jpg","img/text1_6.jpg","img/text1_7.jpg","img/text1_8.jpg","img/text1_9.jpg");
insert into text_details_img values(null,2,"img/text2_1.jpg","img/text2_2.jpg","img/text2_3.jpg","img/text2_4.jpg","img/text2_5.jpg","img/text2_6.jpg","img/text2_7.jpg","img/text2_8.jpg","img/text2_9.jpg");
insert into text_details_img values(null,3,"img/text3_1.jpg","img/text3_2.jpg","img/text3_3.jpg","img/text3_4.jpg","img/text3_5.jpg","img/text3_6.jpg","img/text3_7.jpg","img/text3_8.jpg","img/text3_9.jpg");
insert into text_details_img values(null,4,"img/text4_1.jpg","img/text4_2.jpg","img/text4_3.jpg","img/text4_4.jpg","img/text4_5.jpg","img/text4_6.jpg","img/text4_7.jpg","img/text4_8.jpg","img/text4_9.jpg");
insert into text_details_img values(null,5,"img/text5_1.jpg","img/text5_2.jpg","img/text5_3.jpg","img/text5_4.jpg","img/text5_5.jpg","img/text5_6.jpg","img/text5_7.jpg","img/text5_8.jpg","img/text5_9.jpg");
insert into text_details_img values(null,6,"img/text6_1.jpg","img/text6_2.jpg","img/text6_3.jpg","img/text6_4.jpg","img/text6_5.jpg","img/text6_6.jpg","img/text6_7.jpg","img/text6_8.jpg","img/text6_9.jpg");
insert into text_details_img values(null,7,"img/text7_1.jpg","img/text7_2.jpg","img/text7_3.jpg","img/text7_4.jpg","img/text7_5.jpg","img/text7_6.jpg","img/text7_7.jpg","img/text7_8.jpg","img/text7_9.jpg");
insert into text_details_img values(null,8,"img/text8_1.jpg","img/text8_2.jpg","img/text8_3.jpg","img/text8_4.jpg","img/text8_5.jpg","img/text8_6.jpg","img/text8_7.jpg","img/text8_8.jpg","img/text8_9.jpg");
insert into text_details_img values(null,9,"img/text9_1.jpg","img/text9_2.jpg","img/text9_3.jpg","img/text9_4.jpg","img/text9_5.jpg","img/text9_6.jpg","img/text9_7.jpg","img/text9_8.jpg","img/text9_9.jpg");
insert into text_details_img values(null,10,"img/text10_1.jpg","img/text10_2.jpg","img/text10_3.jpg","img/text10_4.jpg","img/text10_5.jpg","img/text10_6.jpg","img/text10_7.jpg","img/text10_8.jpg","img/text10_9.jpg");
insert into text_details_img values(null,11,"img/text11_1.jpg","img/text11_2.jpg","img/text11_3.jpg","img/text11_4.jpg","img/text11_5.jpg","img/text11_6.jpg","img/text11_7.jpg","img/text11_8.jpg","img/text11_9.jpg");

/*商品详情页*/
create table details_introduce(
    id int primary key auto_increment,
    pid int,
    title_en varchar(128),
    title_cn varchar(128),
    selected_weight varchar(128),
    price varchar(128),
    introduce varchar(128)
);
insert into details_introduce values(null,1,"Cocoa Island","可可岛","2.0磅","298","精品巧克力蛋糕");
insert into details_introduce values(null,2,"Cocoa Island","草莓奶香","2.0磅","258","精品巧克力蛋糕");
insert into details_introduce values(null,3,"Cocoa Island","可可岛","2.0磅","258","精品巧克力蛋糕");
insert into details_introduce values(null,4,"Cocoa Island","可可岛","2.0磅","258","精品巧克力蛋糕");

/*商品分类*/
create table details_type(
    id int primary key auto_increment,
    pid int,
    details_type varchar(128),
    details_href varchar(128)
);
insert into details_type values(null,1,"聚会>","/index");
insert into details_type values(null,1,"新品>","/index");
insert into details_type values(null,1,"儿童>","/index");
/*商品上拉框*/
create table details_box(
    id int primary key auto_increment,
    pid int,
    price varchar(128),
    img varchar(128),
    adpt varchar(128),
    contain varchar(128),
    size varchar(128),
    timer varchar(128)
);
insert into details_box values(null,1,"198.00","img/sm1.jpg","13.5*13.6","含5套餐具(蜡烛需单独订购)","适合3-4人分享","最早明天07:30配送");
insert into details_box values(null,1,"298.00","img/md2.jpg","15.5*15.5","含8套餐具(蜡烛需单独订购)","适合7-8人分享","最早明天10:30配送");
insert into details_box values(null,1,"398.00","img/md3.jpg","17.5*17.5","含13套餐具(蜡烛需单独订购)","适合10-13人分享","最早明天09:30配送");
insert into details_box values(null,1,"498.00","img/lg5.jpg","22.5*22.5","含17套餐具(蜡烛需单独订购)","适合16-17人分享","最早明天08:30配送");

insert into details_box values(null,2,"198.00","img/sm1.jpg","13.5*13.6","含5套餐具(蜡烛需单独订购)","适合3-4人分享","最早明天07:30配送");
insert into details_box values(null,2,"298.00","img/md3.jpg","15.5*15.5","含8套餐具(蜡烛需单独订购)","适合7-8人分享","最早明天10:30配送");
insert into details_box values(null,2,"398.00","img/lg5.jpg","17.5*17.5","含13套餐具(蜡烛需单独订购)","适合10-13人分享","最早明天09:30配送");

insert into details_box values(null,2,"998.00","img/lg5.jpg","17.5*17.5","含13套餐具(蜡烛需单独订购)","适合15-17人分享","最早明天06:30配送");
/*上拉 商品重量 大小*/
create table details_box_weight(
    id int primary key auto_increment,
    pid int,
    title varchar(128)
);
insert into details_box_weight values(null,1,"1.0磅");
insert into details_box_weight values(null,1,"2.0磅");
insert into details_box_weight values(null,1,"3.0磅");
insert into details_box_weight values(null,1,"5.0磅");

insert into details_box_weight values(null,2,"1.0磅");
insert into details_box_weight values(null,2,"2.0磅");
insert into details_box_weight values(null,2,"3.0磅");

insert into details_box_weight values(null,3,"5.0磅");
/*商品甜度*/
create table details_sweet(
    id int primary key auto_increment,
    pid int,
    sweet1 varchar(128),
    sweet2 varchar(128),
    sweet3 varchar(128),
    sweet4 varchar(128),
    sweet5 varchar(128)
);
insert into details_sweet values(null,1,"img/sweet-02.png","img/sweet-02.png","img/sweet-01.png","img/sweet-01.png","img/sweet-01.png");
insert into details_sweet values(null,2,"img/sweet-02.png","img/sweet-02.png","img/sweet-02.png","img/sweet-02.png","img/sweet-01.png");
insert into details_sweet values(null,3,"img/sweet-02.png","img/sweet-01.png","img/sweet-01.png","img/sweet-01.png","img/sweet-01.png");
insert into details_sweet values(null,4,"img/sweet-02.png","img/sweet-02.png","img/sweet-02.png","img/sweet-01.png","img/sweet-01.png");

/*用户购物车*/
create table usercart(
    id int primary key auto_increment,
    uid varchar(128),
    pid varchar(128),
    pname varchar(128),
    price varchar(128),
    pweight varchar(128),
    count int(128)
);




