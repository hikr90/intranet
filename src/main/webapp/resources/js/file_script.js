var tempList = new Array();

$(function() {
	/* ================== file ================== */
	// 업로드
	$("#fileUpd").on('change', function() {
		// 파일, 화면 내 파일 추가
		var thisFiles = this.files; 
		var fileStr = "";
		
		// 다중 파일 처리 
		for(var i=0;i<thisFiles.length;i++){
			// 임시 목록 추가
			tempList.push(thisFiles[i]);
			
			// 전체 파일 목록 기준 인덱스
			var fileIdx = tempList.length - 1;
			
			// 화면 내 파일 추가
			fileStr += "<li id='fileLi" + fileIdx + "'>";
		    fileStr += "    <input type='hidden' id='fileId" + fileIdx + "' name='insert" + fileIdx + "' />";
		    fileStr += "    <img src='resources/images/icon/icon_file.png' width='20' height='20' />";
		    fileStr += "    <a href='javascript:void(0);' onclick=\"fileDel('insert', '" + fileIdx + "');\"><span>" + thisFiles[i].name + "</span></a>";
		    fileStr += "</li>";
		}		
		
		// 추가 후 초기화 
		$("#fileUl").append(fileStr);
		fileStr = "";
	});

	/* ================== profile ================== */
	// 초기화
	$("#profBtn").on("click", function () {
		$(this).val("");
	});
	
	// 프로필 변경
	$("#profBtn").change(function(e) {
		//
		if(this){
			var thisFiles = this.files; 
			var isUploadImg = $(this).val();
			var isFileYn = /(\.png|\.jpg|\.jpeg)$/i;
			tempList = [];
			
			// 유효성 검증
			if(!isUploadImg.match(isFileYn)){
				alert("사진(png, jpg, jpeg) 파일만 업로드 가능합니다.");
				return;
			}
			
			// 프로필 업로드 처리
			var reader = new FileReader();
			reader.readAsDataURL(e.target.files[0]); // 바이너리 데이터 읽기 (이벤트 발생한 태그 자체)

			// 콜백 함수 동작
			reader.onload = function(f) {
				// 화면 상 처리
				$("#empImg").attr("src",f.target.result); // 이미지 미리보기
				$("#profText").text(e.target.files[0].name); // 이미지 명칭 입력
			}
			
			// 파일 목록 추가
			tempList.push(thisFiles[0]);
			$("#isUploadImg").val('Y');
		}
	});
	
	// 프로필 삭제
	$("#profDel").click(function() {
		// 화면 상 처리
		$("#empImg").attr("src","resources/images/icon/icon_profile.png");
		$("#profText").text("사진을 등록해주세요.");
		$("#isUploadImg").val('N');
		tempList = [];
	});
});
 

// 첨부파일 삭제
function fileDel(status, idx) {
    try {
        // 대상
        var fileId = $("#fileId" + idx);
        var fileLi = $("#fileLi" + idx);

        // 현재 상태
        var name = fileId.attr("name");
        var currentStatus = name.indexOf("none") > -1 ? "none" : status;

        // 상태 변경
        var nextStatus = currentStatus === "none" ? status : "none";

        // name 변경
        fileId.attr("name", name.replace(currentStatus, nextStatus));

        // 화면 처리
        fileLi.find("span").css(
            "text-decoration",
            nextStatus === "none" ? "line-through" : ""
        );

    } catch (error) {
        console.error("[Error] 첨부파일 삭제 : ", error.message);
    }
}


// 폼 데이터 생성
function setFormData(){
	//
	var fileList = null;
	//
	try {
		//
		fileList = new FormData(document.getElementById("form"));
		//
		for(var i=0;i<tempList.length;i++){
			fileList.append("fileList", tempList[i]);
		}
		
	} catch (error) {
        console.error("[Error] 폼 데이터 생성 : ", error.message);
	}
	//
	return fileList;
}


// 다운로드
function fileProc(fileId, fileSno){
	try {
		formSubmit('intrFileProc1010.do?fileId='+fileId+'&fileSno='+fileSno);
	
	} catch (error) {
        console.error("[Error] 다운로드 : ", error.message);
	}
}
	
// 압축 다운로드
function zipProc(){
	try {
		formSubmit('intrFileProc1030.do');
	} catch (error) {
        console.error("[Error] 압축 다운로드 : ", error.message);
	}
}

// 참고문서 다운로드
function docDown(docCd){
	try {
		formSubmit('intrFileProc1020.do?docCd='+docCd);
	
	} catch (error) {
        console.error("[Error] 참고문서 다운로드 : ", error.message);
	}
}