<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/common/header.jsp" %>
   
<!DOCTYPE html>
<html>
<div class="sub_title">
		<h2>Join</h2>
	</div>
	<div class="bg_admin">
		<div class="container">
			<div class="grap">
				<form name="admin">
					<fieldset>
						<h2>ID</h2>					
						<input type="text" name="t_id" placeholder="아이디를 입력하세요" id="id">
						<input class= "idcheck" type = "button" onClick="check_id()" value = "중복검사" id="checkIdB">
						<h2>Password</h2>	
						<input type ="hidden" name ="id_check_value">
						<input type="password" name="t_pw" placeholder="패스워드를 입력하세요" id="pw1">
						<h2>PasswordCheck</h2>	
						<input type="password" name="t_pw2" placeholder="패스워드확인" id="pw2">
						<h2>Name</h2>	
						<input type="text" name="t_name" placeholder="이름을 입력해주세요" id="name">
						<h2>NickName</h2>	
						<input type ="hidden" name ="t_nname2">
						<input type="text" name="t_nname" placeholder="별명을 입력해주세요" id="nname">
						<input class= "idcheck" type = "button" onClick="check_nickName()" value = "확인" id="checkIdB">
						<h2>Address</h2>	
						<input type="text" name="t_adress" placeholder="주소를입력해주세요" id="adress">
						<h2>PhoneNumber</h2>	
						<input type="text" name="t_phone1" placeholder="핸드폰번호1" id="phone1">
						-
						<input type="text" name="t_phone2" placeholder="핸드폰번호2" id="phone2">
						-
						<input type="text" name="t_phone3" placeholder="핸드폰번호3" id="phone3">
						<h2>Email</h2>	
						<input type="text" name="t_email1" class="email" id ="email1">&#64;
						<input type="text" name="t_email2" class="email" id ="email2">
							<select id = "emailtype" name="t_emailtype" class="email" onchange="passme();">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						<h2>Sex</h2>	
						<input type="radio" name="t_sex" value="w" id ="sex"> 여자
      					<input type="radio" name="t_sex" value="m" id ="sex"> 남자
						<a href="javascript:void(0)" onClick="admin_check();" class="btn_admin" >sign up</a>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	function check_id(){
		var fm =document.admin;
		var id = fm.t_id.value;
		var title ="아이디중복검사";
		var url ="/memberIdCheck";
			if(id ==""){
				alert("입력된 아이디가 없습니다");
				id.focus();
			} else {
				window.open("",title,"width=450, height=250");
				//첫번째""연결할페이지,두번째 창이름,3번째 사이즈
				fm.target=title;
				fm.action=url;
				fm.method="post";
				fm.submit();
				
			}
		}	
	function check_nickName(){
		var fm =document.admin;
		var nname =fm.t_nname.value;
		var title ="아이디중복검사";
		var url ="/memberNicknamecheck";
		if(nname ==""){
			alert("입력된 닉네임이 없습니다");
			nname.focus();
		} else {
			window.open("",title,"width=450, height=250");
			//첫번째""연결할페이지,두번째 창이름,3번째 사이즈
			fm.target=title;
			fm.action=url;
			fm.method="post";
			fm.submit();
		}
	}	
		
	function passme(){
		var target = document.admin.t_emailtype.value;
	      // 옵션 value 값
	   	var e2 =  document.getElementById("email2");
	     e2.value =  target;
	     //인풋상자로 자바스크립트 값 넘기기
	     // document.getElementById("email2"); >>>id값
	     // var target = document.all.t_emailtype.value; >>>>>name값
		}
		
	function admin_check() {
		var form = document.admin;
		if(form.t_id.value==""){
			alert("아이디를 입력해주세요");
			form.t_id.focus();
			return;
		}
		if(form.id_check_value.value==""){
			alert("아이디 중복체크 해주세요");
			return;
		}
		if(form.t_id.value != form.id_check_value.value){
			alert("아이디 변경후 중복검사를 실시해주세요");
			form.t_id.focus();
			return;
		}
		if(form.t_id.value.length > 15){
			alert("아이디를 15자 이내로 입력해주세요");
			return;
		}
		if(form.t_pw.value=="") {
			alert("비밀번호를 입력해주세요");
			form.t_pw.focus();
			return;
			}
		if(form.t_pw.value.length >15){
			alert("비밀번호는 15자 이내로 입력해주세요");
			form.t_pw.focus();
			return;
		}
		if(form.t_pw2.value=="") {
			alert("비밀번호를 재입력해주세요");
			form.t_pw2.focus();
			return;
			}
		if(form.t_pw.value != form.t_pw2.value){
			alert("비밀번호가 같지않습니다");
			form.t_pw.focus();
			return;
		}
		if(form.t_name.value=="") {
			alert("이름을 입력해주세요");
			form.t_name.focus();
			return;
			}
		if(form.t_name.value.length > 20){
			alert("이름은 20자 이내로 입력해주세요");
			return;
		}
		if(form.t_nname.value=="") {
			alert("별명을 입력해주세요");
			form.t_name.focus();
			return;
			}
		if(form.t_nname.value.length > 20){
			alert("별명은 20자 이내로 입력해주세요");
			return;
		}
		if(form.t_nname2.value==""){
			alert("닉네잉 중복체크 해주세요");
			return;
		}
		if(form.t_nname.value != form.t_nname2.value){
			alert("닉네임 변경후 중복검사를 실시해주세요");
			form.t_nname.focus();
			return;
		}
		if(form.t_adress.value=="") {
			alert("주소를 입력해주세요");
			form.t_adress.focus();
			return;
		}
		if(form.t_phone1.value=="") {
			alert("번호를 입력해주세요");
			form.t_phone1.focus();
			return;
		}
		if(form.t_phone1.value.length > 3){
			alert("연락처는 3자리이내로 입력해주세요");
			form.t_phone1.focus();
			return;
		}
		if(form.t_phone2.value=="") {
			alert("번호를 입력해주세요");
			form.t_phone2.focus();
			return;
		}
		if(form.t_phone2.value.length > 4){
			form.t_phone2.focus();
			alert("연락처는 4자리이내로 입력해주세요");
			return;
		}
		if(form.t_phone3.value=="") {
			alert("번호를 입력해주세요");
			form.t_phone3.focus();
			return;
		}
		if(form.t_phone3.value.length > 4){
			form.t_phone3.focus();
			alert("연락처는 4자리이내로 입력해주세요");
			return;
		}

	if(form.t_email1.value=="") {
		alert("이메일을 입력해주세요");
		form.t_email1.focus();
		return;
		}
	if(form.t_email1.value.length > 15){
		alert("이메일 아이디는 15자 이내로 입력해주세요");
		return;
	}
	
	if(form.t_emailtype.value != ""){
		document.all.t_email2.value = form.t_emailtype.value;
	} else{
		if(form.t_email2.value=="") {
			alert("이메일을 입력해주세요");
			form.t_email2.focus();
			return;
		}
	}
	if(form.t_email2.value.length > 15){
		alert("이메일 은 15자 이내로 입력해주세요");
		return;
	}
	if(form.t_sex.value=="") {
		alert("성별을 선택해주세요");
		form.t_sex.focus();
		return;
		}					
		
		form.action ="/memberJoin";
		form.method ="post";
		form.submit();
	}
	
	</script>

	  <%@ include file="/common/footer.jsp" %>
 </body>


</html>