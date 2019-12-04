<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<label for="uiId">ID : </label>
	<input type="text" id="uiId"><br>
	<label for="uiPwd">비번 : </label>
	<input type="text" id="uiPwd"><br>
	<label for="uiName">이름 : </label>
	<input type="text" id="uiName"><br>
	<button onclick="insertUser()">신규생성</button>
</div>
<script>
function insertUser(){
	var param = {
			uiId : document.querySelector('#uiId').value,
			uiPwd : document.querySelector('#uiPwd').value,
			uiName : document.querySelector('#uiName').value
	}
	param = JSON.stringify(param);

	var xhr = new XMLHttpRequest();
	xhr.open('POST','/user/list/ajax');
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange= function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				var res = JSON.parse(xhr.responseText);
				if(res.cnt==1){
					alert('성공');
					location.href='/views/user/list';
				}
			}
		}
	}
	xhr.send(param);
}
</script>
</body>
</html>