<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 로그인 Modal-->
<div class="modal fade" id="log-in">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">로그인</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">

				<form action="#" name="izone-sign-in" method="post" id="signInForm"
					style="margin-bottom: 0;">
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p>
									<strong>이메일</strong>&nbsp;&nbsp;&nbsp;<span
										id="emailCheck"></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userEmail" id="signInEmail"
								class="form-control tooltipstered" maxlength="20"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="이메일을 입력해주세요"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p>
									<strong>비밀번호</strong>&nbsp;&nbsp;&nbsp;<span
										id="pwCheck"></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20"
								id="signInPw" name="userPw" class="form-control tooltipstered"
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="비밀번호을 입력해주세요"></td>
						</tr>

						<!-- 자동 로그인 체크박스 -->
						<tr>
							<td><input type="checkbox" id="auto-login" name="autoLogin">
								자동 로그인</td>
						</tr>

						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="로그인" class="btn form-control tooltipstered"
								id="signIn-btn"
								style="background-color: #8b7ca8; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							</td>
						</tr>
						<tr>
							<td
								style="width: 100%; text-align: center; colspan: 2; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">

								<a class="btn form-control tooltipstered" data-toggle="modal"
								href="#sign-up"
								style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">
									회원가입</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 회원가입 Modal -->
<div class="modal fade" id="sign-up" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">회원 가입</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<div class="modal-body">

				<form action="#" name="signup" id="signUpForm" method="post"
					style="margin-bottom: 0;">
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p>
									<strong>이메일를 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span
										id="emailChk"></span>
								</p>
							</td>

						</tr>
						<tr>
							<td><input type="text" name="userEmail" id="user_email"
								class="form-control tooltipstered" maxlength="25"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="이메일 형식에 맞게 작성해주세요"></td>

						</tr>

						<tr>
							<td style="text-align: left">
								<p>
									<strong>비밀번호를 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20"
								id="user_pw" name="userPw" class="form-control tooltipstered"
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="영문과 특수문자를 포함한 최소 8자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p>
									<strong>비밀번호를 재확인해주세요</strong>&nbsp;&nbsp;&nbsp;<span
										id="pwChk2"></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20"
								id="password_check" name="pw_check"
								class="form-control tooltipstered" maxlength="20"
								required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="비밀번호가 일치해야합니다"></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p>
									<strong>닉네임을 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span
										id="nickChk"></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userNick" id="user_nick"
								class="form-control tooltipstered" maxlength="10"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="10자 이내로 작성해주세요"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>주소를 입력해주세요</strong></p>
								<input type="button" onclick="daumPost()" value="주소검색"><br>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control tooltipstered" maxlength="20"
								required="required" aria-required="true" style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" id="addr1" name="addr" placeholder="우편번호">
								<input type="text" class="form-control tooltipstered" maxlength="20"
								required="required" aria-required="true" style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"id="addr2" placeholder="주 소">
								<input type="text" class="form-control tooltipstered" maxlength="20"
								required="required" aria-required="true" style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"id="addr3" placeholder="상 세 주 소"><br>&nbsp;
							</td>
						</tr>	
						
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="회원가입"
								class="btn form-control tooltipstered" id="signup-btn"
								style="background-color: #8b7ca8; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
