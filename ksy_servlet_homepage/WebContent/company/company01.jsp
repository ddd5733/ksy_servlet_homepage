<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<div class="sub_title">
		<h2>会社紹介</h2>
		
	</div>
	<div class="container">
		<div class="text_center">
			<p><span class="support_text"><strong>旅go</strong></span></p></br>
			<span class="col_bar"></span>
		</div>
		<div class="greeting_cont">
	<div class="companyImage"></div>			
			<div class="hangle">
				
				<p>私どもの旅goは</p>
				<p>良い韓国の食べ物と文化</p>
				<p>旅行をすすめてくれて韓国旅行と </p>
				<p>文化を初めて接する方々にも </p>
				<p>面白く情報を知って行くことができる会社です.</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>異空間は皆様と一緒に作っていく場所です。</p>
				
			</div>
			
			<div class="nihon">
				
				<p>저희旅go는</p>
				<p>좋은 한국의 음식과 문화</p>
				<p>여행을 추천해주고 한국여행과 </p>
				<p>문화를 처음 접하시는 분들께도 </p>
				<p>재미있게 정보를 알아갈수 있는 회사입니다.</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>이공간은 여러분들과 함께 꾸며가는 장소입니다.</p>
			</div>
	</div>

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


</html>