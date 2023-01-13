<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
table.table2{
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin : 20px 10px;
 }
table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	border-bottom: 1px solid #ccc;
 }
table.table2 td {
    width: 100px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.table2 th{
	text-align: center;
	width: 100px;
	background-color: #ccc;
}
button {
	background-color: #666666; 
	border: none;
	color: white;
	padding: 10px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<script>
$(document).ready(function(){
	if(${qnaVo.re_seq} == 1){
		$("#btnDelete").hide();
		$("#btnModify").hide();
		$("#btnReply").hide();
	}
	
	
});

</script>
  <!-- end banner -->
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>고객 문의</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- blog -->
      <div class="blog">
        <div class="container" id="container">
	    <form id="frm" method="post" action="/qna/modify">
        <table  style="padding-top:50px; margin:auto; width:800px; border:0; cellpadding:2 ">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white>문의 내용</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                		<tr>
                        <th>글번호</th>
                        <td colspan="3"><input type="number" id="c_no" name="c_no" style="border: none; background: transparent;" value="${qnaVo.c_no }" readonly></td>
                        </tr>
 
                        <tr>
                        <th>작성자</th>
                        <td><input type="text" id="c_id" name="c_id" placeholder="이름을 입력하세요." value="${qnaVo.c_id }" style="border: none; background: transparent;" readonly></td>
                        <th  width="100">작성일</th>
                        <td><input type="text" id="c_date" name="c_date" value="${qnaVo.c_date }" style="border: none; background: transparent;" readonly></td>
                        </tr>
                        
                        <tr>
                        <th>제목</th>
                        <td colspan="3"><input type="text" id="c_title" name="c_title" placeholder="제목을 입력하세요." size=60 value="${qnaVo.c_title }"></td>
                        </tr>
                        
                        <tr>
                        <th>내용</th>
                        <td colspan="4"><textarea cols=85 rows=15 id="c_content" name="c_content" placeholder="내용을 입력하세요.">${qnaVo.c_content }</textarea></td>
                        </tr>
 
<!--                         <tr> -->
<!--                         <td>비밀번호</td> -->
<!--                         <td><input type = password name = pw size=10 maxlength=10></td> -->
<!--                         </tr> -->
                        </table>
                </td>
                </tr>
        </table>
        <div class="row"  style="float:right; margin-right:220px">
       		<a href="/qna/list?page=${pagingDto.page }&perPage=${pagingDto.perPage}"><button type="button" style="background-color:#ccc">목록으로</button></a>
       		<button id="btnModify" type="submit" style="background-color:#ccc">수정</button>
       		<a href="/qna/delete?c_no=${qnaVo.c_no }&page=${pagingDto.page}&perPage=${pagingDto.perPage}"><button id="btnDelete" type="button" style="background-color:#ccc">삭제</button></a>
		    <a href="/qna/reply?c_no=${qnaVo.c_no }&page=${pagingDto.page}&perPage=${pagingDto.perPage}"><button id="btnReply" type="button">답변</button></a>
		</div>
        </form>
         </div>
      </div>

<%@ include file="../include/footer.jsp" %>