<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal fade" id="mypage-in">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
	<h4 class="modal-title">My Page</h4>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<!-- Modal body -->
<div class="modal-body">
	<form action="#" name="izone-sign-in" method="post" id="signInForm"	style="margin-bottom: 0;">
		<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
			<tr>
				<td style="text-align: left">
				<p><strong>이메일</strong></p>
				</td>
			</tr>
			<tr>
				<td><input type="text" class="form-control tooltipstered"
							style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
							value="${login.email}" readonly></td>
			</tr>
			<tr>
				<td style="text-align: left">
				<p><strong>닉네임</strong></p>
				</td>
			</tr>
			<tr>
				<td><input type="text" class="form-control tooltipstered"
							style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
							value="${login.nick}"></td>
			</tr>
			<tr>
				<td	style="width: 100%; text-align: center; colspan: 2; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">
					<a class="btn form-control tooltipstered" style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8"
					href="/user/modify" onclick="return confirm('수정 하겠습니까?')">
					수정</a>
				</td>
			</tr>
			<tr>
				<td	style="width: 100%; text-align: center; colspan: 2; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">
					<a class="btn form-control tooltipstered" style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: red; border: 0px solid #388E3C; opacity: 0.8"
					href="/user/delete" onclick="return confirm('탈퇴 하겠습니까?')">
					탈퇴</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
</div>
</div>
