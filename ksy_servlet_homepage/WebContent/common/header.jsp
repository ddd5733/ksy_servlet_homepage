<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="/common/common_session_info.jsp" %>
<!DOCTYPE html>
<html lang="ko">

 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="Author" content="구송이">
  <meta name="Keywords" content="문화재청 덕수궁, 반응형 홈페이지">
  <meta name="Description" content="응용sw개발자를 위한 반응형 홈페이지">
  <title>旅go</title>
  <script src="/js/jquery-3.3.1.min.js"></script>
  <link href="/css/font-awesome.min.css" rel="stylesheet">
	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
  <link href="/css/common.css" rel="stylesheet">
  <link href="/css/layout.css" rel="stylesheet">	
  <link href="/css/headyoutube.css" rel="stylesheet">	
  <link rel="icon" type="image/png" href="http://example.com/myicon.png">

 
 	<!-- jquery언어 사용법
	1. jquery.js 기반으로 프로그램을 작성하기 때문에 jquery.js 파일을 다운 또는 CDN 방식으로 링크 건다
	2. $(function() {
	실행문;
	});
	-->
	 
	
 </head>


<script>
		$(function(){
			$(".gnb>.nav_1depth>li").hover(function(){
				//console.log("gnb>.nav_1depth>li");
				//$(".main_center .box3 nav ul li").removeClass("active");
				//$(this).addClass("active");
				//$(".clearfix").hide();

				//var activeTab = $(this).find("a").attr("href"); 
                //$(activeTab).fadeIn(); 
                //return false;

				$(this).children(".nav_2depth").stop().slideDown("fast");
				}, function(){
					$(".gnb>.nav_1depth>li").removeClass();
					$(this).children(".nav_2depth").stop().slideUp("fast");
				}
			);
				//$(".main_center .box3 nav ul li").click(function(e){
					//$(this).addClass("active")
					//var num = $(this).index();
					//$(".taball").hide().eq(num).show();
				//}
		});
		function check_wLogon(){
			var fm = document.work;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function goJoin(){
			var fm = document.join;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function logout(){
			var fm = document.logo;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function com(){
			var fm = document.com;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function comway(){
			var fm = document.comw;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function recPlace(){
			var fm = document.recp;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function recPlace2(){
			var fm = document.recr;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function gofr(){
			var fm = document.gofr;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function gont(){
			var fm = document.gont;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function goMyInfo(){
			var fm = document.goif;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		function goEr(){
			var fm = document.goer;
			fm.action = "/HubServlet";
			fm.method = "post";
			fm.submit();
		}
		
</script>

 <body>
 <!-- 웹문서 만들기 기본 공식
 1. 요소를 어떻게 묶을 것인가? 그룹만들기
 2. 그룹안에 적절한 태그 사용
 3. class 이름 붙이고 css 적용
 -->
	
	<div class="sr-only">
		<p><a href="#contents">본문 바로가기</a></p>
	</div>
	
	<div class="top_navigation">
		<header class="header">
			<form name="js-youtubeForm">
			<nav class="top_left">
				<ul>
					<li class="first"><a href="/Index">HOME</a></li>
					<li><a href="https://www.kakaocorp.com/service/KakaoTalk">KakaoTalk</a></li>
					<li class ="youTubeLi" style="cursor:pointer">YouTube</li>
					<li><a href="https://github.com/ddd5733?tab=repositories">Developer'sGit</a></li>
				</ul>
			</nav>
			</form>
			<nav class="top_right">
				<ul>
					<%if(sessionId.equals("")){ %>
					<li class="first"><a href="javascript:check_wLogon()">LOGIN</a></li>
					<li><a href="javascript:goJoin()">JOIN</a></li>
					<%} else {%>
					<li class="loginstatus">Welcome to <%=sessionName%></li>
					<li class="first"><a href="javascript:goMyInfo()">My info</a></li>
					<li class="first"><a href="javascript:logout()">LOGOUT</a></li>
					<%} %>
					
				</ul>
			</nav>
			
			
					<form name ="gont">
						<input type="hidden" name ="t_work" value="gont">
					</form>
					<form name ="join">
						<input type="hidden" name ="t_work" value="goj">
					</form>
					<form name ="logo">
						<input type="hidden" name ="t_work" value="golo">
					</form>
					<form name ="work">
						<input type="hidden" name ="t_work" value="gol">
					</form>
					<form name ="com">
						<input type="hidden" name ="t_work" value="goc">
					</form>
					<form name ="comw">
						<input type="hidden" name ="t_work" value="gocw">
					</form>
					<form name ="recp">
						<input type="hidden" name ="t_work" value="gorp">
					</form>
					<form name ="recr">
						<input type="hidden" name ="t_work" value="gorr">
					</form>
					<form name ="gofr">
						<input type="hidden" name ="t_work" value="gofr">
					</form>
					<form name ="goif">
						<input type="hidden" name ="t_work" value="goif">
					</form>
					<form name ="goer">
						<input type="hidden" name ="t_work" value="goer">
					</form>
			<div class="gnb_group">
				<a href="/Index"><h1 class="logo"><img src="/images/cat.JPG" alt="Home" width="60" height="60" />旅go</h1></a>
				<nav class="gnb">
					<ul class="nav_1depth">
						<li><a href="javascript:com()">Company</a>
							<ul class="nav_2depth">
								<li><a href="javascript:com()">Introduction</a></li>
								<li><a href="javascript:comway()">Map</a></li>
							</ul>
						</li>
						<li><a href="business01.html">Recommend</a>
							<ul class="nav_2depth">
								<li><a href="javascript:recPlace2()">Restaurant Recommend</a></li>
								<li><a href="javascript:recPlace()">Attraction</a></li>
							</ul>
						</li>
						<li><a href="product01.html">Travel to Korea</a>
							<ul class="nav_2depth">
								<li><a href="product01.html">Planning with company</a></li>
								<li><a href="product02.html">Cancellation/Refund</a></li>
							</ul>
						</li>
						<li><a href="javascript:goEr()">Event</a>
							<ul class="nav_2depth">
								<li><a href="javascript:goEr()">Event</a></li>
								<li><a href="product02.html">Benefit Notify</a></li>
							</ul>
						</li>
						<li><a href="javascript:gont()">Board</a>
							<ul class="nav_2depth">
								<li><a href="javascript:gont()">Notice</a></li>
								<li><a href="">Traveling Review</a></li>
								<li><a href="">Traveling Question</a></li>
								<li><a href="">Q&A</a></li>
								<li><a href="javascript:gofr()">FAQ</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<div class="line">
		</div>
	</div>
	
	