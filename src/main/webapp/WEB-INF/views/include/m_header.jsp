<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <link rel="stylesheet" href="/main_temp/css/bootstrap.min.css">
   <!-- style css -->
   <link rel="stylesheet" href="/main_temp/css/style.css">
   <!-- Responsive-->
   <link rel="stylesheet" href="/main_temp/css/responsive.css">
   <!-- fevicon -->
   <link rel="icon" href="/main_temp/images/fevicon.png" type="image/gif" />
   <!-- Scrollbar Custom CSS -->
   <link rel="stylesheet" href="/main_temp/css/jquery.mCustomScrollbar.min.css">
   <!-- Tweaks for older IEs-->
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
   <!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
   <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  
   <!-- Javascript files-->
   <script src="/main_temp/js/jquery.min.js"></script>
   <script src="/main_temp/js/bootstrap.bundle.min.js"></script>
   <script src="/main_temp/js/jquery-3.0.0.min.js"></script>
   <!-- sidebar -->
<!--    <script src="/main_temp/js/jquery.mCustomScrollbar.concat.min.js"></script> -->
<!--    <script src="/main_temp/js/custom.js"></script> -->
   <script>
   $(document).ready(function(){
         if("${update}"=="success"){
         alert("정보가 변경되었습니다. 다시 로그인해주세요");        
         }
         
   });
   </script>
</head>
<!-- body -->
<body class="main-layout">
   <!-- loader  -->
<!--       <div class="loader_bg"> -->
<!--          <div class="loader"><img src="/images/loading.gif" alt="#"/></div> -->
<!--       </div> -->
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
	                        <a href="/main/home_form">MW</a>
	                     </div>
	                  </div>
	               </div>
	            </div>
	            <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
	               <nav class="navigation navbar navbar-expand-md navbar-dark ">
	                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
	                  <span class="navbar-toggler-icon"></span>
	                  </button>
	                  <div class="collapse navbar-collapse" id="navbarsExample04">
	                     <ul class="navbar-nav mr-auto">
	                        <li class="nav-item active" id="ctgHome">
	                           <a class="nav-link" href="/main/home_form">Home</a>
	                        </li>
	                        <li class="nav-item" id="ctgPlanner">
	                           <a class="nav-link" href="/vendor/list">Planner</a>
	                        </li>
	                        <li class="nav-item" id="ctgCreate">
	                           <a class="nav-link" href="/main/create_form">Create My Page</a>
	                        </li>
	                        <li class="nav-item" id="ctgQna">
	                           <a class="nav-link" href="/qna/list">QnA</a>
	                        </li>
	                        <c:choose>
										<c:when test="${empty loginInfo}">
										<!-- 로그인이 되어 있지 않은 경우 -->
											<li>
											<a href="/user/login"><i class="nav-link fa fa-user"
												id="loginpage" aria-hidden="true">Login</i></a>
											</li>
										</c:when>
										<c:otherwise>
											<!-- 로그인이 된 경우 -->
											<!-- 관리자인 경우 -->
											<c:choose>
												<c:when test="${loginResult eq 'manager'}">
													<div class="dropdown">
														<p class="fa dropdown-toggle" type="button"
															data-toggle="dropdown">
															관리자님 환영합니다.
														</p>
														<ul class="dropdown-menu">
															<li><a href="/admin/page">관리자페이지로 가기</a></li>
															<li><a href="/user/logout">로그아웃</a></li>
														</ul>
													</div>
												</c:when>
												<c:otherwise>
													<div class="dropdown">
														<p class="fa dropdown-toggle" type="button"
															data-toggle="dropdown">
															${loginInfo.userid}님 환영합니다.
														</p>
														<ul class="dropdown-menu">
															<li><a href="/user/inputpassword">마이페이지</a></li>
															<li><a href="/user/logout">로그아웃</a></li>
														</ul>
													</div>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
	                     </ul>
	                  </div>
	               </nav>
	            </div>
	         </div>
	      </div>
	   </div>
	   <!-- end header inner -->
	   <!-- end header -->
</header>
	  