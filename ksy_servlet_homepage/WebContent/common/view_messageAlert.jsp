<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	window.alert("${t_msg}");
	window.location.href="${t_url}";
	//opener.document.location.href="${t_url}";
</script>
</body>
</html>