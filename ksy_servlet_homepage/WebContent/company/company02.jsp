<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<div class="sub_title">
		<h2>こちらへ</h2>
	</div>

	<div class="container">
		<div class="board_list">
			<table cellpadding="0" cellspacing="0" width="536"> <tr> <td style="border:1px solid #cecece;">
			<a href="https://map.naver.com/v5/directions/-/14302328.533288594,4280184.449318163,%EC%84%B1%EC%84%9C%EC%82%BC%EC%84%B1%ED%95%9C%EA%B5%AD%ED%98%95%EC%95%84%ED%8C%8C%ED%8A%B8,16413902,PLACE_POI/-/transit?c=14302095.6392716,4280184.4492472,16,0,0,0,dh" target="_blank"><img src="http://prt.map.naver.com/mashupmap/print?key=p1540954577821_1620650096" width="534" height="418" alt="지도 크게 보기" title="지도 크게 보기" border="0" style="vertical-align:top;"/></a></td> </tr> <tr> <td> <table cellpadding="0" cellspacing="0" width="100%"> <tr> <td height="30" bgcolor="#f9f9f9" align="left" style="padding-left:9px; border-left:1px solid #cecece; border-bottom:1px solid #cecece;"> <span style="font-family: tahoma; font-size: 11px; color:#666;">2018.10.31</span>&nbsp;<span style="font-size: 11px; color:#e5e5e5;">|</span>&nbsp;<a style="font-family: dotum,sans-serif; font-size: 11px; color:#666; text-decoration: none; letter-spacing: -1px;" href="https://map.naver.com/?searchCoord=c8a84cf6d4db59f554db25e232138d296a9c21a19e2445417a5b36ab09c8d419&query=64yA7KCEIOu5hOygvOyngeyXheyghOusuO2Vmeq1kA%3D%3D&menu=location&tab=1&lng=ef8479b4826315070fe394dc6ec9dbdf&mapMode=0&mpx=8914c0362b6c669d1c538a7c9ae8ed4ddef1e5e486a0bb6f51f31d9094439a6f27ffae35f7a656fa853bc6b78387f735f754a7e77f759ad1601f033fd22d3b91&lat=59840a6ae1187a9f0f86c416dc216777&dlevel=10&enc=b64" target="_blank">지도 크게 보기</a> </td> <td width="98" bgcolor="#f9f9f9" align="right" style="text-align:right; padding-right:9px; border-right:1px solid #cecece; border-bottom:1px solid #cecece;"> <span style="float:right;"><span style="font-size:9px; font-family:Verdana, sans-serif; color:#444;">&copy;&nbsp;</span>&nbsp;<a style="font-family:tahoma; font-size:9px; font-weight:bold; color:#2db400; text-decoration:none;" href="http://www.nhncorp.com" target="_blank">
			NAVER Corp.
			</a>
			</span> </td> </tr> </table> </td> </tr> </table>

			<ul class="map_table">
				<li><strong>住所 :</strong> 大邱広域市達西区138-7</li>
				<li><strong>お客様  センター:</strong> 010-2231-5733</li>
				<li><strong>Eメール :</strong> tjddyd5733@naver.com</li>
			</ul>
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
 </body>


</html>
