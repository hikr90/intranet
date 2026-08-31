// 트리 생성
function setTree(area) {
	try {
		// 영역 생성
		var tree = $('.'+area+' .tree');
		
		// 버튼 생성
		var treeBtn = '\<button type=\"button\" class=\"treeBtn\"\>-\<\/button\>';
		
		// 버튼 추가
		tree.find("ul > ul > li .orgCd").before(treeBtn);
		
		// 버튼 클릭 시
		tree.find("button").click(function(){
			// 닫음 (-)
			if ($(this).hasClass("treeMinus")) {
				$(this).parent().nextAll().slideUp(200); 								// 하위 제거
				$(this).text("+"); 																	// 아이콘 변경
				$(this).removeClass("treeMinus").addClass("treePlus");			// 클래스 제거 후 생성
			// 오픈 (+)
			} else {
				$(this).parent().nextAll().slideDown(200);
				$(this).text("-"); 
				$(this).removeClass("treePlus").addClass("treeMinus");
			}
		});
		
	} catch (error) {
        console.error("[Error] 트리 생성 : ", error.message);
	}
}
