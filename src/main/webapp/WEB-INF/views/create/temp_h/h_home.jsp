<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/h_header.jsp"%>
	<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(/create_tempH/images/img_bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<%@ include file="/WEB-INF/views/include/h_header_title.jsp"%>
		</div>
	</header>

	<div id="fh5co-couple">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<figure><img class="rborder_img" style="margin-bottom:20px; height:500px;" 
						src="/create_tempH/images/img_bg_2.jpg"></figure>
					<h2>결혼 날짜</h2>
					<h3>결혼 장소</h3>
					<h3>신랑이름 &amp; 신부이름</h3>
					<p id="homeIntro">함께 키워온 두 사람의 사랑이 결실을 맺게 되었습니다.<br>
						저희의 결혼식에 소중한 인연이 되어주신 당신을 초대합니다.<br>
						바쁘시더라도 귀한 걸음으로 축복해 주시면<br>
						더 없는 기쁨으로 간직하겠습니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 결혼식 행사 일정 -->
	<div id="fh5co-event" class="fh5co-bg" style="background-image:url(/create_tempH/images/img_bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<span>WEDDING EVENTS</span>
					<h2>결혼식 일정 안내</h2>
				</div>
			</div>
			<div class="row">
				<div class="display-t">
					<div class="display-tc">
						<div class="col-md-12 col-sm-6 text-center">
							<div style="padding:0px 200px;">
							<div class="event-wrap animate-box" style="width:100%;">
								<h3>진행 순서</h3>
									<div class="event-col">
										<div style="margin:10px 0px 20px;">
											<i class="icon-clock"></i>
										</div>
										<span style="font-size: 18px; margin-bottom:10px;">시작시간 ~ 종료시간</span>
										<span style="font-size: 18px; margin-bottom:10px;">오전 00시 00분 ~ 오후 00시 00분</span>
										<span style="font-size: 18px; margin-bottom:10px;">. . .</span>
									</div>
									<div class="event-col">
										<div style="margin:10px 0px 20px;">
											<i class="icon-calendar"></i>
										</div>
										<span style="font-size: 18px; margin-bottom:10px;">행사명</span>
										<span style="font-size: 18px; margin-bottom:10px;">결혼식 진행</span>
										<span style="font-size: 18px; margin-bottom:10px;">. . .</span>
									</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 지인 댓글 미리보기(최신순 top5) -->
	<div id="fh5co-testimonial">
		<div class="container">
			<div class="row">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<span>MESSAGES</span>
						<h2>축복의 메세지</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 animate-box">
						<div class="wrap-testimony">
							<div class="owl-carousel-fullwidth">
								<div class="item">
									<div class="testimony-slide active text-center">
										<div>
											<img src="/create_tempH/images/groom.jpg" alt="user">
										</div>
										<span style="margin-top:30px; font-size:23px;">작성자 이름1</span>
										<span>0000년 00월 00일 00시 00분</span>
										<blockquote>
											<p class="Anssang">"친구야 결혼 축하한다. 행복하게 잘 살아라~"</p>
										</blockquote>
									</div>
								</div>
								<div class="item">
									<div class="testimony-slide active text-center">
										<div>
											<img src="/create_tempH/images/bride.jpg" alt="user">
										</div>
										<span style="margin-top:30px; font-size:23px;">작성자 이름2</span>
										<span>0000년 00월 00일 00시 00분</span>
										<blockquote>
											<p class="Anssang">"친구야 결혼 축하한다. 행복하게 잘 살아라~"</p>
										</blockquote>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/h_footer.jsp"%>