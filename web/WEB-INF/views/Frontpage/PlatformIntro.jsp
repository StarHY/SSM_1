<%--
  Created by IntelliJ IDEA.
  User: 不曾有黑夜
  Date: 2017/4/18
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>平台介绍</title>
</head>
<link rel="stylesheet" href="/static/css/bootstrap.css">
<link rel="stylesheet" href="/static/css/animate.css">
<link rel="stylesheet" href="/static/css/Frontpage.css">
<style>
    #main{
        width: 100%;
    }
    #first, #two, #three, #four{
        width: 100%;
        height: 650px;
    }
    .content-left{
        height: 95%;
    }
    .content-right{
    }
    .first-left-bg img{
        height: 90%;
    }
    .container{
        padding-top: 50px;
        height: 95%;
    }
    .des-txt{
        font-size:16px;
        padding-left: 21px;
    }
    .btn{
        margin: 15px 10px;
        width: 269px;
        height:54px;
        font-size: 20px;
    }
    .eweim{
        background: url(/static/img/Frontpage/2wei.jpg) no-repeat;
        float: right;
        margin: 10px 15px;
        width: 135px;
        height: 135px;
    }
    #thirdBar{
        background: url(/static/img/Frontpage/sg-bg2.jpg)50% -600px;
        height: 600px;
    }
    #fourthBar{
        background: url(/static/img/Frontpage/sg-bg3.jpg)50% -600px;
        height: 600px;
    }
    #fifthBar{
        background: url(/static/img/Frontpage/sg-bg.jpg)50% -600px;
        height:600px;
    }
    #sixthBar{
        background: url(/static/img/Frontpage/sg-bg4.jpg)50% -600px;
        height: 600px;
    }
    .eweima img{
        height: 90px;
        width: 90px;
    }
    .nav-two{
        position: fixed;
        z-index:999;
        width: 100%;
        margin-top: -50px;
        height:auto;
        border:solid #d4d4d4 0.5px;
        background-color: white;
        box-shadow: 5px 0px 3px grey;
    }
    .nav-ul li{
        float: left;
        list-style-type: none;
        margin:0px 0px;
        padding:10px 35px;
        text-align: center;
        font-size: 23px;
    }
    .nav-ul{
        margin-bottom:0px;
    }
    .container-nav{
        margin-left: 20%;
    }
    #computer{
        background:url(/static/img/Frontpage/computer.png)0 10px no-repeat;
    }
    .nav-two .container-nav .nav-ul a{
        color: grey;
    }