//start JQuery
$(function() {
	
	const getEmailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getNick = RegExp(/^[가-힣]+$/);
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false
	
	//회원가입 검증~~
	//이메일 입력값 검증.
	$('#user_email').on('keyup', function() {
		if($("#user_email").val() === ""){
			$('#user_email').css("background-color", "pink");
			$('#emailChk').html('<b style="font-size:14px;color:red;">[이메일은 필수 정보]</b>');
			chk1 = false;
		}
		
		//이메일 유효성검사
		else if(!getEmailCheck.test($("#user_email").val())){
			$('#user_email').css("background-color", "pink");
			$('#emailChk').html('<b style="font-size:14px;color:red;">[이메일 형식을 확인해 주세요]</b>');	  
			chk1 = false;
		} 
		//이메일 중복확인 비동기 처리
		else {
			//이메일 중복확인 비동기 통신
			const email = $(this).val();
			console.log(email);
			
			$.ajax({
				type: "POST",
				url: "/user/checkEmail",	
				headers: {
	                "Content-Type": "application/json"
	            },
				dataType: "text",
				data: email,
				success: function(result) {
					if(result === "OK") {
						$("#user_email").css("background-color", "aqua");
						$("#emailChk").html("<b style='font-size:14px; color:green;'>[OK]</b>");						
						chk1 = true;
					} else {
						$("#user_email").css("background-color", "pink");
						$("#emailChk").html("<b style='font-size:14px; color:red;'>[이메일 중복]</b>");						
						chk1 = false;
					}
				},
				error: function() {
					console.log("통신 실패!");
				}
			});
		}
	});
	
	//패스워드 입력값 검증.
	$('#user_pw').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#user_pw").val() === ""){
		    $('#user_pw').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보]</b>');
			chk2 = false;
		}		         
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#user_pw").val()) || $("#user_pw").val().length < 8){
		    $('#user_pw').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk2 = false;
		} else {
			$('#user_pw').css("background-color", "aqua");
			$('#pwChk').html('<b style="font-size:14px;color:green;">[OK]</b>');
			chk2 = true;
		}
		
	});
	
	//패스워드 확인란 입력값 검증.
	$('#password_check').on('keyup', function() {
		//비밀번호 확인란 공백 확인
		if($("#password_check").val() === ""){
		    $('#password_check').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[패스워드확인은 필수정보]</b>');
			chk3 = false;
		}		         
		//비밀번호 확인란 유효성검사
		else if($("#user_pw").val() != $("#password_check").val()){
		    $('#password_check').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[위와 일치 해야 합니다]</b>');
			chk3 = false;
		} else {
			$('#password_check').css("background-color", "aqua");
			$('#pwChk2').html('<b style="font-size:14px;color:green;">[OK]</b>');
			chk3 = true;
		}
		
	});
	
	//닉네임 검증.
	$('#user_nick').on('keyup', function() {
		//닉네임 공백 확인
		if($("#user_nick").val() === ""){
		    $('#user_nick').css("background-color", "pink");
			$('#nickChk').html('<b style="font-size:14px;color:red;">[닉네임은 필수정보]</b>');
			chk4 = false;
		}		         
		//닉네임 유효성검사
		else if(!getNick.test($("#user_nick").val())){
		    $('#user_nick').css("background-color", "pink");
			$('#nickChk').html('<b style="font-size:14px;color:red;">[닉네임은 한글로 작성해주세요]</b>');
			chk4 = false;
		} else {
			$('#user_nick').css("background-color", "aqua");
			$('#nickChk').html('<b style="font-size:14px;color:green;">[OK]</b>');
			chk4 = true;
		}
		
	});
	
	
	
	$('#signup-btn').click(function(e) {
		if(chk1 && chk2 && chk3 && chk4) {
			//이메일 정보
			const email = $("#user_email").val();
			console.log("email: " + email);
			//패스워드 정보
			const pw = $("#user_pw").val();
			console.log("pw: " + pw);
			//이름 정보
			const nick = $("#user_nick").val();
			console.log("nick: " + nick);
			
			const addr1 = $("#addr1").val();
		   	const addr2 = $("#addr2").val();
		   	const addr3 = $("#addr3").val();
		   	const addr = addr1 + "/" +addr2 + "/" + addr3;
		   	console.log("addr: " + addr);
		   	
			const user = {
		   		email: email, 
		   		pw: pw, 
		   		nick: nick,
		   		addr: addr
		   		};
			
			//클라이언트에서 서버와 통신하는 ajax함수(비동기 통신) 
			$.ajax({
				type: "POST", //서버에 전송하는 HTTP요청 방식
				url: "/user/", //서버 요청 URI
				headers: {"Content-Type": "application/json"}, //요청 헤더 정보
				dataType: "text", //응답받을 데이터의 형태
				data: JSON.stringify(user), //서버로 전송할 데이터
				success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
					console.log("통신 성공!: " + result);
					if(result === "joinSuccess") {
						alert("회원가입에 성공했습니다");
						location.href="/";
					} else {
						alert("회원가입에 실패했습니다");
					}
				}, //통신 성공시 처리할 내용들을 함수 내부에 작성.
				error: function() {
					console.log("통신 실패!");
				} //통신 실패 시 처리할 내용들을 함수 내부에 작성.
			});
		
		} else {
			alert('입력정보를 다시 확인하세요.');			
		}
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////
	
	//로그인 검증~~
	//이메일 입력값 검증.
	$('#signInEmail').on('keyup', function() {
		if($("#signInEmail").val() == ""){
			$('#signInEmail').css("background-color", "pink");
			$('#emailCheck').html('<b style="font-size:14px;color:red;">[이메일은 필수 입니다]</b>');
			chk1 = false;
		}		
		
		//아이디 유효성검사
		else if(!getEmailCheck.test($("#signInEmail").val())){
			$('#signInEmail').css("background-color", "pink");
			$('#emailCheck').html('<b style="font-size:14px;color:red;">[이메일 형식으로 작성]</b>');	  
			chk1 = false;
		} else {
			$('#signInEmail').css("background-color", "aqua");
			$('#emailCheck').html('<b style="font-size:14px;color:green;">[OK]</b>');
			chk1 = true;
		}
	});
	
	//패스워드 입력값 검증.
	$('#signInPw').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#signInPw").val() === ""){
		    $('#signInPw').css("background-color", "pink");
			$('#pwCheck').html('<b style="font-size:14px;color:red;">[패스워드는 필수입니다]</b>');
			chk2 = false;
		}		         
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){
		    $('#signInPw').css("background-color", "pink");
			$('#pwCheck').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk2 = false;
		} else {
			$('#signInPw').css("background-color", "aqua");
			$('#pwCheck').html('<b style="font-size:14px;color:green;">[OK]</b>');
			chk2 = true;
		}
		
	});
	/////////////////////////////////////////////
	
	//로그인 버튼 클릭이벤트
	$("#signIn-btn").click(function() {
		if(chk1 && chk2) {
			//ajax통신으로 서버에서 값 받아오기
			const email = $('#signInEmail').val();
			const pw = $('#signInPw').val();
			//is()함수는 상태여부를 판단하여 논리값을 리턴합니다.
			const autoLogin = $("input[name=autoLogin]").is(":checked");
			
			console.log("email: " + email);
			console.log("pw: " + pw);
			console.log("auto: " + autoLogin);
			
			const userInfo = {
					email : email,
					pw : pw,
					autoLogin: autoLogin
				};
			
			$.ajax({
				type: "POST",
				url: "/user/loginCheck",
				headers: {
	                "Content-Type": "application/json"
	            },
				data: JSON.stringify(userInfo),
				dataType : "text",
				success: function(data) {
					console.log("result: " + data);	
					if(data === "emailFail") {
						$('#signInEmail').css("background-color", "pink");
						$('#emailCheck').html('<b style="font-size:14px;color:red;">[이메일이 존재하지 않습니다]</b>');
						$('#signInPw').val("");
						$('#signInEmail').focus();
						chk2 = false;
				    } else if(data === "pwFail") {
						$('#signInPw').css("background-color", "pink");
						$('#signInPw').val("");
						$('#signInPw').focus();
						$('#pwCheck').html('<b style="font-size:14px;color:red;">[비밀번호가 틀렸습니다]</b>');
						chk2 = false;
					} else if(data === "loginSuccess") {
						self.location="/";
					}
				}
			});
			
		} else {
			alert("입력정보를 다시 확인하세요!");
		}
	});
	
});//end JQuery

</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
           	//도로명 R, 지번 J
           	console.log("data.userSelectedType : "+data.userSelectedType)
           	console.log("data.roadAddress : "+data.roadAddress)
           	console.log("data.jibunAddress : "+data.jibunAddress)
           	console.log("data.zonecode(우편번호) : "+data.zonecode)
           	var addr="";
           	if(data.userSelectedType === 'R'){
           		addr = data.roadAddress
           	}else{
           		addr = data.jibunAddress
           	}
           	$("#addr1").val(data.zonecode)
           	$("#addr2").val(addr)
           	$("#addr3").focus()
        }
    }).open();
}

</script>













