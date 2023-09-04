<div id="head">
  <div class="top"><span></span></div>
  <div class="header">
    <h1 class="logo"><img src="<%=wzlogo%>" /></h1>
    <div class="xy_txt">
      <div class="search">
      <form name="search" action="search.asp" method="get">
        <input type="text" class="input_s" id="word" onmousedown="this.value='';this.style.color='#333';" value="输入关键字 如：XYCMS建站系统" name="word" autocomplete="off" />
        <input type="image" class="btn2" id="search_ks" src="images/search.jpg" >
      </form>
       </div>
    </div>
    <div class="clear"></div>
  </div>
  <div class="nav">
    <ul>
      <%=xycms_menu(1)%>
    </ul>
  </div>
</div>
<div id="focus">
  <div class="f_l">
    <%=xycms_flash(1000,220)%>
  </div>
</div>