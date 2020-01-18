<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/common/header.jsp" %>

<body>

<div class="sub_title">
	<h2>FAQ</h2>
</div>


	<div class="container">
		<div class="search_wrap">
			<div class="record_group">
				<p>Total&nbsp&nbsp<span>${igal}</span></p>
				</div>
				<div class="search_group">
					<form name="myform" >
						<select name="t_sel" class="select">
							<option value="title" <c:if test="${t_selValue == 'title'}">out.print("selected"); </c:if>>title</option>
							<option value="content" <c:if test="${t_selValue eq 'content'}">out.print("selected");</c:if>>content</option>
						</select>
						<input type="text" name="t_search" class="search_word" value="${t_txtValue}">
						<button class="btn_search" onClick="formSearch()" value="Search" ><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
					<input type="hidden" name="r_page">
					</form>
				</div>
			</div>
		</div>
		
		<div class="board_list">
		<c:set var="forYN" value="true"/>
	<c:set var="num" value="0"/>
<c:if test="${t_dtos.size() >0}">
		<c:forEach items="${t_dtos}" var="dto">	
			<c:if test="${forYN}">
				<c:if test="${v_count == for_count}">
			<div class="faq_group">
				<ul>
					<li>
						<button class="accordion">
							${dto.getTitle()}
						</button>
						<div class="panel">
							<p class="js-ptag">${dto.getAnswer()}
							<button class="pm" onClick="god('${dto.getF_number()}')">Delete</button>
							<button class="pm" onClick="gou('${dto.getF_number()}')">Modify</button>
							</p>
						</div>
					</li>
				</ul>
			</div>

			<c:set var="v_count" value="${v_count+1}"/>
					<c:set var="for_count" value="${for_count+1}"/>
			</c:if>	
				
					<c:if test="${v_count != for_count}">
						<c:set var="v_count" value="${v_count+1}"/>
					</c:if>
					
						<c:if test="${v_count == a_count}">
							<c:set var="forYN" value="false"/> 
						</c:if>
			</c:if>
		</c:forEach>
	</c:if>
	<form name ="faq">
	<input type="hidden" name="t_work">
	<input type="hidden"  name="t_f_number">
	</form>
	<c:if test="${t_dtos.size() == 0}">
			<div class="faq_group">
				<ul>
					<li>
						<button class="accordion">
							登録された文がございません。
						</button>
						<div class="panel">
							<p>書き込みを登録してください。</p>
						</div>
					</li>
				</ul>
			</div>
		</c:if>
		
			<script>
				$(function(){
					$(".accordion").on("click",function(){
						$(".panel").not($(this).next().slideToggle()).slideUp();
						$(".accordion").removeClass("active");
						$(this).toggleClass("active");
					});
				});
			</script>

			<div class="paging">
				
<%
			Integer cp = (Integer)request.getAttribute("current_page");
			int current_page = cp.intValue();
			Integer tp = (Integer)request.getAttribute("total_page");
			int total_page = tp.intValue();
			
			out.println(common.CommonUtil.pageList(current_page, total_page));
%>	
		
				<a href="javascript:gowi();" class="write">Write</a>
			
			
			
</div>			
		</div>
	<form name ="gwgw">
		<input type="hidden" value="gofw" name="t_work">
	</form>
	<script>
	function gowi(){
		var fm =document.gwgw;
		fm.action = "/HubServlet";
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
		
		function formSearch(){
			var fm = document.myform;
			fm.action ="/FaqOpenList";
			fm.method ="post";
			fm.submit();
		}
		function gopage(pageNum){
			var fm = document.myform;
			fm.r_page.value = pageNum;
			fm.action ="/FaqOpenList";
			fm.method ="post";
			fm.submit();
		}
		function gou(f_num){
			var fm = document.faq;
			fm.t_work.value = "up";
			fm.t_f_number.value = f_num;
			fm.action ="/FaqUpdateServlet";
			fm.method ="post";
			fm.submit();
			
		}
		function god(f_num){
			var fm = document.faq;
			var result = confirm("本当に削除しますか。?");
			if(result){
				fm.t_work.value = "del";
				fm.t_f_number.value = f_num;
				fm.action ="/FaqUpdateServlet";
				fm.method ="post";
				fm.submit();
			}
		}
	
	</script>
	<%@ include file="/common/footer.jsp" %>
 </body>


</html>