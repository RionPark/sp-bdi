<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp" />
<style>
div#userGrid{
	width:402px;
	height:300px;
}
</style>
</head>
<body>
<div id="userGrid"></div>
<button onclick="pickData()">데이터</button>
<script>
function pickData(){
	var row = grid.data.getItem(91);
	console.log(row);
}
var list = [];
var grid;
function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list/ajax?' + param);
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange= function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				console.log(xhr.responseText);
				list = JSON.parse(xhr.responseText);
				list.forEach(ui=>{
					ui.id = ui.uiNum;
				})
				grid = new dhx.Grid('userGrid',{
					columns : [
						{width:100,id:'uiNum',header:[{text:'번호'}],editing:false},
						{width:100,id:'uiId',header:[{text:'아이디'}]},
						{width:100,id:'uiName',header:[{text:'이름'}]},
						{width:100,id:'credat',header:[{text:'가입일'}],type:'date', dateFormat:'%Y%m%d'}
					],
					headerRowHeight:20,
					data : list,
					editing:true
				});
				grid.events.on('CellClick',function(row,column){
					console.log(row);
					console.log(column);
				})
			}else{
				console.log(xhr.responseText);
				alert('로그인이 필요한 요청입니다.');
				location.href='/views/user/login';
			}
		}
	}
	xhr.send();
}
window.onload = function(){
	getUserList();
}
</script>
</body>
</html>