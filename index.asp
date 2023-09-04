<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!--#include file="xyconn.asp"-->
<!--#include file="Inc/xycms.asp"-->
<!--#include file="Inc/config.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="<%=keywords%>" />
<meta name="description" content="<%=descriptions%>" />
<link href="style/index.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<script type="text/javascript" src="js/slideplay.js"></script>
<title><%=wzname%></title>
<!--[if lte IE 6]>
<script src="js/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]-->
</head>
<body>
<!--#include file="head.asp"-->
<div id="about">
  <div class="a_l">
    <div class="a_l_t">
      <dt>
        <span class="btt">课程设置</span><span class="morr"><a href="pxxm.html">更多&gt;&gt;</a></span>
        <div class="clear"></div>
      </dt>
    </div>
    <div class="a_l_c">
      <div class="a_l_c_c">
        <ul>
          <%=xycms_fwxmlist(4)%>
        </ul>
      </div>
    </div>
  </div>
  <div class="a_c">
    <div class="a_c_t">
      <dt>
        <span class="bt">关于我们</span><span class="mor"><a href="common.asp?id=1">更多&gt;&gt;</a></span>
        <div class="clear"></div>
      </dt>
    </div>
    <div class="a_c_c">
      <div class="a_c_c_c">
        <script src="advfile/ad19.js"></script><%=xycms_aboutus(1,360)%>
      </div>
    </div>
  </div>
  <div class="a_r">
    <div class="a_r_t">
      <dt>
        <span class="btt">联系我们</span><span class="morr"><a href="common.asp?id=2">更多&gt;&gt;</a></span>
        <div class="clear"></div>
      </dt>
    </div>
    <div class="a_r_c">
      <div class="a_r_c_c">
        <ul>
          <li>联系人：<%=managename%></li>
          <li>电 话：<%=telnum%></li>
          <li>Q Q：<%=qqnum%></li>
          <li>邮 箱：<%=email%></li>
        </ul>
      </div>
      <div class="a_r_c_p"><script src="advfile/ad20.js"></script></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<div id="banner"><script src="advfile/ad24.js"></script></div>
<div id="cont">
  <div class="c_l">
    <div class="c_c_t">
      <dt>
        <span class="bt">画室动态</span><span class="mor"><a href="news.asp?id=3">更多&gt;&gt;</a></span>
        <div class="clear"></div>
      </dt>
    </div>
    <div class="c_c_c">
      <div class="c_c_c_t">
        <%=xycms_newsimg(3)%>
      </div>
      <div class="c_c_c_c">
        <ul>
          <%=xycms_news(6,18,3,0)%>
        </ul>
      </div>
    </div>
  </div>
  <div class="c_c">
    <div class="c_c_t">
      <dt>
        <span class="bt">美考资讯</span><span class="mor"><a href="news.asp?id=6">更多&gt;&gt;</a></span>
        <div class="clear"></div>
      </dt>
    </div>
    <div class="c_c_c">
      <div class="c_c_c_t">
        <%=xycms_newsimg(6)%>
      </div>
      <div class="c_c_c_c">
        <ul>
          <%=xycms_news(6,18,6,0)%>
        </ul>
      </div>
    </div>
  </div>
  <div class="c_r">
    <div class="c_c_t">
      <dt>
        <span class="bt">招生信息</span><span class="mor"><a href="news.asp?id=7">更多&gt;&gt;</a></span>
        <div class="clear"></div>
      </dt>
    </div>
    <div class="c_c_c">
      <div class="c_c_c_t">
        <%=xycms_newsimg(7)%>
      </div>
      <div class="c_c_c_c">
        <ul>
          <%=xycms_news(6,18,7,0)%>
        </ul>
      </div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<div id="banner"><script src="advfile/ad25.js"></script></div>
<div class="scr">
  <div class="scr_t">
    <dt>
      <span class="bt">学员作品</span><span class="mor"><a href="xyzp.asp">更多&gt;&gt;</a></span>
      <div class="clear"></div>
    </dt>
  </div>
  <div class="scr_c">
    <div class="caseShow marginbtm10">
      <div class="leftarrow"></div>
      <div class="centerCase">
        <ul class="ulIndexCase">
          <%=xycms_xycase()%>
        </ul>
      </div>
      <div class="rightarrow"></div>
      <div class="clear"></div>
    </div>
	<script type="text/javascript">
	  $(".centerCase").jCarouselLite({
	  btnNext: ".rightarrow",
	  btnPrev: ".leftarrow",
	  visible:5,
	  scroll: 1,
	  auto: 3000,
	  speed: 1000
	   });
     </script>
  </div>
</div>
<!--#include file="foot.asp"-->
</body>
</html>
