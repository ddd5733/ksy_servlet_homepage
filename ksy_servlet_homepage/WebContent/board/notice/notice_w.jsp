<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common/header.jsp" %>

	<div class="sub_title">
		<h2>Notice 登録</h2>
	</div>
	
	<div class="container">
		<div class="write_wrap">
		<h2 class="sr-only">공지사항 글쓰기</h2>
		<form name ="wirte" enctype="multipart/form-data">
		<input type="hidden" name="t_gubun" value="save"/>
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
							<th><%=sessionLevel%></th>
						</tr>
						<tr>
							<th>題目</th>
							<th><input type="text" name="t_title"></th>
						</tr>
						<tr>
							<th>内容</th>
							<th><textarea name="t_contents"></textarea></th>
						</tr>
						<tr>
							<th>写真</th>
							<th><input type="file" name="t_file"></th>
						</tr>
					</tbody>
			
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" value="저장" class="btn_ok"  onClick="javascript:save();">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
				<input type="button" value="목록" class="btn_list" onClick="javascript:history.back();">
			</div>
		</form>
		</div>
	</div>

	<script>
		function save(){
		var fm = document.wirte;
			
			if(fm.t_title.value==""){
				alert("題目を 入力してください。");
				fm.t_title.focus();
				return ;
			}
			if(fm.t_contents.value==""){
				alert("内容を入力してください。");
				fm.t_contents.focus();
				return ;
			}
			// 첨부 용량 체크 
			var file = fm.t_file; 
			if(file.value != ""){ //첨부했을때 사이즈 체크
				var position = file.value.lastIndexOf("\\")+1;
				var fName = file.value.substr(position);
				var len = fName.length;
				if(len > 20){
					alert("ファイル名は20文字以内にしてください。");
					return;
				}
				// 사이즈체크
				var maxSize  = 2 * 1024 * 1024    //2MB
				var fileSize = 0;

				var browser=navigator.appName; // 브라우저 확인
				
				if(browser=="Microsoft Internet Explorer"){ // 익스플로러일 경우
					var oas = new ActiveXObject("Scripting.FileSystemObject");
					fileSize = oas.getFile(file.value).size;
				}else{	// 익스플로러가 아닐경우
					fileSize = file.files[0].size;
				}
				// alert("파일사이즈 : "+fileSize);
				if(fileSize > maxSize){
					alert("ファイル名は20文字以内にしてください.");
					return;
				}
			}
			fm.action = "/NoticeUpdate";
			fm.method = "post";
			fm.submit();
		}
	</script>
	

	<%@ include file="/common/footer.jsp" %>
 </body>


</html>
