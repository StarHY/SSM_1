<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>主页</title>
</head>
<link rel="stylesheet" href="/static/css/bootstrap.css">
<link rel="stylesheet" href="/static/css/animate.css">
<link rel="stylesheet" href="/static/css/Frontpage.css">
<body>

    <div class="content" name="top">
        <%--导航栏--%>
        <nav class="nav navbar-default navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#top">主页</a></li>
                    <li class="icon-li"><a href="#mc2-des" id="pt">平台介绍</a></li>
                    <li class="icon-li"><a href="#mc4-des" id="gn">功能介绍</a></li>
                    <li class="icon-li"><a href="/backstageIndex">后台</a></li>
                    <li class="icon-li"><a href="javaScript:;">关于我们</a></li>
                    <li id="menu-bg"><a href="javaScript:;">注册</a></li>
                    <li id="menu-bg2"><a href="javaScript:;">帮助</a></li>
                </ul>
            </div>
        </nav>
        <%--轮播图--%>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>
            <!-- 轮播项目-->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="/static/img/Frontpage/banner1.png">
                    <div class="carousel-caption">标题 1</div>
                </div>
                <div class="item ">
                    <img src="/static/img/Frontpage/banner5.png"/>
                    <div class="carousel-caption">标题 2</div>
                </div>
                <div class="item">
                    <img src="/static/img/Frontpage/lunbo3.jpg"/>
                    <div class="carousel-caption">标题 3</div>
                </div>
                <div class="item">
                    <img src="/static/img/Frontpage/lunbo4.jpg"/>
                    <div class="carousel-caption">标题 4</div>
                </div>
                <div class="item">
                    <img src="/static/img/Frontpage/lunbo5.jpg"/>
                    <div class="carousel-caption">标题 5</div>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <button class="carousel-control left" href="#myCarousel"
               data-slide="prev"><span class="glyphicon glyphicon-chevron-left" style="left:0;width:200px;height: 200px;"></span></button>
            <button class="carousel-control right" href="#myCarousel"
               data-slide="next"><span class="glyphicon glyphicon-chevron-right" style="left:0;width:200px;height: 200px;"></span></button>
        </div>
        <%--主内容一--%>
        <div class="Maincontent">
            <h2 class="title">汽车维修保养管理平台</h2>
            <div class="row features-info banner-info text-left wow fadeInLeft animated"  data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInLeft;">
                <div class="col-sm-4 col-md-4">
                    <div class="secicon1">
                        <i class="icon icon-quan"></i>
                        <span class="text-icon">全系车型，海量品类</span>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="secicon1">
                        <i class="icon" style="background: url(/static/img/Frontpage/bi.png)"></i>
                        <span class="text-icon">多家比价，透明降本</span>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="secicon1">
                        <i class="icon" style="background: url(/static/img/Frontpage/fu.png)"></i>
                        <span class="text-icon">账期服务，采购代付</span>
                    </div>
                </div>
            </div>
            <div class="row features-info banner-img wow fadeInRight animated" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInRight;">
                <div class="col-sm-4 col-md-4">
                    <div class="secicon1">
                        <i class="icon" style="background:url(/static/img/Frontpage/zhun.png);"></i>
                        <span class="text-icon">数据支持，精准下单</span>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="secicon1">
                        <i class="icon" style="background: url(/static/img/Frontpage/bao.png);"></i>
                        <span class="text-icon">三包三赔，权益保障</span>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="secicon1">
                        <i class="icon" style="background: url(/static/img/Frontpage/xiao.png)"></i>
                        <span class="text-icon">高效物流，轨迹跟踪</span>
                    </div>
                </div>
            </div>
            <div class="button-box">
                <a href="platformIntro" class="btn wow bounceInDown animated" data-wow-delay="1s" style="width: 200px;visibility: visible; animation-delay: 0.8s;animation-name: bounceInDown;">了解更多</a>
            </div>
        </div>
        <%--主内容二--%>
        <div class="Maincontent2" name="mc2-des">
            <div class="row mc2-row">
                <div class="col-md-7 banner-info text-left wow fadeInLeft animated" data-wow-delay="0.4s" style="visibility: visible;animation-name: fadeInLeft;">
                    <div class="text">
                        <h2 class="mc2-title">
                            平台介绍
                        </h2>
                        <p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"汽车维修管理系统"是一款面向汽修汽配行业的管理软件，本系统专注于车辆的信息化管理，
                            为加强企业对车辆维修的综合管理而提供全方位的解决方案，并且具有二次开发的独特特性，
                            独特的二次开发功能可以为新老用户在以后的使用过程中出现的新模块，新功能随时进行添加，
                            为用户的使用提供全面服务。</br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"汽车维修管理系统"以对车辆的维修和管理为主线，
                            通过对信息的收集、存储、传递、统计、分析、综合查询、报表输出和信息共享，
                            及时为企业领导及各部门管理人员的决策提供全面、准确的信息数据。<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;此汽车维修保养管理系统旨在提升汽修店的信息化水平及工作
                            效率，提供便捷有效的方式管理从维修保养预约到维修完成产生收费单据并提车的整个过程。并附带汽修店基本信息的管理，汽车配件的库存管理等功能。
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="rt" class="col-md-5 col-sm-7 banner-img wow fadeInRight animated" data-wow-delay="0.4s" style="height: 100%;visibility: visible; animation-name: fadeInRight;">
                    <div class="right-img" >
                        <a href="javaScript:;"><img src="/static/img/Frontpage/slider.png" style="width: 100%;height: 100%"/></a>
                    </div>
                </div>
            </div>
            <div class="button-box2">
                <button class="btn wow fadeInRight animated " data-wow-delay="0.5s" style="width: 200px;height: 50px;visibility: visible; animation-delay: 1s; animation-name: fadeInRight;">了解更多</button>
            </div>
        </div>
        <%--主内容三--%>
        <div class="Maincontent3">
                <div class="title3">
                    <h2>您的汽修管家系统</h2>
                </div>
                <div class="row team-con">
                    <div class="col-md-12">
                        <div class="col-sm-3 col-md-3 one wow fadeInRight animated" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInRight;">
                            <div class=" mc3-txt">
                                <h3>微信连接</h3>
                                <p>连接客户信任</p>
                            </div>
                            <img src="/static/img/Frontpage/9.png"/>
                            <img class="jiantou" src="/static/img/Frontpage/12.png"/>
                        </div>
                        <div class="col-sm-3 col-md-3 wow fadeInRight animated" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInRight;">
                            <img src="/static/img/Frontpage/10.png"/>
                            <img class="jiantou2" src="/static/img/Frontpage/14.png"/>
                            <div class=" mc3-txt">
                                <h3>连接智能管理工具</h3>
                                <p>连接业务提效</p>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3 wow fadeInRight animated"  style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInRight;">
                            <div class=" mc3-txt">
                                <h3>连接供应链</h3>
                                <p>连接采购降本</p>
                            </div>
                            <img src="/static/img/Frontpage/11.png"/>
                            <img class="jiantou" src="/static/img/Frontpage/12.png"/>
                        </div>
                        <div class="col-sm-3 col-md-3 wow fadeInRight animated"  style="visibility: visible; animation-delay: 1s; animation-name: fadeInRight;">
                            <img src="/static/img/Frontpage/4.png"/>
                            <div class=" mc3-txt">
                                <h3>连接采购降本</h3>
                                <p>连接管理动态可视</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="button-box2" style="margin-top: 8%;">
                    <button class="btn wow fadeInRight animated " data-wow-delay="0.5s" style="width: 200px;height: 50px;visibility: visible; animation-delay: 1s; animation-name: fadeInRight;">马上进入</button>
                </div>
        </div>
        <%--主内容四--%>
        <div class="Maincontent4" name="mc4-des">
            <div class="mc4-title">
                <h2>功能介绍</h2>
                <span class="mc4-title-p">
                   系统管理，信息管理，人员管理，财务管理...
                </span>
                <span class="title-bg">
                    车主一站式O2O养车生活馆
                </span>
            </div>
            <div class="row about-info">
                <div class="col-md-12">
                    <div class="col-sm-4 col-md-4 zoomIn wow animated animated">
                        <div class="image1">
                            <img src="/static/img/Frontpage/mc4-bg1.png"/>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-4 zoomIn wow animated animated">
                        <div class="image2">
                            <img src="/static/img/Frontpage/mc4-bg2.png"/>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-4 zoomIn wow animated animated">
                        <div class="image3">
                            <img src="/static/img/Frontpage/mc4-bg3.png"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="button-box2">
                <button class="btn wow fadeInRight animated " style="width: 200px;height: 50px;visibility: visible; animation-name: fadeInRight;">马上进入</button>
            </div>
        </div>
        <%--主内容五--%>
        <div class="Maincontent5">
            <div class="mc5-top">
                <h2><a href="javaScript:;" style="color: #0d8ddb;">商家加盟入口</a></h2>
                <h3 class="wow fadeInRight animated" data-wow-delay="0.5s" style="text-align:center;visibility: visible; animation-name: fadeInRight;"><a href="javaScript:;" style="color:white ;">欢迎汽修、汽配商家入驻加盟</a></h3>
            </div>
        </div>
        <%--底部版权--%>
        <div class="bottom-nav">
                <div class="row concart-warp">
                    <div class="col-md-5 col-sm-12 btm-left">
                        <h4>联系我们：</h4>
                        <p>
                            <i class="icon-phone"><img src="/static/img/Frontpage/phone.png"/></i>
                            <span class="phone">40000-13864</span>
                        </p>
                        <p>E-mail:qweasdzxc102@qq.com</p>
                        <p><a href="javaScript:;"><img src="/static/img/Frontpage/btm-left.png"></a></p>
                    </div>
                    <div class="col-sm-9 col-md-5 wechat">
                        <h2>扫码关注</h2>
                        <div class="row sm ">
                            <div class="col-md-4 col-sm-4">
                                <img src="/static/img/Frontpage/pcode-4.png"/>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <img src="/static/img/Frontpage/pcode-4.png"/>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <img src="/static/img/Frontpage/pcode-4.png"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-3 rt-img row">
                        <div class="col-md-12 col-sm-10 gz">
                            <h4>关注抽奖有好礼</h4>
                            <a href="javaScript:;" id="mc5-rtimg"><img src="/static/img/Frontpage/weibo.png"/></a>
                            <a href="javaScript:;"><img src="/static/img/Frontpage/toutiao.png"/></a>
                        </div>
                    </div>
                </div>
            <div class="t-bottom">
                <span style="font-size: 19px;">© 2011-2016 赣州宏图预科班 版权所有 ｜ 赣ICP备11018683-3</span>
            </div>
        </div>
        <a href="#top" class="go-top" id="backtop" style="display:none;"></a>
</div>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/wow.js"></script>
<script>
    if (!(/msie [5|6|7|8|9]/i.test(navigator.userAgent))){
        new WOW().init();
    };
    $(function(){
        var backtop = document.getElementById("backtop");
        $(window).scroll(function () {
            if($(window).scrollTop() >= 500){
                backtop.style.display = "block";
            }else if($(window).scrollTop() <500){
                backtop.style.display = "none";
            }
        });
    });
    $(function () {
        var imgs = document.getElementById("rt");
        if(window.screen.width <= 456){
            imgs.style.display = "none";
        }
    })

    $(function(){
        $('a[href*=#],area[href*=#]').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var $target = $(this.hash);
                $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
                if ($target.length) {
                    var targetOffset = $target.offset().top;
                    $('html,body').animate({
                                scrollTop: targetOffset
                            },
                            1000);
                    return false;
                }
            }
        });
    });
</script>
</body>
</html>
