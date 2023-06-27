<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<style>
header.masthead {
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function readURL(input){
		var file = input.files[0]//파일에 대한 정보
		console.log(file)
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file) //파일의 정보를 토대로 파일을 읽어옴
			reader.onload = function(e){ // 파일(이미지) 표현
				console.log(e)
				console.log(e.target)
				console.log(e.target.result)
				$("#preview").attr('src', e.target.result)
			}
		}
	}
</script>
<br />
<br />
<div class="container">
	<div class="row">
	<div class="col-lg-12">
	<div class="card">
	<div class="card-header text-white"	style="background-color: #8b7ca8;">게시글 등록</div>
	<div class="card-body">
		<form role="form" method="post" enctype="multipart/form-data">
			<div class="form-group" hidden="hidden">
				<label>작성자</label>
				<input type="hidden" class="form-control" name='writer' value="${login.nick}">
			</div>
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control"	name='title'>
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="5" name='content' placeholder="게시글 내용을 입력하세요."></textarea>
			</div>
			<div class="form-group">
				<label>제품명</label> 
				<input type="text" class="form-control"	name='pName'>
			</div>
			<div class="form-group">
				<label>제조사</label>
				<input type="text" class="form-control"	name='pMake'>
			</div>
			<div class="form-group">	
			<label>이미지파일 첨부</label>
				<input type="file" class="form-control" name="image_file_name" onchange="readURL(this)">
				<img id="preview" src="#" width="100px" height="100px">
			</div>
				
			<input type="submit" value="등록" class="btn form-control" 
			style="background-color: #8b7ca8; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
			&nbsp;&nbsp; 
			<a class="btn form-control" href="/smd/board/list"	
			style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">취소</a>

		</form>
	</div>
	</div>
	</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />