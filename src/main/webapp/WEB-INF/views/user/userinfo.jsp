<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>
	<!-- style스타일 입니다. -->
	<style>
	.form_menu{
	font-size:25px;
	}
	</style>
	</head>
	<!-- script입니다. -->
	<script>
	$(document).ready(function(){
		$("#btnmodify").click(function(e){
			e.preventDefault();
			$("#frminfo").attr("method", "post"); 
			$("#frminfo").attr("action","/user/modify").submit();
		});
		$("#btnwithdraw").click(function(e){
			e.preventDefault();
			if (confirm("정말로 삭제하시겠습니까?")) {
				  txt = "네";
					$("#frminfo").attr("method", "post"); 
					$("#frminfo").attr("action", "/user/withdraw").submit();
				} else {
				  txt = "아니오";
				}
		
		});
	});
	</script>
	
	<!-- end banner -->
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>마이페이지</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
    <!-- table -->
    <div class="container-fluid"  style="min-height: 700px;">
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<div class="row">
				<div class="col-md-12">
				<p class="form_menu" style="margin-top: 15px; color:black">${vo.userid} 님 반갑습니다.</p>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12">
				<a href="/user/inputpassword" class="form_menu">개인정보수정</a>
				</div>
				<br>
			</div>
		</div>
		<div class="col-md-9" style="padding:20px">
				<div class="col-md-12">
					<form role="form" id="frminfo">
						<div class="form-group">
							<label for="userid"> 아이디 </label> <input
								type="text" class="form-control" id="userid" name="userid" value="${vo.userid }" readonly />
						</div>
						<div class="form-group">
							<label for="userpw"> 비밀번호 </label> <input
								type="password" class="form-control" id="userpw" name="userpw" value="${vo.userpw }"/>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"> Email address </label> <input
								type="email" class="form-control" id="exampleInputEmail1" name="email" value="${vo.email}"/>
						</div>
						<div class="form-group">
							<label for="username"> 이름 </label> <input
								type="text" class="form-control" id="username" name="username" value="${vo.username}" />
						</div>
						<div class="form-group">
							<label for="phonenum"> 전화번호 </label> <input
								type="text" class="form-control" id="phonenum" name="phonenum" value="${vo.phonenum}" />
						</div>
						<div class="form-group">
							<label for="phonenum"> 사이트주소 </label> <input
								type="text" class="form-control" id="url" name="url" value="${vo.url}"/>
						</div>
						<button type="submit" id="btnmodify" class="btn btn-primary">수정</button>
						<button type="submit" id="btnwithdraw"  class="btn btn-danger">회원탈퇴</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../include/m_footer.jsp" %>