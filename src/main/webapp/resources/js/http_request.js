var xhr = null;

// 요청 생성
function createRequest(){
	try {
		// 빈 객체 리턴
		if(xhr!=null)return;
		if(window.ActiveXObject)
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		else
			xhr = new XMLHttpRequest();
			
	} catch (error) {
        console.error("[Error] 요청 생성 : ", error.message);
	}
}

// 요청 전송
function sendRequest(url, param, callBack, method){
	try {
		// 요청 생성
		createRequest();
		
		// 옵션
		var httpMethod = (method!='POST' && method!='post')?'GET':'POST'; // 전송타입 지정
		var httpParam = (param==null || param == '')?null:param; // 파라미터 지정
		var httpURL = url; // 접근 URL 지정
		//
		if(httpMethod == 'GET' && httpParam != null)
			httpURL = httpURL+"?"+httpParam;
		
		xhr.open(httpMethod, httpURL, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = callBack;
		xhr.send(httpMethod == 'POST'?httpParam:null);
		
	} catch (error) {
        console.error("[Error] 요청 전송 : ", error.message);
	}
}