<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
<style>
.form-control {
     border: 1px solid #EDEDED;
     background-color: #FFFFFF;
     height: 20px     
}

.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

</style>

<script>
$(document).ready(function(){
	
	//카테고리 검색 클릭시
	$("#btnSearch").click(function() {
		var v_category = $("select[name=v_category]").val();
		var v_local = $("select[name=v_local]").val();
		location.href="/admin/list?v_category=" + v_category + "&v_local=" + v_local;
	});
	
	
	//삭제버튼 클릭시
	$(".btnRemove").click(function(e){
 		e.preventDefault();
		var v_no = $(this).attr("data-vno");
		console.log(v_no);
		location.href="/admin/delete?v_no="+v_no;
	});

	
	// 페이지 번호
	$(".page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("href");
		var perPage = 12;
		
		location.href = "/admin/list?page="+page+"&perPage="+perPage;
	});
	
	//업체등록하기
	$("#btnInsert").click(function() {
		location.href="/admin/register";
	});
	
});



</script>	
	

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
									<li class="nav-item active"><a class="nav-link" href="#">Wedding
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
						<h2>관리자 화면</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- our plane -->



	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">

				<!-- 카테고리 -->
				<div id="searchBox" style="margin-left: 80px">
					<form id="frmSearch"
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<input type="hidden" name="orderby" value="v_no" />

						<div class="input-group" style="margin-left: 70px; margin-top: 70px;">

							<select class="form-control" name="v_category">
								<option value="100"
									<c:if test="${pagingVo.v_category == '100'}">selected</c:if>>Wedding
									Hall</option>

								<option value="200"
									<c:if test="${pagingVo.v_category == '200'}">selected</c:if>>Wedding
									Dress</option>

								<option value="300"
									<c:if test="${pagingVo.v_category == '300'}">selected</c:if>>Beauty
								</option>

								<option value="400"
									<c:if test="${pagingVo.v_category == '400'}">selected</c:if>>Gifts
								</option>
							</select> 
							<select class="form-control" name="v_local" >
								<option value="1"
									<c:if test="${pagingVo.v_local == '1'}">selected</c:if>>서울시
								</option>

								<option value="2"
									<c:if test="${pagingVo.v_local == '2'}">selected</c:if>>광주광역시
								</option>

								<option value="3"
									<c:if test="${pagingVo.v_local == '3'}">selected</c:if>>인천광역시
								</option>

								<option value="4"
									<c:if test="${pagingVo.v_local == '4'}"> selected </c:if>>부산광역시
								</option>

								<option value="5"
									<c:if test="${pagingVo.v_local == '5'}"> selected </c:if>>울산광역시
								</option>
							</select>

							<div class="input-group-append">
								<button id="btnSearch" class="btn btn-secondary" type="button">검색하기</button>
							</div>
							<div class="input-group-append">
								<button id="btnInsert" class="btn btn-secondary" type="button">등록하기</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>




		<!-- 테이블 -->
		<div class="row">
			<div class="col-md-12"
				style="padding-top: 80px; padding-left: 160px; padding-right: 160px;">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>업체번호</th>
							<th>업체코드</th>
							<th>업체명</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="vendorVo">
							<c:set var="code" value="${vendorVo.cateCode}" />
							<tr>
								<td>${vendorVo.v_no}</td>
								<td><c:if test="${fn:substring(code,0,1) eq 1}">
								웨딩홀/ 
							</c:if> <c:if test="${fn:substring(code,0,1) eq 2}">
								웨딩드레스/ 
							</c:if> <c:if test="${fn:substring(code,0,1) eq 3}">
								헤어,메이크업/ 
							</c:if> <c:if test="${fn:substring(code,0,1) eq 4}">
								답례선물/ 
							</c:if> <c:if test="${fn:substring(code,2,3) eq 1}">
								서울시 
							</c:if> <c:if test="${fn:substring(code,2,3) eq 2}">
								광주광역시
							</c:if> <c:if test="${fn:substring(code,2,3) eq 3}">
								인천광역시 
							</c:if> <c:if test="${fn:substring(code,2,3) eq 4}">
								부산광역시 
							</c:if> <c:if test="${fn:substring(code,2,3) eq 5}">
								울산광역시
							</c:if></td>
								<td>${vendorVo.v_name}</td>
								<td><a href="#" class="btn btn-secondary btnRemove"
									data-vno="${vendorVo.v_no}">삭제</a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<!-- 페이지이동 -->
		<div class="row">
			<div class="col-md-12">
				<nav>
					<ul class="pagination justify-content-center">
					<c:if test="${pagingVo.startPage ne 1}">
						<li class="page-item">
							<a class="page-link" href="${pagingVo.startPage - 1}">이전</a>
						</li>
					</c:if>
					<c:forEach var="p" begin="${pagingVo.startPage}" end="${pagingVo.endPage}">
						<li 
							<c:choose>
								<c:when test="${pagingVo.page eq p}">
									class="page-item active"
								</c:when>
								<c:otherwise>
									class="page-item"
								</c:otherwise>
							</c:choose>
						>
							<a class="page-link" href="${p}">${p}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pagingVo.endPage lt pagingVo.totalPage}">	
						<li class="page-item">
							<a class="page-link" href="${pagingVo.endPage + 1}">다음</a>
						</li>
					</c:if>	
					</ul>
				</nav>
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