</style>
<body name="top">
    <div id="main">
        <%--导航栏--%>
        <nav class="nav navbar-default navbar-fixed-top" role="navigation"  style="background-color:	#F5F5F5  ;">
            <div class="container-fluid">
                <div class="navbar-header">

                </div>
                <ul class="nav navbar-nav navbar-right" style="background-color:	#F5F5F5  ;">
                    <li><a href="frontpageHome">主页</a></li>
                    <li class="icon-li"><a href="/backstageIndex">后台</a></li>
                    <li class="icon-li"><a href="javaScript:;">关于我们</a></li>
                    <li id="menu-bg"><a href="javaScript:;">注册</a></li>
                    <li id="menu-bg2"><a href="javaScript:;">帮助</a></li>
                </ul>
            </div>
        </nav>
        <%--第二个导航栏--%>
        <div class="nav-two">
            <div class="container-nav">
                <ul class="nav-ul">
                    <a href="#windows-m"><li><span id="computer">&nbsp;&nbsp;&nbsp;&nbsp;</span>Windows</li></a>
                    <a href="#iphone-m"><li><span style="background: url(/static/img/Frontpage/iphone.png)0 10px no-repeat;">&nbsp;&nbsp;&nbsp;&nbsp;</span>iPhone</li></a>
                    <a href="#android-m"><li><span style="background: url(/static/img/Frontpage/android.png)0 10px no-repeat">&nbsp;&nbsp;&nbsp;&nbsp;</span>Android</li></a>
                    <a href="#ipad-m"><li><span style="background: url(/static/img/Frontpage/iphone.png)0 10px no-repeat;">&nbsp;&nbsp;&nbsp;&nbsp;   </span>iPad</li></a>
                    <div class="clearfix"></div>
                </ul>
            </div>
        </div>
        <%--第一个内容--%>
        <div id="first" style="margin-top:100px;" name="windows-m">
            <div class="container">
                <div class="col-md-6 col-sm-6 content-left wow fadeInLeft animated" data-wow-delay="0.7s" >
                    <div class="first-left-bg">
                        <img style="width: 90%;" src="/static/img/Frontpage/pc-bg.png"/>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 content-right wow fadeInRight animated" data-wow-delay="0.7s" >
                    <div class="first-rt-txt">
                        <h1>电脑版使用·PC端</h1>
                        <ol class="des-txt">
                            <li>
                                基本资料：汽修厂名称设置、员工登记、故障定义、维修项目定义、客户档案、车型、修理班组、其它费用定义、颜色、行驶里程保养规定、维修类别
                            </li>
                            <li>
                                接车登记：接车登记、接车明细、结算客户、挂账客户、免费修理、打印结算单
                            </li>
                            <li>
                                分类查询：用料查询、其它收费、维修完工、维修查询、保养提醒
                            </li>
                            <li>
                                材料管理：材料出库、材料入库、材料库存、配件销售、材料下限清单、当天入库统计、当天出库统计
                            </li>
                            <li>
                                材料管理：材料出库、材料入库、材料库存、配件销售、材料下限清单、当天入库统计、当天出库统计
                            </li>
                        </ol>
                    </div>
                    <button class="btn" style="background-color: burlywood;color: white;">立即试用</button>
                    <div class="eweim">
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <%--背景图--%>
        <div id="thirdBar"></div>
        <%--第二个内容--%>
        <div id="two" name="iphone-m">
            <div class="container">
                <div class="col-md-6 col-sm-6 content-left  wow fadeInLeft animated" data-wow-delay="0.7s" >
                    <div class="first-left-bg">
                        <img src="/static/img/Frontpage/iphone-green.png"/>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 content-right wow fadeInRight animated" data-wow-delay="0.7s" >
                    <div class="first-rt-txt">
                        <h1>平台使用·iPhone</h1>
                        <ol class="des-txt">
                            <li>
                                基本资料：汽修厂名称设置、员工登记、故障定义、维修项目定义、客户档案、车型、修理班组、其它费用定义、颜色、行驶里程保养规定、维修类别
                            </li>
                            <li>
                                接车登记：接车登记、接车明细、结算客户、挂账客户、免费修理、打印结算单
                            </li>
                            <li>
                                分类查询：用料查询、其它收费、维修完工、维修查询、保养提醒
                            </li>
                            <li>
                                材料管理：材料出库、材料入库、材料库存、配件销售、材料下限清单、当天入库统计、当天出库统计
                            </li>
                        </ol>
                    </div>
                    <button class="btn" style="background-color: burlywood;color: white;">立即试用</button>
                    <div class="eweim">
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <%--背景图--%>
        <div id="fourthBar"></div>
        <%--第三个内容--%>
        <div id="three" name="android-m">
                <div class="container">
                    <div class="col-md-6 col-sm-6 content-left wow fadeInLeft animated" data-wow-delay="0.7s" >
                        <div class="first-left-bg">
                            <img src="/static/img/Frontpage/anzhuo-bg.png"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 content-right wow fadeInRight animated" data-wow-delay="0.7s" >
                        <div class="first-rt-txt">
                            <h1>移动设备·Android</h1>
                            <ol class="des-txt">
                                <li>
                                    基本资料：汽修厂名称设置、员工登记、故障定义、维修项目定义、客户档案、车型、修理班组、其它费用定义、颜色、行驶里程保养规定、维修类别
                                </li>
                                <li>
                                    接车登记：接车登记、接车明细、结算客户、挂账客户、免费修理、打印结算单
                                </li>
                                <li>
                                    分类查询：用料查询、其它收费、维修完工、维修查询、保养提醒
                                </li>
                                <li>
                                    材料管理：材料出库、材料入库、材料库存、配件销售、材料下限清单、当天入库统计、当天出库统计
                                </li>
                            </ol>
                        </div>
                        <button class="btn" style="background-color: burlywood;color: white;">立即试用</button>
                        <div class="eweim">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        <div id="fifthBar"></div>
        <%--第四个内容--%>
        <div id="four" name="ipad-m">
                <div class="container">
                    <div class="col-md-6 col-sm-6 content-left wow fadeInLeft animated">
                        <div class="first-left-bg">
                            <img src="/static/img/Frontpage/ipad-bg.jpg"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 content-right wow fadeInRight animated">
                        <div class="first-rt-txt">
                            <h1>平板端下载·iPad</h1>
                            <ol class="des-txt">
                                <li>
                                    基本资料：汽修厂名称设置、员工登记、故障定义、维修项目定义、客户档案、车型、修理班组、其它费用定义、颜色、行驶里程保养规定、维修类别
                                </li>
                                <li>
                                    接车登记：接车登记、接车明细、结算客户、挂账客户、免费修理、打印结算单
                                </li>
                                <li>
                                    分类查询：用料查询、其它收费、维修完工、维修查询、保养提醒
                                </li>
                                <li>
                                    材料管理：材料出库、材料入库、材料库存、配件销售、材料下限清单、当天入库统计、当天出库统计
                                </li>
                            </ol>
                        </div>
                        <button class="btn" style="background-color: burlywood;color: white;">立即试用</button>
                        <div class="eweim">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        <div id="sixthBar"></div>
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
                    <div class="row eweima ">
                        <div class="col-md-4 col-sm-4">
                            <img src="/static/img/Frontpage/2wei.jpg"/>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <img src="/static/img/Frontpage/2wei.jpg"/>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <img src="/static/img/Frontpage/2wei.jpg"/>
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
    </div>
    <a href="#top" class="go-top" id="backtop" style="display:none;"></a>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/wow.js"></script>
<script src="/static/js/init.js"></script>
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
    })
</script>
</body>

</html>
