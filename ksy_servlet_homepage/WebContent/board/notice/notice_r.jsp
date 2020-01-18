<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/common/header.jsp" %>


 <body>
	


	<div class="sub_title">
		<h2>公知事項</h2>
	</div>

	<div class="container">
		<div class="search_wrap">
			<div class="record_group">
				<p>銃掲示物  <span>${igal}</span>つ</p>
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
						<th>番号</th>
						<th>題目</th>
						<th>添付ファイル</th>
						<th>作成者</th>
						<th>登録日</th>
						<th>hit</th>
					</tr>
				</thead>
				<tbody>
	<c:set var="forYN" value="true"/>
	<c:set var="fileSt" value="stay"/>
	<c:if test="${t_dtos.size() >0}">
		<c:forEach items="${t_dtos}" var="dto">	
			<c:if test="${forYN}">
				<c:if test="${v_count == for_count}">
			
					<c:choose>
					<c:when test="${dto.getFile_name_1() != null }">	
						<c:set var="fileSt" value="stay"/> 
					</c:when>
					<c:otherwise>
						<c:set var="fileSt" value="success"/> 
   					</c:otherwise>
					</c:choose>
				
					<tr>
						<td>${dto.getNotice_no()}</td>
						<td class="title"><a href="javascript:gonv('${dto.getNotice_no()}');">${dto.getTitle()}</a></td>
						<td class="${fileSt}"><span>File</span></td>
						<td>${dto.getReg_id()}</td>
						<td>${dto.getReg_date()}</td>
						<td>${dto.getHit()}</td>
					</tr>
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
		
	<c:if test="${t_dtos.size() == 0}">		
					<tr>
						<td colspan="5">登録された文がありません。</td>
					</tr>
	</c:if>
			</tbody>	
			</table>
			
				<div class="paging">
				<a href=""><i class="fa fa-angle-double-left"></i></a>
				<a href=""><i class="fa fa-angle-left"></i></a>
<%
			Integer cp = (Integer)request.getAttribute("current_page");
			int current_page = cp.intValue();
			Integer tp = (Integer)request.getAttribute("total_page");
			int total_page = tp.intValue();
			out.println(common.CommonUtil.pageList(current_page, total_page));
%>	
				<a href=""><i class="fa fa-angle-right"></i></a>
				<a href=""><i class="fa fa-angle-double-right"></i></a>
				<a href="javascript:gowi();" class="write">글쓰기</a>	
	<form name ="gov">
	<input type="hidden" name="t_noticeNo">
	<input type="hidden" value="gov" name="t_work">
	</form>	
		</div>
	</div>
	<form name ="gwgw">
		<input type="hidden" value="gonw" name="t_work">
	</form>

	
	<script>
	
	function gonv(notice_no){
		var fm = document.gov;
		fm.t_noticeNo.value = notice_no;
		fm.action ="/OpenNoticeV";
		fm.method ="post";
		fm.submit();
	}
	
	function gowi(){
		var fm = document.gwgw;
		fm.action ="/HubServlet";
		fm.method ="post";
		fm.submit();
	}
	function formSearch(){
		var fm = document.myform;
		fm.action ="/NoticeList";
		fm.method ="post";
		fm.submit();
	}
	function gopage(pageNum){
		var fm = document.myform;
		fm.r_page.value = pageNum;
		fm.action ="/NoticeList";
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
