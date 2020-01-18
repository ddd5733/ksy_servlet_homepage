<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Member_DAO"%>
<%
	String nickName = (String)request.getAttribute("t_nname");
	String result = (String)request.getAttribute("t_result");
%>
<html lang="ko">
<head>
<meta charset="utf-8">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
		<script src="/js/jquery-3.3.1.min.js"></script>
<title>닉네임 중복검사</title>
</head>
<style>
	#contain {
		
		width: 360px;
		margin: 20px 20px 20px 20px;
		padding: 10px;
		border: 1px solid #bcbcbc;
		background-color:#F2F2F2;
	}
	#box1 {
		width:340px;
		height:150px;
		padding: 10px;
		border: 1px solid #bcbcbc;
		color: #333;
	}	
	#t2 {
		width: 320px;
		border:0px solid #CAC9D2;
	}
	
	.t1{
		text-align:center;
		font-size:25px;	
		color:#67656f;
	}	
	#t2 i {
	font-size:30px;
	color:#FFFFFF;
	}	
	#t2 #yes {
		color:#FFFFFF;
	
	}	
	#t2 #no {
		color:#FFFFFF;
	}
	#t2 #yes:hover {
		color:#40FF00;
		font-size:50px;
	
	}	
	#t2 #no:hover {
		color:#FF0000;
		font-size:50px;
	}	

</style>
<script language="JavaScript">
	function confirm(){
		opener.document.admin.t_nname2.value ="<%=nickName%>";
		//opener==부모(열어준창) ,id_check_value =받아온값 ,value =?
		opener.document.admin.t_adress.focus();
		window.close();
	}
	 function confirm_cancel(){
	  	 opener.document.admin.t_nname2.value =""; 
		 opener.document.admin.t_nname.focus();
		 window.close();
	 }
</script>
<body>
	<div id="contain">
		<div id="box1">

		
			<TABLE id="t2" >
<%
				// 중복 앙~ 되어있을때
				if(result.equals("0")){
%>			
				<TR align=center >
					<td height="90"><p class="t1">사용 가능한 닉네임입니다</p></td>
				</TR>
				<TR align=center >
					<td>
						<a href="javascript:confirm()"><i id ="yes" class="far fa-smile-wink"></i></a>
						&nbsp;&nbsp;&nbsp;
						<a href="javascript:confirm_cancel()"><i id ="no" class="fas fa-sad-tear"></i></a>
					</td>
				</TR>
<%
				// 중복 되어있을때
				} else if(result.equals("1")){
%>	
				<TR align=center >
					<td height="90"><p class="t1">이미 등록된 닉네임 입니다.<br>다른 닉네임를 사용하세요!</p></td>
				</TR>
				<TR align=center >
					<td>
						<a href="javascript:confirm_cancel()"><i  id ="no" class="fas fa-sad-tear"></i></a>
					</td>
				</TR>
<%
				} 
%>	
			</TABLE>	

		</div>
	</div>
</body>
</html>