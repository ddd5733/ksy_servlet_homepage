<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/common/header.jsp" %>


<script>
</script>

 <body>
	


	<div class="sub_title">
		<h2>1:1 상담</h2>
	</div>

	<div class="container">
		<div class="search_wrap">
			<div class="record_group">
				<p>銃掲示物  <span>${igal}</span>건</p>
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
			<table class="board_table" summary="이표는 번호, 제목, 글쓴이, 날자, 조회수로 구성되어 있습니다">
				<caption class="sr-only">공지사항 리스트</caption>
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>답변상태</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>8</td>
						<td class="title"><a href="board03_view.html">표작성방법을 알아보자</td>
						<td class="stay"><span>답변대기</span></td>
						<td>관리자</td>
						<td>2018-10-16</td>
						<td>187</td>
					</tr>
					<tr>
						<td>8</td>
						<td class="title"><a href="">표작성방법을 알아보자</td>
						<td class="success"><span>답변완료</span></td>
						<td>관리자</td>
						<td>2018-10-16</td>
						<td>187</td>
					</tr>
					<tr>
						<td>8</td>
						<td class="title"><a href="">표작성방법을 알아보자</td>
						<td class="stay"><span>답변대기</span></td>
						<td>관리자</td>
						<td>2018-10-16</td>
						<td>187</td>
					</tr>
				</tbody>
			</table>
			<div class="paging">
				<a href=""><i class="fa fa-angle-double-left"></i></a>
				<a href=""><i class="fa fa-angle-left"></i></a>
				<a href="">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href=""><i class="fa fa-angle-left"></i></a>
				<a href=""><i class="fa fa-angle-double-right"></i></a>
				<a href="javascript:gowi();" class="write">글쓰기</a>
			</div>
		</div>
	</div>
	<form name ="gwgw">
		<input type="hidden" value="gonw" name="t_work">
	</form>
	<script>
	function gowi(){
		var fm = document.gwgw;
		fm.action ="/membernubServlet";
		fm.method ="post";
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
	<%@ include file="/common/footer.jsp"  %>
 </body>


</html>
