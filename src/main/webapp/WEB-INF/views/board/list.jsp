<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 포맷팅 관련 태그라이브러리(JSTL/fmt) --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />
<style>
header.masthead {
	display: none;
}

.btn-orange {
	background-color: orange;
	color: white;
}

.btn-izone {
	background-color: #8b7ca8;
	color: white;
}

.page-active {
	background-color: #8b7ca8;
}
</style>

<br>
<br>

<!-- Begin Page Content -->


<div class="container">
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div class="panel-body">
				<h2 class="page-header">
					자유 게시판 <span id="count-per-page" style="float: right;"> <input
						class="btn btn-izone" type="button" value="10"> <input
						class="btn btn-izone" type="button" value="20"> <input
						class="btn btn-izone" type="button" value="30">
					</span>

				</h2>
				<table class="table table-bordered table-hover">
					<thead>
						<tr
							style="background-color: #8b7ca8; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							<th>#번호</th>
							<th>작성자</th>
							<th>제품명</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:if test="${articles.size() <= 0}">
						<tr>
							<td colspan="5" align="center"><strong>검색 결과가
									없습니다!!</strong></td>
						</tr>
					</c:if>

					<!-- 게시물이 들어갈 공간 -->
					<c:if test="${articles.size() > 0}">
						<c:forEach var="b" items="${articles}">
							<tr style="color: #5ca5ff;">
								<td>${b.boardNo}</td>
								<td>${b.writer}</td>
								<td>${b.pName}</td>

								<td><a style="margin-top: 0; height: 40px; color: orange;"
									href="<c:url value='/board/content/${b.boardNo}${param.page == null ? pc.makeURI(1) : pc.makeURI(param.page)}' />">
										${b.title} </a> &nbsp; <c:if test="${b.newMark}">
										<span class="badge badge-pill badge-danger">new</span>
									</c:if>
								<td><fmt:formatDate value="${b.regDate}"
										pattern="yyyy.MM.dd. HH:mm" /></td>
								<td>${b.viewCnt}</td>
							</tr>
						</c:forEach>
						</c:if>
				</table>

				<!-- 페이징 처리 부분  -->
				<ul class="pagination justify-content-center">
					<!-- 이전 버튼 -->
					<c:if test="${pc.prev}">
						<li class="page-item"><a class="page-link"
							href="<c:url value='/board/list${pc.makeURI(pc.beginPage - 1)}' />"
							style="background-color: #8b7ca8; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
						</li>
					</c:if>

					<!-- 페이지 버튼 -->
					<c:forEach var="pageNum" begin="${pc.beginPage}"
						end="${pc.endPage}">
						<li class="page-item"><a
							href="<c:url value='/board/list${pc.makeURI(pageNum)}'/>"
							class="page-link ${pc.paging.page == pageNum ? 'page-active' : ''}"
							style="margin-top: 0; height: 40px; color: black; border: 1px solid pink;">${pageNum}</a>
						</li>
					</c:forEach>

					<!-- 다음 버튼 -->
					<c:if test="${pc.next}">
						<li class="page-item"><a class="page-link"
							href="<c:url value='/board/list${pc.makeURI(pc.endPage + 1)}' />"
							style="background-color: #8b7ca8; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
						</li>
					</c:if>
				</ul>
				
				<!-- 페이징 처리 끝 -->
			</div>
		</div>
	</div>
	<!-- 검색 버튼 -->
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="form-group col-sm-2">
			<select id="condition" class="form-control" name="condition">
				<option value="title"
					${param.condition == 'title' ? 'selected' : ''}>제목</option>
				<option value="content"
					${param.condition == 'content' ? 'selected' : ''}>내용</option>
				<option value="writer"
					${param.condition == 'writer' ? 'selected' : ''}>작성자</option>
				<option value="titleContent"
					${param.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
				<option value="pName"
					${param.condition == 'pName' ? 'selected' : ''}>제품명</option>
			</select>
		</div>
		<div class="form-group col-sm-4">
			<div class="input-group">
				<input type="text" class="form-control" name="keyword"
					value="${param.keyword}" id="keywordInput" placeholder="검색어">
				<span class="input-group-btn"> <input type="button"
					value="검색" class="btn btn-izone btn-flat" id="searchBtn">
				</span>
			</div>
		</div>
		<div class="col-sm-2">
			<a href="<c:url value='/board/write'/>"
				class="btn btn-izone float-right">글쓰기</a>
		</div>
		<div class="col-sm-2"></div>
	</div>

</div>

<script>
	//글쓰기 완료 시 띄울 알림창 처리
	const result = "${msg}";

	if (result === "regSuccess") {
		alert("게시글 등록이 완료되었습니다.");
	} else if (result === "delSuccess") {
		alert("게시글 삭제가 완료되었습니다.");
	}

	//start jQuery
	$(function() {

		//목록 개수가 변동하는 이벤트 처리
		$("#count-per-page .btn-izone").click(function() {
			let count = $(this).val();
			const keyword = "${param.keyword}";
			const condition = "${param.condition}";
			location.href="/board/list?page=1&countPerPage=" + count 
							+ "&keyword=" + keyword
							+ "&condition=" + condition;
		});
		
		//검색 버튼 이벤트 처리
		$("#searchBtn").click(
				function() {
					console.log("검색 버튼이 클릭됨!");
					const keyword = $("#keywordInput").val();
					console.log("검색어: " + keyword);

					const condition = $("#condition option:selected").val();
					console.log("검색 조건: " + condition);

					location.href = "/board/list?keyword=" + keyword
							+ "&condition=" + condition;

				});

		//엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key) {

			if (key.keyCode == 13) {
				$("#searchBtn").click();
			}

		});

	});//end jQuery
</script>

<jsp:include page="../include/footer.jsp" />









