// 결재선 UI 공통 이벤트
const AprvLineUI = {
    init: function() {
        // 목록 open & close
        $(document).off("click", ".pop_sbox").on("click", ".pop_sbox", function () {
            $(".pop_sul").not($(this).siblings(".pop_sul")).hide(); 
            $(this).siblings(".pop_sul").toggle(); 
        });
        
        // 목록 선택
        $(document).off("click", ".pop_sul li").on("click", ".pop_sul li", function () {
            var setNm = $(this).attr("setNm");
            var setCd = $(this).attr("setCd");
            var setIdx = $(this).attr("setIdx");
        
            // 값 지정
            $(this).closest('div').parent().find('.pop_sbox').text(setNm);
            $(this).closest('div').parent().find('input[name=aprvtypeCd]').val(setCd);
            $(this).closest('div').parent().find('input[name=aprvIdx]').val(setIdx);
        
            // 목록 닫기
            $(this).parent(".pop_sul").hide();
        });
        
        // 목록 외부 선택
        $(document).off("click.outside").on("click.outside", function (e) {
            if (!$(e.target).closest(".pop_sbox").length) {
                $(".pop_sul").hide();
            }
        });
        
        // hover 이벤트
        $(document).off("mouseenter", ".pop_sul li").on("mouseenter", ".pop_sul li", function() {
            $(this).addClass("hover").siblings().removeClass("hover");
        });
        
        $(document).off("mouseleave", ".pop_sul li").on("mouseleave", ".pop_sul li", function() {
            $(this).removeClass("hover");
        }); 
    }
}

// 프로젝트 팝업
function projCall(){
	try {
		//
		var obj = new Object();
		obj["mappingId"] = "intrPopupInqy1030.do";
		obj["areaType"] = "proj";
		obj["width"] = "600"
		obj["height"] = "370";
		//		
		ajaxPopup(obj);		
		
	} catch (error) {
        console.error("[Error] 프로젝트 팝업 : ", error.message);
	}
}
	
// 담당자 팝업
function empCall(){
	try {
		//
		var obj = new Object();
		obj["mappingId"] = "intrPopupInqy1011.do";
		obj["areaType"] = "emp";
		obj["width"] = "550"
		obj["height"] = "420";
		//		
		ajaxPopup(obj);

	} catch (error) {
	    console.error("[Error] 담당자 팝업 : ", error.message);
	}
}

// 결재선 등록 팝업
function lineReg(){
	//
	try {
		// 유효성 검증
		if(!valProc()){return;};

		// 물품 등록 검증
		if($('#temptypeCd').val() == 'ITEM'){
			if(Array.isArray(itemlineList) && itemlineList.length === 0){
				alert("물품이 등록되지 않았습니다.");
				return;
			}
		}
			
		// 정산 내역 검증
		if($('#temptypeCd').val() == 'CORP'){
			if(Array.isArray(corplineList) && corplineList.length === 0){
				alert("정산내역이 등록되지 않았습니다.");
				return;
			}				
		}
		//
		var obj = new Object();

		obj["mappingId"] = "intrPopupInqy1041.do";
		obj["areaType"] = "line";
		obj["width"] = "1100";
		obj["height"] = "670";
		//		
		ajaxPopup(obj);

	} catch (error) {
        console.error("[Error] 결재선 등록 팝업 : ", error.message);
	}
}

// 결재선 조회 팝업
function lineCall(aprvId){
	try {
		//
		var obj = new Object();
		
		obj["mappingId"] = "intrPopupInqy1042.do";
		obj["areaType"] = "line";
		obj["sequenceId"] = aprvId;
		obj["width"] = "1100";
		obj["height"] = "620";
		//		
		ajaxPopup(obj);

	} catch (error) {
        console.error("[Error] 결재선 조회 팝업 : ", error.message);
	}
}

// 물품 등록 팝업
function itemReg(){
	try {
		//
		var obj = new Object();
		
		obj["mappingId"] = "intrPopupInqy1061.do";
		obj["areaType"] = "item";
		obj["width"] = "1100"
		obj["height"] = "620";
		//		
		ajaxPopup(obj);
		
	} catch (error) {
        console.error("[Error] 물품 등록 팝업 : ", error.message);
	}
}

// 물품 조회 팝업
function itemCall(aprvId){
	try {
		//
		var obj = new Object();

		obj["mappingId"] = "intrPopupInqy1062.do";
		obj["areaType"] = "item";
		obj["sequenceId"] = aprvId;
		obj["width"] = "1100"
		obj["height"] = "620";
		//		
		ajaxPopup(obj);

	} catch (error) {
        console.error("[Error] 물품 조회 팝업 : ", error.message);
	}
}

// 정산내역 등록 팝업
function corpReg(){
	try {
		//
		var obj = new Object();

		obj["mappingId"] = "intrPopupInqy1071.do";
		obj["areaType"] = "corp";
		obj["width"] = "1100"
		obj["height"] = "620";
		//		
		ajaxPopup(obj);
		
	} catch (error) {
        console.error("[Error] 정산내역 등록 팝업 : ", error.message);
	}
}

// 정산내역 조회 팝업
function corpCall(aprvId){
	try {
		//
		var obj = new Object();
		
		obj["mappingId"] = "intrPopupInqy1072.do";
		obj["areaType"] = "corp";
		obj["sequenceId"] = aprvId;
		obj["width"] = "1100"
		obj["height"] = "620";
		//		
		ajaxPopup(obj);
	
	} catch (error) {
        console.error("[Error] 정산내역 입력 팝업 : ", error.message);
	}
}

// 결재의견 입력 팝업
function opinCall(method){
	try {
		//
		var obj = new Object();
		
		obj["mappingId"] = "intrPopupInqy1050.do";
		obj["areaType"] = "opin";
		obj["width"] = "550";
		obj["height"] = "330";
		//
		$("#rslttypeCd").val(method);
		ajaxPopup(obj);

	} catch (error) {
        console.error("[Error] 결재의견 입력 팝업 : ", error.message);
	}
}

// 결재의견 처리
function opinConf(area) {
	//	
	try {
		// 유효성 검증
		var aprvPwd = $("#aprvPwd").val();
		if(aprvPwd == '') {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		//
		var param = $("#form").serialize();
		//
		if(confirm("처리하시겠습니까?")) {
			$.ajax({
	    		type : 'post',
	        	url : 'intrAprvProc1020.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
						var json = eval(data);
   						if(json[0].res == "YES"){
   							//
							alert("작업이 완료되었습니다.");
							formSubmit('intrAprvInqy2010.do');
				
   						} else if(json[0].res == "PWD") {
							alert("비밀번호를 확인해주세요.");
							return;
	
	   					} else {
							alert("작업이 실패하였습니다.");
							return;
						}
	            },
	            error : function(data){
					alert("관리자에게 문의해주세요.");
	            }
	      	});
		}
					
	} catch (error) {
        console.error("[Error] 결재 처리 : ", error.message);
	}
}

// 결재 취소
function cnlProc(rslttypeCd) {
	try {
		//
		if(confirm("결재를 취소하시겠습니까?")) {
			$("#rslttypeCd").val(rslttypeCd);
			formSubmit("intrAprvProc1020.do");
		}
		
	} catch (error) {
        console.error("[Error] 결재 취소 : ", error.message);
	}
}