<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/res/bt-4.4/js/jquery-3.4.1.min.js"></script>
<script src="/res/bt-4.4/js/bootstrap.min.js"></script>
<script src="/res/bt-4.4/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/res/bt-4.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="/res/bt-4.4/css/bootstrap-reboot.min.css" />
<link rel="stylesheet" href="/res/bt-4.4/css/bootstrap-grid.min.css" />
</head>
<body>

	<div class="container">
		<h4>난 유저리스트</h4>
		<div class="search">
			<label for="uiName">이름</label> <input type="checkbox"  name="search" value="ui_name"id="uiName">
			<label for="uiId">ID</label> <input type="checkbox"  name="search" value="ui_id" id="uiId">
			<label for="uiNum">번호</label> <input type="checkbox" name="search"  value="ui_num" id="uiNum">
			<input type="text" id="searchStr"><button>검색</button>
		</div>
		<table class="table table-bordered">
			<tr>
				<th><input type="checkbox" id="allCheck"></th>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
			</tr>
			<tbody id="tBody">

			</tbody>
		</table>
		<div class="buttons">
			<button onclick="deleteUsers()">삭제</button>
		</div>
	</div>
<script>
function deleteUsers(){
	var checks = document.querySelectorAll('[name=uiNum]:checked');
	var uiNums = [];
	for(var i=0;i<checks.length;i++){
		uiNums.push(checks[i].value);
	}
	var param = {
			uiNums : uiNums
	}
	param = JSON.stringify(param);

	var xhr = new XMLHttpRequest();
	xhr.open('DELETE','/user/list/ajax');
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange= function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				var res = JSON.parse(xhr.responseText);
				if(res.cnt>0){
					alert('성공');
					location.href='/views/user/list';
				}
			}
		}
	}
	xhr.send(param);
}
function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list/ajax?' + param);
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange= function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				var list = JSON.parse(xhr.responseText);
				var html ='';
				for(var user of list){
					html +='<tr>';
					html += '<th><input type="checkbox" name="uiNum" value="' + user.uiNum + '"></th>';
					html +='<td>' + user.uiNum +'</td>';
					html +='<td>' + user.uiName +'</td>';
					html +='<td>' + user.uiId +'</td>';
					html +='</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
			}else{
				console.log(xhr.responseText);
				alert('로그인이 필요한 요청입니다.');
				location.href='/views/user/login';
			}
		}
	}
	xhr.send();
}
window.onload= function(){
	getUserList('');
	var btn = document.querySelector('button');
	btn.onclick = function(){
		var checks = document.querySelectorAll('[name=search]:checked');
		if(checks.length==0){
			alert('검색대상을 1개라도 선택해주세요~');
			return;
		}
		var searchStr = document.querySelector('#searchStr');
		if(searchStr.value.trim().length<1){
			alert('검색어를 입력해주세요.');
			return;
		}
		
		var search = '';
		for(var i=0;i<checks.length;i++){
			search += 'search=' + checks[i].value + '&';
		}
		search +='searchStr=' + searchStr.value;
		getUserList(search);
	}
}
</script>
</body>
</html>