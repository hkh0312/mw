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
<style>

.form-group{
	width: 60%;
    margin-left: 20%;
    margin-top: 20px;
    border: 1px solid #dbdde2;
    background-color: #efefef;	
}
.form-group-title{
	padding: 20px 35px;	
}
.form-group-title label{
	display: block;
    font-size: 20px;
    font-weight: 800;
}

.input {
	width: 950px;
    height: 25px;
    font-size: 20px;
    padding: 15px 2%;
    margin:center;
}


/* 버튼 영역 */
.btn-group{
	width: 30%;
    margin-left: 35%;
    margin-top: 10px;
	text-align: center;
}
.btn{
    min-width: 180px;
    padding: 4px 30px;
    font-size: 25px;
    font-weight: 600;
    line-height: 40px;
}
.btn-secondary{
	background-color: #dbdde2;
	margin-left:15px;
}
#btnRegister:hover {
    background-color: #c9cbd0;
}

#btnList:hover {
    background-color: #c9cbd0;
}



</style>

<script>

$(document).ready(function(){

	//등록버튼 클릭시
	$("#btnRegister").click(function(e){
		e.preventDefault();
// 		$("#frmVendor").submit();
		var v_category = $("select[name=v_category]").val();
		var v_category1=v_category.substring(0,2);
		var v_local = $("select[name=v_local]").val();
		
		console.log("v_category:"+v_category);
		console.log("v_category1:"+v_category1);
		console.log("v_local:"+v_local);
		
		var catecode = v_category1 + v_local;
		var v_no =$("#v_no").val();
		var v_name = $("#v_name").val();
		var v_pic = $("#v_pic").val();
		var v_link = $("#v_link").val();
		var v_score = $("#v_score").val();
		var v_adress = $("#v_adress").val();
		var v_number = $("#v_number").val();
		var v_type = $("#v_type").val();
		

 		location.href="/admin/register?v_no=" + v_no + "&cateCode=" + catecode +"&v_name="+ v_name + "&v_pic=" + v_pic + "&v_link=" + v_link + "&v_score=" + v_score + "&v_adress=" + v_adress + "&v_number=" + v_number + "&v_type="+ v_type;
	});
	
	//목록버튼 클릭시
	$("#btnList").click(function(e){
		e.preventDefault();
		location.href="/admin/list";
	})

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
						<h2>관리자 등록화면</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- our plane -->	

	
	
	<div class="row">
		<div class="col-md-12">
<!-- 			<form role="form" action="/admin/register" method="post" id="frmVendor"> -->
			
				<div class="form-group">
					<div class="form-group-title">
						<label>글번호</label>
						<input type="text" class="input" name="v_no" id="v_no" />
						
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>카테고리</label>
<!-- 						<input type="text" class="input" name="cateCode" id="cateCode"/> -->
						<div class="input-group">

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
		
					</div>
				</div>	

				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>이름</label>
						<input type="text" class="input" name="v_name" id="v_name"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>사진</label>
						<input type="text" class="input" name="v_pic" id="v_pic"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>홈페이지 주소</label>
						<input type="text" class="input" name="v_link" id="v_link"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>점수</label>
						<input type="text" class="input" name="v_score" id="v_score"/>
					</div>
				</div>
				
				
				<div class="form-group">
					<div class="form-group-title">
						<label>주소</label>
						<input type="text" class="input" name="v_adress" id="v_adress"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>전화번호</label>
						<input type="text" class="input" name="v_number" id="v_number"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>내용</label>
						<input type="text" class="input" name="v_type" id="v_type"/>
					</div>
				</div>
				
<!-- 			</form> -->
			<div class="btn-group">
				<button id="btnRegister" class="btn btn-secondary">등록 완료</button>
			</div>
			<div class="btn-group">
				<button id="btnList" class="btn btn-secondary">목록가기</button>
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