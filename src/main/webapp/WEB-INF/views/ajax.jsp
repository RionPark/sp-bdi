<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<input type="text" id="searchName">
<button>GET</button>
<button>POST JSON</button>
<button>DELETE JSON</button>
<div id="rDiv"></div>
<script>

var ajax = function(conf){
	var xhr = new XMLHttpRequest();
	xhr.open(conf.method, conf.url);
	if(conf.method!='GET'){
		xhr.setRequestHeader('Content-Type','application/json');
	}
	xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE){
			if(xhr.status == 200){
				conf.callback(xhr.responseText);
			}
		}
	}
	xhr.send(conf.data);
}

window.onload = function(){
	var btns = document.querySelectorAll('button');
	for(var i=0;i<btns.length;i++){
		var btn = btns[i];
		if(btn.innerText=='GET'){
			btn.onclick = function(){
				ajax({
					method:'GET',
					url : '/ajax?searchName=' + document.querySelector('#searchName').value,
					callback : function(res){
						res = JSON.parse(res);
						var html = '<ul>';
						for(var i=0;i<res.length;i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>'
						document.querySelector('#rDiv').innerHTML = html;	
					}
				});
			}
		}else if(btn.innerText=='POST JSON'){
			btn.onclick = function(){
				var param = {
						searchName : document.querySelector('#searchName').value,
				}
				ajax({
					method:'POST',
					url : '/ajax/json',
					callback : function(res){
						res = JSON.parse(res);
						var html = '<ul>';
						for(var i=0;i<res.length;i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>'
						document.querySelector('#rDiv').innerHTML = html;	
					},
					data : JSON.stringify(param)
				});
			}
		}else{
			btn.onclick = function(){
				var param = {
						searchName : document.querySelector('#searchName').value,
				}
				ajax({
					method:'DELETE',
					url : '/ajax',
					callback : function(res){
						res = JSON.parse(res);
						var html = '<ul>';
						for(var i=0;i<res.length;i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>'
						document.querySelector('#rDiv').innerHTML = html;	
					},
					data : JSON.stringify(param)
				});
			}
		}
	}
}
</script>
</body>
</html>