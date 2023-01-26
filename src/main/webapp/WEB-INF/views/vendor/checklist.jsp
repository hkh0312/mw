<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>MW</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="/css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="/css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="/images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="/css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

<!-- 부트스트랩CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<script>
	
	//체크박스 값 넘기기
	


</script>

	
<style>
h3, h1 {
	margin : 20px;
	text-align:center;
}

.td_day{
	size:50px;
}

.td_todo{
	size:50px;
}

#btnTwo{
	text-align:right;
}

.table{
 padding : 30px 0;

}


</style>	
	
	
	

<!-- body -->
<body class="main-layout inner_page">
	<!-- loader  -->
	<!-- 	<div class="loader_bg"> -->
<!-- 		<div class="loader"> -->
<!-- 			<img src="/images/loading.gif" alt="#" /> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- end loader -->
	<!-- header -->
	<header class="full_bg">
		<!-- header inner -->
		<div class="header">
			<div class="container">
				<div class="row">
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
						<div class="full">
							<div class="center-desk">
								<div class="logo">
									<a href="#">MW<small>merry wedding</small></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
						<nav class="navigation navbar navbar-expand-md navbar-dark ">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample04"
								aria-controls="navbarsExample04" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarsExample04">
								<ul class="navbar-nav mr-auto">
									<li class="nav-item "><a class="nav-link" href="#">Home</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="#">About</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="#">Service</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="#">Blog</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="#">Contact
											Us</a></li>
									<li class="nav-item active"><a class="nav-link" href="list">Wedding
											Planner</a></li>
								</ul>
							</div>
							<ul class="search">
								<li><a href="Javascript:void(0)"><i
										class="fa fa-search" aria-hidden="true"></i></a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- end header inner -->
		<!-- end header -->
		<!-- banner -->
	</header>
	<!-- end banner -->
	<div class="back_re">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="title">
						<h2>Wedding Planner</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- our plane -->	

	
	<!-- 체크리스트 -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<table class="table">
							<h3>웨딩체크리스트</h3>
							<h1>Wedding CheckList</h1>
							<thead>
								<tr>
									<th width="150">DAY</th>
									<th width="300">LIST</th>
									<th>CONTENT</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="td_day"> D-180 </td>
									<td class="td_todo"><input type="checkbox" id="wHall"> 결혼예식장 알아보기 </td>
									<td> 예식일이 결정되면, 약 3~6개월 전부터 예식장 예약하는 것이 좋으며,
									 예식장 선택시에는 양가 하객수와 주차/교통편, 예식간격/홀 분위기, 가격을 고려하는 것이 권해드립니다.</td>
								</tr>
								<tr class="table-active">
									<td class="td_day"> D-120 </td>
									<td class="td_todo"><input type="checkbox" id="wDress"> 드레스샵 결정하기 </td>
									<td> 예식일 2~3개월 전에 예약하는 것이 좋으며, 웨딩촬영일/본식일정, 대여비용을 고려하는 것을 권해드리고,
									 샵 방문시 웨딩드레스에 어울리는 모습으로 방문하시거나 최신 트렌드를 미리 수집하고 가시는 것도 좋습니다. </td>
								</tr>
								<tr class="table-active">
									<td></td>
									<td class="td_todo" ><input type="checkbox" id="wPhoto"> 촬영 스튜디오 결정하기 </td>
									<td> 예식일 2개월 전에 예약하는 것이 좋으며, 스튜디오의 사진 분위기, 야외/실내 위주, 본식 영상 제공여부,
									사진 컷수를 고려하여 선택하는 것을 권해드립니다. </td>
								</tr>
								<tr class="table-active">
									<td></td>
									<td class="td_todo" ><input type="checkbox" id="wBeauty"> 헤어/메이크업샵 결정하기 </td>
									<td> 예식일 2개월 전에 예약하는 것이 좋으며, 예식장과의 거리, 헤어/메이크업샵의 포트폴리오를 고려하여 선택하는 것을
									권해드립니다.</td>
								</tr>

								<tr class="table-active">
									<td class="td_day" > D-50 </td>
									<td class="td_todo"><input type="checkbox" id="wShoot"> 스튜디오 웨딩촬영하기 </td>
									<td> 사진 촬영후, 대략 35일 내외의 시간이 소요되므로 여유있게 준비하셔서 완성도 있는 앨범을
									받아보시길 바랍니다. </td>
								</tr>
								<tr>
									<td class="td_day"> D-30 </td>
									<td class="td_todo"><input type="checkbox" id="wCard"> 청첩장 주문하기 </td>
									<td> 결혼식에 참석할 사람들을 미리 선정해 청첩장을 주문해야 합니다. 완선된 청첩장은 약 1달~보름정도
									전부터는 하객분들께 발송하시길 바랍니다. </td>
								</tr>
								<tr>
									<td></td>
									<td class="td_todo"><input type="checkbox" id="wHelper"> 주례/사회자/도우미 섭외하기 </td>
									<td> 결혼식의 주례자, 사회를 맡아줄 사회자, 축가단/축주단/들러리 등 결혼식 전반에 걸쳐 도움을 주는
									사람들을 선정하길 바랍니다. </td>
								</tr>
								<tr class="table-active">
									<td class="td_day" > D-7 </td>
									<td class="td_todo"><input type="checkbox" id="wFlower"> 본식 드레스 가봉 및 부케 선정하기 </td>
									<td> 예식일 보름~1주일 전에 드레스 샵을 방문해, 최종적으로 드레스와 예복을 입어보고 확인하시길 바라며,
									드레스/예복과 예식장 분위기에 맞는 색과 디자인의 부케를 주문하시길 바랍니다. </td>
								</tr>
								<tr class="table-active">
									<td class="td_day" ></td>
									<td class="td_todo"><input type="checkbox" id="wFinal"> 예식 최종확인하기 </td>
									<td> 예식장과 드레스, 본식 사진 촬영, 피로연, 메이크업/헤어샵에 전화 혹은 문의후 일정을 정확히
									확인하시길 바랍니다. </td>
								</tr>
								<tr>
									<td>D-day</td>
									<td class="td_todo"><input type="checkbox"> ♥ </td>
									<td> ♥ </td>
								</tr>
							</tbody>
						</table>
						<div id="btnTwo">
						<input type="button" value="인쇄하기" id="print" onclick="window.print()"/>
<!-- 						<input type="button" value="저장하기" id="print" onclick="#"/> -->
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>








	<!-- our plane -->
<!--  footer -->
<footer>
	<div class="footer">
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<p>
							© 2019 All Rights Reserved. <a href="https://html.design/">
								Free Html Templates</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- end footer -->
<!-- Javascript files-->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/jquery-3.0.0.min.js"></script>
<!-- sidebar -->
<script src="/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/js/custom.js"></script>
</body>
</html>	