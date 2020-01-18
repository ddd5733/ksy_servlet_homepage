<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="/common/header.jsp" %>

	<div class="sub_title">
		<h2>Event</h2>
	</div>
	
<div class="container">
		<div class="board_view">
			
			
			<div class="board_body2">
				<div class="clickBoxDiv">
					<div class="box">진행중인이벤트</div>
					<div class="box">종료된이벤트</div>
				</div>
			</div>
		
<%
	if(sessionId.equals("manager")){ 
%>
			<div class="prev_next">
				<div class="btn_3wrap">
			<a href="javascript:write()"> Write</a>
				</div>
			</div>
<%} %>
		</div>
		<form name ="gougou">
		<input type="hidden" name=t_work value ="gonu"/>
		<input type="hidden" name="t_noticeNo" value ="${t_dto.getNotice_no()}"/>
		</form>
	</div>
	<script>
		function write(){
			var fm = document.gougou;
			fm.action = "/OpenNoticeV";
			fm.method = "post";
			fm.submit();
		}
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
