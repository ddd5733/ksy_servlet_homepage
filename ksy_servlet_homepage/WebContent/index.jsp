<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/common/header.jsp" %>
	<section id="main_visual">
		<form name ="js-pic">
		<div class="visual_wrap">
		<div class="youtubeDiv">
		<object title="YouTube video player" class="youtube-player" type="text/html"  width="100%" height="500px"  data="//www.youtube.com/embed/vtY7HHq_2vU?autoplay=1&loop=1&theme=light&fs=1" allowFullScreen></object>
		</div>
			<h2 class="sr-only">메인 비쥬얼</h2>
			<ul>
				<!-- <li><img src="images/bg.png" alt="학생단체관람" class="w100"></li> -->
				<li class="one"></li>
			</ul>
			<div class="visual_inner">
				<p class="title">CREATIVE <strong>DESIGN</strong></p> 
				<p class="txt">Challenging Technology Development, <br/> Leading-Edge Enterprise</p>
			</div>
		</div>
		</form>
	</section>
	<p> join(Completion),login(Completion),logout(Completion),companyintro(Ing)</p>
	
	<section class="main_content">
		<h2 class="sr-only">주요서비스<h2>
		<div class="main_left">
			<div class="box1">
				<div class="txt_relative">
					<h3>ONLINE SHOP</h3>
					<p>메인 상품은 관리자 페이지에서 선택 가능합니다.</p>
					<a href="" class="btn-border">READ MORE</a>
				</div>
				<div class="img_transition">
				</div>
			</div>
		</div>
		<div class="main_center">
			<div class="box3">
				<h3 class="sr-only">알림마당</h3>
				<nav>
					<ul>
						<li class="active"><a href="#sam01">샘플제품</a></li>
						<li><a href="#sam02">샘플제품</a></li>
					</ul>
				</nav>

				<div class="sample01 clearfix active" id="sam01">
					<div class="sam">
						<p class="title">
							<a class="title" href="">100원</a>
							<span class="date">2018-09-27</span>
						</p>
						<p class="text">빅데이터처리, JAVA, JSP, PHP, DB를 이용한 웹사이트</p>
					</div>
					<ul>
						<li><a href="">적을게 없어</a><span>2018-09-27</span></li>
						<li><a href="">적을게 없어</a><span>2018-09-27</span></li>
						<li><a href="">적을게 없어</a><span>2018-09-27</span></li>
						<li><a href="">적을게 없어</a><span>2018-09-27</span></li>
					</ul>
				</div>

				<div class="sample02 clearfix" id="sam02">
					<div class="sam">
						<p class="title">
							<a class="title" href="">300원</a>
							<span class="date">2018-09-27</span>
						</p>
						<p class="text">빅데이터처리, JAVA, JSP, PHP, DB를 이용한 웹사이트</p>
					</div>
					<ul>
						<li><a href="">적을게 없어</a><span>2018-09-27</span></li>
						<li><a href="">적을게 없어</a><span>2018-09-27</span></li>
						<li><a href="">적을게 없어</a><span>2018-09-27</span></li>
						<li><a href="">적을게 없어</a><span>2018-09-27</span></li>
					</ul>
				</div>
			</div> <!-- box3 -->

		</div> <!-- main_center -->

		<div class="main_right">
		</div>
	</section>

	<script>
		$(function(){
			$(".gnb>.nav_1depth>li").hover(function(){
				//console.log("gnb>.nav_1depth>li");
				$(this).parent().addClass("active");
				$(".taball").hide();
				$($(this).attr("href")).show();
			});
		});
	</script>

	<div class="right_quick">
		<button class="btn btn-open" type="button"></button>
	</div>
<%@ include file="/common/footer.jsp" %>
<script src="/js/indexBg.js"></script>
<script src="/js/headerYoutube.js"></script>
 </body>


</html>
