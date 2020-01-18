<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Member_DAO"%>

<html lang="ko">
<head>
<meta charset="utf-8">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
		<script src="/js/jquery-3.3.1.min.js"></script>
<title>enter your info</title>
</head>
<style>
	#contain {
		width: 410px;
		margin: 20px 20px 20px 20px;
		padding: 10px;
		border: 1px solid #bcbcbc;
		background-color:#F2F2F2;
	}
	#box1 {
		width:390px;
		height:200px;
		padding: 10px;
		border: 1px solid #bcbcbc;
		color: #333;
	}	
	#t2 {
		width: 320px;
		border:0px solid #CAC9D2;
	}
	
	.t1{
		font-size:25px;	
		color:#67656f;
	}	
	#t2 i {
	vertical-align: center;
	margin-left:30px;
	margin-top:10px;
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
		var fm =document.info;
		if(fm.t_id.value ==""){
			alert("enter id");
			return;
		}
		if(fm.t_email1.value ==""){
			alert("enter email");
			return;
		}
		if(fm.t_email2.value ==""){
			alert("enter email");
			return;
		}
		fm.action ="/memberGetPass";
		fm.method ="post";
		fm.submit();
		//window.close();
	}
	
	function confirm_cancel(){
		 window.close();
	 }
</script>
<body>
	<div id="contain">
		<div id="box1">

		
			<TABLE id="t2" >
<form name = "info">
	<input type="hidden" name="reject" value="${t_reject}"/>
				<TR align=center >
					<p>id</p>
					<input type="text" name="t_id" />
					<p>e-mail</p>
					<input type="text" name="t_email1" class="email" id ="email1">&#64;
					<input type="text" name="t_email2" class="email" id ="email2">
				</TR>
				<TR align=center >
					<td>
						<a href="javascript:confirm()" title="Search"><i id ="yes" class="far fa-smile-wink"></i></a>
						&nbsp;&nbsp;&nbsp;
						<a href="javascript:confirm_cancel()" title="Cancel"><i id ="no" class="fas fa-sad-tear"></i></a>
					</td>
				</TR>
</form>
			</TABLE>	

		</div>
	</div>
</body>
</html>