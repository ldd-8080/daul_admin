//	$(document).ready(function(){
//		getMemberBoard();
//	});	
//	
//	function getMemberBoard(){
//		var request = $.ajax({
//			url: "/main/getMemberBoard.do",
//			method: "post",
//			//contentType: "application/json",
//			//dataType: "json",
//			//data: $("#input-text-form").serialize()
//		});
//		request.done(function(data) {
//			memberBoard(data);
//		});
//		request.fail(function(error) {
//			console.log(error);
//			console.log("request fail");
//		});	
//	}
//	
//	function memberBoard(data){
//	
//	 var str = '<div class="counter counter-md">'+
//				'	<div class="counter-label text-uppercase">'+
//				'		<i class="icon wb-user mr-5 green-600 font-size-18" aria-hidden="true"></i>신규 회원'+
//				'	</div>'+
//				'	<div class="counter-number-group">'+
//				'		<span class="counter-number-related font-size-14">최근7일</span>'+
//				'		<span class="counter-number">55</span>'+
//				'	</div>'+
//				'	<div class="counter-label text-uppercase ">'+
//				'		<span class="counter-number-related small">누적 회원</span>'+
//				'		<span class="counter-number">6,381 </span>'+
//				'	</div>'+
//				'</div>'
//			$("#member-board").append(str);
//	}
//	