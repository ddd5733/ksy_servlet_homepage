<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html>
<div class="sub_title">
		<h2>Please enter Id</h2>
	</div>

	<div class="bg_admin">
		<div class="container">
			<div class="grap">
				<form name="admin" >
					<fieldset>
						<legend class="sr-only">관리자로그인</legend>

						<label for="id" class="sr-only">Id</label>
						<input type="text" name="t_id" placeholder="Id" id="l_id">

						<label for="pw" class="sr-only">PassWord</label>
						<input type="password" name="t_pw" placeholder="PassWord" id="l_pw">

						<a href="javascript:void(0)" onClick="admin_check();" class="btn_admin">Login</a>
						<a href="javascript:void(0)" onClick="goFP();" class="btn_admin">Forgot your password?</a>
					</fieldset>
				</form>
				<form name ="gops">
					<input type="hidden" name="t_work" value="gops"/>
				</form> 
			</div>
		</div>
	</div>
	<script>
		function admin_check(){
			var fm = document.admin;
			if(fm.t_id.value==""){
				alert("아이디입력");
				fm.t_id.focus();
				return false;
			}
			if(fm.t_pw.value==""){
				alert("패스워드입력");
				fm.t_pw.focus();
				return false;
			}
			fm.action ="/memberLoginCheck";
			fm.method ="post";
			fm.submit();
		}
		function goFP(){
			var fm =document.gops;
			var title ="비번찾기";
			var url ="/HubServlet";
			window.open("",title,"width=500, height=300");
			//첫번째""연결할페이지,두번째 창이름,3번째 사이즈
			fm.target=title;
			fm.action=url;
			fm.method="post";
			fm.submit();
				
			}	
		
	</script>
	<script>
		$(function(){
			$(".location .dropdown>a").on("click",function(e){
				e.preventDefault();
				if($(this).next().is(":visible")){
					$(".location .dropdown > a").next().hide();
				}else{
					$(".location .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
	</script>

	<%@ include file="/common/footer.jsp" %>
 </body>


</html>