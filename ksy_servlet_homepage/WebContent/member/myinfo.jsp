<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dao.Member_DAO,dto.Member_DTO,common.CommonUtil"%>

  <%@ include file="/common/header.jsp" %>
<%
	   	Member_DAO dao = new Member_DAO();
		Member_DTO dto =dao.getMyinfo(sessionId);
%>
<!DOCTYPE html>
<html>
<script type="text/javascript" language="javascript">

$(document).ready(function(){
	$("#nname").keyup(function(){  
		var urlLocation="/MyimfoNicknameCheck";  
	    	    var params="nickname="+ $('#nname').val()+"&originalNick="+$('#ori_nname').val();
			        $.ajax({
			            type : "post",
			            url : urlLocation,
			            data: params,
			            dataType : "text",
			            error : function(){
			                alert('통신실패!!');
			            },
			            success : function(data){
			            	$("#nicknameAlert").html(data);
			            	if(document.getElementById('nicknameAlert').innerText=='it is good nickname. ever.'){
	                			$("#nicknameAlert").removeClass('redtext');
	                				$("#nicknameAlert").addClass('greentext');
                			}else{
	                			$("#nicknameAlert").removeClass('greentext');
                				$("#nicknameAlert").addClass('redtext');
	                		}
			            }
			                      
			        });
	    	 });
	
});

</script>


<div class="sub_title">
		<h2>My Info</h2>
</div>
<div class ="backg">
	<div class="bg_admin">
		<div class="container">
			<div class="grap">
				<form name="admin">
					<fieldset>
						<h4>ID</h4>					
						<p><%=dto.getId()%></p>
						<p>&nbsp</p>
						<h4>Password</h4>
						<input type="checkbox"  class="cpCheck" name="t_cpCheck" id="pw_checkbox"/>	
						<span class="checkboxDiv">if u want to change Password click this button</span>
						<br/>
						<div class ="passwordDiv">
						<input type="password" name="t_pw" placeholder="Please enter your password" id="pw1">
						<h4>Check Password</h4>
						<input type="password" name="t_pw2" placeholder="Please check your password" id="pw2">
						</div>
						<script type="text/javascript" src="/js/pwchange.js" ></script>
						<p>&nbsp</p>
						<h5>Name</h5>
						<p><%=dto.getName()%></p>
						<p>&nbsp</p>
						<h5>Nickname</h5>
						<input type ="hidden" name = "t_id"  value="<%=dto.getId()%>"/>
						<input type ="hidden" name ="ori_nname" id="ori_nname"  value="<%=dto.getNickname()%>"/>
						<input type="text" name="t_nname" id="nname" value ="<%=dto.getNickname()%>"/> <span id="nicknameAlert"></span>
						<h5>Adress</h5>
						<input type="text" name="t_adress" value="<%=dto.getAdress()%>" id="adress">
						<p>Phone number</p>
						<input type="text" name="t_phone1" value="<%=dto.getPhone1()%>" id="phone1">
						-
						<input type="text" name="t_phone2" value="<%=dto.getPhone2()%>" id="phone2">
						-
						<input type="text" name="t_phone3" value="<%=dto.getPhone3()%>" id="phone3">
						<p>E-mail</p>
						<input type="text" name="t_email1" class="email" id ="email1" value ="<%=dto.getEmail_1()%>">&#64;
						<input type="text" name="t_email2" class="email" id ="email2" value ="<%=dto.getEmail_2()%>">
						
						<a href="javascript:void(0)" onClick="admin_check();" class="btn_admin" >save</a>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
		

	function admin_check() {
		var form = document.admin;
		if (document.getElementById("pw_checkbox").checked == true){
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
		}
		
		if(form.t_nname.value != form.ori_nname.value){
			if(document.getElementById('nicknameAlert').innerText !='it is good nickname. ever.'){
				if(form.t_nname.value=="") {
					alert("별명을 입력해주세요");
					form.t_name.focus();
					return;
				}
				if(form.t_nname.value.length > 20){
					alert("별명은 20자 이내로 입력해주세요");
					return;
				}
				alert("check your nickname");
				form.t_name.focus();
				return;
			}
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
	if(form.t_email2.value=="") {
			alert("이메일을 입력해주세요");
			form.t_email2.focus();
			return;
	}
	if(form.t_email2.value.length > 15){
		alert("이메일 은 15자 이내로 입력해주세요");
		return;
	}
					
		
		form.action ="/MemberInfoChange";
		form.method ="post";
		form.submit();
	}
	
	</script>

	  <%@ include file="/common/footer.jsp" %>
 </body>


</html>