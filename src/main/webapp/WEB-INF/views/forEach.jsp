<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var jsonStr = '[{"uiNums":null,"uiName":"test1","active":"1","uiId":"tt3","uiNum":91,"moddat":"20191129","modtim":"101358","credat":"20191129","cretim":"101358","uiPwd":"1234","search":null,"searchStr":null}]'
var list = JSON.parse(jsonStr);
list.forEach(ui=>{
	ui.id = ui.uiNum;
})

var list2 = JSON.parse(JSON.stringify(list));

list2[0].uiNum = 10;
console.log(list);
console.log(list2);
</script>
</body>
</html>













