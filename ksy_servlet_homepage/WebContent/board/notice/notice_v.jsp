<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="/common/header.jsp" %>

	<div class="sub_title">
		<h2>公知事項</h2>
	</div>
	
<div class="container">
		<div class="board_view">
			<h2>${t_dto.getTitle()}</h2>
			<p class="info"><span class="user"><%=sessionId%></span> | ${t_dto.getReg_date()} | <i class="fa fa-eye"> ${t_dto.getHit()}</i>
			<div class="board_body">
				<p>${t_dto.getContent()}</p>
			</div>
		<c:if test="${t_dto.getFile_name_1() != null }">	
			<div class="file_board_body">
				<p>添付 : <a href="/common/filedown.jsp?t_file=${t_dto.getFile_name_1()}&t_gubun=notice">${t_dto.getFile_name_1()}</a></p>
			</div>
		</c:if>	
			<div class="prev_next">
				<div class="btn_3wrap">
					<a href="javascript:history.back();">Back</a> 
					<a href="javascript:gou();">Modify.</a> 
					<a href="javascript:dele();">Delete</a>
				</div>
			</div>
		</div>
		<form name ="gougou">
		<input type="hidden" name=t_work value ="gonu"/>
		<input type="hidden" name="t_noticeNo" value ="${t_dto.getNotice_no()}"/>
		</form>
	</div>
	<script>
		function gou(){
			var fm = document.gougou;
			fm.action = "/OpenNoticeV";
			fm.method = "post";
			fm.submit();
		}
		function dele(){
			var fm = document.gougou;
			fm.action = "/NoticeDeleteServlet";
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
