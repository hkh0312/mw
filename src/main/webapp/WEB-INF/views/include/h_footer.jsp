<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 축하 메세지 남기기 -->
	<div id="fh5co-started" class="fh5co-bg" style="background-image:url(/create_tempH/images/img_bg_4.jpg);">
		<div id="msgleave" class="overlay"></div>
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>축복해 주세요</h2>
					<p style="margin:20px 0px 20px;">축복의 말을 전하고 싶으시다면 축하 메세지를 남겨주세요.</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-5 col-md-offset-1" style="margin-left: 29.3%;">
					<form>
						<div class="col-md-12 col-sm-4">
							<div class="form-group">
								<textarea class="form-control" id="msgcontent" placeholder="내용을 입력하세요." 
									style="font-family: 'SimKyungha'; resize:none;"
									maxlength="156" rows="4"></textarea>
							</div>
						</div>
						
						<div class="col-md-6 col-sm-2">
							<div class="form-group" style="margin-right:10px;">
								<input type="text" class="form-control" id="name" 
									placeholder="이름을 입력하세요." maxlength="6" style="font-family:'SimKyungha';">
							</div>
						</div>
						<div class="col-md-6 col-sm-2">
							<div class="form-group">
								<input type="password" class="form-control" id="pwd" 
									placeholder="비밀번호를 입력하세요." maxlength="10" style="font-family:'SimKyungha';">
							</div>
						</div>
						<div class="col-md-7 col-sm-4">
							<input type="file" style="display:none">
							<h2 style="margin-top:15px; margin-left:10px; font-size:20px; color:white;"
								>apple.jpg</h2>
						</div>
						<div class="col-md-3 col-sm-4">
							<button type="button" class="btn btn-default btn-block">파일 선택</button>
						</div>
						<div class="col-md-2 col-sm-4">
							<button type="submit" class="btn btn-default btn-block">남기기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	</body>
</html>    