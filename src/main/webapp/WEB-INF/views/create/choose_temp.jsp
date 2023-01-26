<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>
<script>
$(document).ready(function() {
	$("#temp_h").click(function() {
		$(location).attr('href', '/create/insert_info');
	});
	
	$("#temp_y").click(function() {
		$(location).attr('href', '/create/form');
	});
	
	$(".imgdiv_dark").hover(function() {
		$(this).children().first().css("filter", "brightness(0.45)");
		$(this).children().last().show();
		
	}, function() {
		$(this).children().first().css("filter", "brightness(1)");
		$(this).children().last().hide();
	});
	
	$(".text_dark").hover(function() {
		$(this).show();
	});
});
</script>
	  <!-- banner -->
      </header>
      <!-- end banner -->
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>페이지 템플릿 선택</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- our plane -->
      <div class="plane">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div class="titlepage">
                     <h3>아래의 두 가지 템플릿 중에서 마음에 드는 템플릿을 선택해주세요.</h3>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-6">
                  <div class="plan_bax text_align_center">
                  	 <div class="wrapdiv_dark">
	                  	 <div class="imgdiv_dark">
	                  	 	<img class="img_dark" src="/main_temp/images/plan_img.jpg" alt="#">
	                  	 	<p class="text_dark" style="display:none"><a href="#" style="color: white">템플릿 미리보기</a></p>
	                  	 </div>
                  	 </div>
                  	 <div id="temp_y" class="plan_text template_box">
                        <h3>예은's템플릿</h3>
                        <p style="padding:20px 0 0">예은언니의 템플릿입니다.<br>
                        	만드려면 클릭하세요.</p>
                     </div>
                  </div>
               </div>
               
               <div class="col-md-6">
                  <div class="plan_bax text_align_center">
                  	 <div class="wrapdiv_dark">
	                  	 <div class="imgdiv_dark">
	                  	 	<img class="img_dark" src="/main_temp/images/plan_img1.jpg" alt="#">
	                  	 	<p class="text_dark" style="display:none"><a href="#" style="color: white">템플릿 미리보기</a></p>
	                  	 </div>
                  	 </div>
                     <div id="temp_h" class="plan_text template_box">
                        <h3>혜령's템플릿</h3>
                        <p style="padding:20px 0 0">혜령이의 템플릿입니다.<br>
                        	만드려면 클릭하세요.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- our plane -->
<%@ include file="../include/m_footer.jsp" %>