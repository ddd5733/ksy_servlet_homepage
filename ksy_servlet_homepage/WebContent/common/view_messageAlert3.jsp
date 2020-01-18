<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="ff">
	<input type = "hidden" name="t_work" value="${t_work}"/>
</form>
<script type="text/javascript">
	var fm = document.ff;
	alert("${t_msg}");
	fm.action = "${t_url}";
	fm.method = "post";
	fm.submit();
</script>
</body>
</html>