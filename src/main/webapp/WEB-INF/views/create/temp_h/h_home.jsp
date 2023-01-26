<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/h_header.jsp"%>

	<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(/create_tempH/images/img_bg_2.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>신랑 &amp; 신부</h1>
							<h2>1234년 56월 78일,<br>결혼합니다.</h2>
							<a id="msgicon" href="#msgleave"><i class="fa fa-envelope" aria-hidden="true" style="margin-right:10px;"></i
								>축하 메세지 남기기</a>
						</div>
					</div>
				</div>
			</div>
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
					<h3>신랑 &amp; 신부</h3>
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
						<div class="col-md-10 col-md-offset-1">
							<div class="col-md-12 col-sm-6 text-center">
								<div class="event-wrap animate-box">
									<h3>Main Ceremony</h3>
										<div class="event-col">
											<div style="margin:10px 0px 20px;">
												<i class="icon-clock"></i>
											</div>
											<span style="font-size: 18px; margin-bottom:10px;">시작시간 ~ 종료시간</span>
											<span style="font-size: 18px; margin-bottom:10px;">시작시간 ~ 종료시간</span>
										</div>
										<div class="event-col">
											<div style="margin:10px 0px 20px;">
												<i class="icon-calendar"></i>
											</div>
											<span style="font-size: 18px; margin-bottom:10px;">행사명</span>
											<span style="font-size: 18px; margin-bottom:10px;">행사명</span>
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
											<img src="/create_tempH/images/apple.jpg" alt="user">
										</div>
										<span style="margin-top:30px; font-size:23px;">작성자 이름</span>
										<span>입력 날짜, 시간</span>
										<blockquote>
											<p class="Anssang">"친구야 결혼 축하한다. 행복하게 잘 살아라~"</p>
										</blockquote>
									</div>
								</div>
								<div class="item">
									<div class="testimony-slide active text-center">
										<div>
											<img src="/create_tempH/images/kiwi.jpg" alt="user">
										</div>
										<span style="margin-top:30px; font-size:23px;">작성자 이름</span>
										<span>입력 날짜, 시간</span>
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