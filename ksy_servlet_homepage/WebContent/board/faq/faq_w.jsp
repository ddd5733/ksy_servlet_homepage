<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common/header.jsp" %>

	<div class="sub_title">
		<h2>FAQ 登録</h2>
	</div>
	<div class="container">
		<div class="write_wrap">
		<h2 class="sr-only">공지사항 글쓰기</h2>
			<form name = "wirte" >
			<!-- action을 처리하기 전에 check()사용자 함수를 실행하고 되돌아 와라-->
			<div class="board_list">
				<table class="board_table">
					<caption class="sr-only">공지사항 입력 표</caption>
					<colgroup>
						<col width="12%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>書き手</th>
							<th><input type="text" name="writer" value="<%=sessionLevel%> : <%=sessionName%>"></th>
						</tr>
						<tr>
							<th>題目</th>
							<th><input type="text" name="t_title"></th>
						</tr>
						<tr>
							<th>内容</th>
							<th><textarea name="t_contents"></textarea></th>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btn_wrap">
				<input type="submit" value="Save" class="btn_ok" onClick="javascript:save();">&nbsp;&nbsp;
				<input type="reset" value="Reset" class="btn_reset">&nbsp;&nbsp;
				<input type="button" value="Back" class="btn_list" onClick="javascript:history.back();">
			</div>
			<input type="hidden" name ="t_reg_id" value="<%=sessionId%>">
			<input type="hidden" name ="t_work" value="save">
			</form>
		</div>
	</div>
	<script>
		function save(){
			var fm = document.wirte;
			if(fm.writer.value==""){
				alert("書き手を 入力してください。");
				fm.writer.focus();
				return;
			}
			if(fm.t_title.value==""){
				alert("題目を 入力してください。");
				fm.t_title.focus();
				return;
			}
			if(fm.t_contents.value==""){
				alert("内容を入力してください。");
				fm.t_contents.focus();
				return false;
			}
			fm.action = "/FaqUpdateServlet";
			fm.method = "post";
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
